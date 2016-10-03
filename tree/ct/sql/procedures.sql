USE `tree`;

DROP PROCEDURE IF EXISTS `tree_ct_add`;
DROP PROCEDURE IF EXISTS `tree_ct_del`;
DROP PROCEDURE IF EXISTS `tree_ct_move`;
DROP TRIGGER IF EXISTS `tai_cttree`;

CREATE PROCEDURE `tree_ct_add`(
	in param_parent_id int(11),
	in param_header varchar(255)
)
procedure_label:BEGIN
	DECLARE is_parent_exist INT DEFAULT 0;

	START TRANSACTION;

	-- Проверить родителя и заблокировать его на удаление/изменение.
	IF param_parent_id <> 0 THEN
		SELECT count(`id`) INTO is_parent_exist
		FROM `ct_tree`
		WHERE `id` = param_parent_id
		LOCK IN SHARE MODE;
		IF is_parent_exist = 0 THEN
			SELECT 'parent not exist';
			ROLLBACK;
			LEAVE procedure_label;
		END IF;
	END IF;

	-- Вставляем данные
	INSERT INTO `ct_tree` (`pid`, `header`)
	VALUES (param_parent_id, param_header);

	COMMIT;
END;

CREATE TRIGGER `tai_cttree` AFTER INSERT ON `ct_tree` FOR EACH ROW
BEGIN
	IF @disable_triggers IS NULL THEN
		-- Вставляем связи
		INSERT INTO `ct_tree_rel` (`aid`, `did`)
			-- Выбираем связи предков с родителем (did = idРодителя)
			-- и вставляем записи типа: idПредка, нашId
			SELECT `aid`, NEW.`id`
			FROM `ct_tree_rel`
		    WHERE `did` = NEW.`pid`
			-- Родитель тоже предок
		    UNION ALL
		    SELECT NEW.`pid`, NEW.`id`;
	END IF;
END;

CREATE PROCEDURE `tree_ct_del`(
	in param_id int(11)
	-- ,in param_r tinyint(1)
)
procedure_label:BEGIN
	DECLARE is_element_exist INT DEFAULT 0;
	DECLARE count_childrens INT DEFAULT 0;

	START TRANSACTION;

	-- Проверить существование элемента и заблокировать его на чтение.
	SELECT count(`id`) INTO is_element_exist
	FROM `ct_tree`
	WHERE `id` = param_id
	FOR UPDATE;
	IF is_element_exist = 0 THEN
		SELECT 'element not exist';
		ROLLBACK;
		LEAVE procedure_label;
	END IF;

	-- Проверить существование наследников.
	SELECT count(`id`)
	INTO count_childrens
	FROM `ct_tree`
	WHERE `pid` = param_id;

	IF count_childrens > 0 THEN
		SELECT 'element has children';
		ROLLBACK;
		LEAVE procedure_label;
	END IF;

	DElETE FROM `ct_tree`
	WHERE `id` = param_id;

	COMMIT;
END;

CREATE TRIGGER `tbd_cttree` BEFORE DElETE ON `ct_tree` FOR EACH ROW
BEGIN
		DElETE FROM `ct_tree_rel`
		WHERE `aid` = OLD.`id` OR `did` = OLD.`id`;
END;

CREATE PROCEDURE `tree_ct_move`(
	in param_eid int(11),
	in param_tid int(11)
)
procedure_label:BEGIN
	DECLARE count_descendant INT DEFAULT 0;
	DECLARE is_tid_exist INT DEFAULT 0;

	START TRANSACTION;

	-- Нельзя перемещать в себя
	IF param_eid = param_tid THEN
		SELECT 'into itself';
		LEAVE procedure_label;
	END IF;

	-- Нельзя перемещать несуществующий
	-- Блокируем на обновление/удаление
	SELECT count(*)
	INTO is_tid_exist
	FROM `ct_tree`
	WHERE `id` = param_eid
	LOCK IN SHARE MODE;

	IF is_tid_exist < 1 THEN
		SELECT 'eid not exist';
		ROLLBACK;
		LEAVE procedure_label;
	END IF;

	-- Нельзя перемещать в несуществующий
	-- Блокируем на обновление/удаление
	SELECT count(*)
	INTO is_tid_exist
	FROM `ct_tree`
	WHERE `id` = param_tid
	LOCK IN SHARE MODE;

	IF is_tid_exist < 1 THEN
		SELECT 'tid not exist';
		ROLLBACK;
		LEAVE procedure_label;
	END IF;

	-- Нельзя перемещать в своих потомков
	SELECT count(*)
	INTO count_descendant
	FROM `ct_tree_rel` r
	WHERE
		r.`aid` = param_eid
		AND r.`did` = param_tid;

	IF count_descendant > 0
	THEN
		SELECT 'into descendant';
		LEAVE procedure_label;
	END IF;

	UPDATE `ct_tree`
	SET `pid` = param_tid
	WHERE `id` = param_eid;

	COMMIT;
END;

CREATE TRIGGER `tbu_cttree` BEFORE UPDATE ON `ct_tree` FOR EACH ROW
BEGIN
	-- Если родитель изменился.
	IF OLD.`pid` <> NEW.`pid` THEN
		-- Удаляем связи элемента с предками.
		DElETE FROM `ct_tree_rel`
		WHERE `did` = OLD.`pid`;

		-- Удалить связи потомков элемента со старыми предками!
		-- Вставить связи между потомками элемента с новыми предками!

		-- Вставляем связи элемента с новыми предками.
		INSERT INTO `ct_tree_rel` (`aid`, `did`)
			SELECT `aid`, OLD.`pid`
			FROM `ct_tree_rel`
			WHERE `did` = NEW.`pid`
			UNION ALL
			SELECT NEW.`pid`, OLD.`pid`;
	END IF;
END;

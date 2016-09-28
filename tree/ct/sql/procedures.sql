use `tree`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
drop procedure if exists `tree_ct_add`;
create procedure `tree_ct_add`(
	in param_parent_id int(11),
	in param_header varchar(255)
)
BEGIN
	DECLARE last_id INT(11);

	-- Вставляем данные
	INSERT INTO `ct_tree` (`pid`, `header`)
	VALUES (param_parent_id, param_header);

	-- Определяем id нового элемента
	SET last_id = LAST_INSERT_ID();

	-- Вставляем связи
	INSERT INTO `ct_tree_rel` (aid, did)
		-- Выбираем всех родителей (did = id нашего предока)
		-- и вставляем записи типа: idПредка, нашId
		SELECT
			`aid`, `last_id`
		FROM
			`ct_tree_rel`
	    WHERE
			`did` = param_parent_id;
	--     UNION ALL
	--     SELECT @lastID, @lastID
END;
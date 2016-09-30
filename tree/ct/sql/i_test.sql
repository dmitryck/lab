SET @disable_triggers = 1;

INSERT INTO `ct_tree`
(`id`,`pid`,`header`)
VALUES
-- 1
(1,0,'e1'),
-- 2
(2,1,'e2'),
(3,1,'e3'),
(4,1,'e4'),
-- 3
(5,3,'e5'),
(6,4,'e6'),
(7,4,'e7'),
-- 4
(8,6,'e8'),
(9,7,'e9');

INSERT INTO `ct_tree_rel`
(`aid`,`did`)
VALUES
-- 2
(1,2),
(1,3),
(1,4),
-- 3
(3,5),
(1,5),

(4,6),
(1,6),

(4,7),
(1,7),
-- 4
(6,8),
(4,8),
(1,8),

(7,9),
(4,9),
(1,9);

SET @disable_triggers = NULL;

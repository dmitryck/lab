source /home/iadfeshchm/projects/my/lab/lab/rbac/rbac_mysql/sql/recreate_schema.sql;
USE lab;
source /home/iadfeshchm/projects/my/lab/lab/rbac/rbac_mysql/sql/recreate_tables.sql;
source /home/iadfeshchm/projects/my/lab/lab/rbac/rbac_mysql/sql/recreate_procedures.sql;
source /home/iadfeshchm/projects/my/lab/lab/rbac/rbac_mysql/sql/recreate_triggers.sql;
source /home/iadfeshchm/projects/my/lab/lab/rbac/rbac_mysql/sql/recreate_triggers_rolerel.sql;

CALL add_user('Златов'); --  администратор
CALL add_user('Иванов'); --  директор проекта ЦСП
CALL add_user('Петров'); --  старший менеджер проекта ЦСП
CALL add_user('Сарнычева'); --  старший менеджер проекта ЦСП
CALL add_user('Сидоров'); --  младший менеджер проекта ЦСП
CALL add_user('Гринина'); --  младший менеджер проекта ЦСП
CALL add_user('Огаркова'); --  младший менеджер проекта ЦСП
CALL add_user('Пастух'); --  директор проекта ВИПС
CALL add_user('Вергунова'); --  старший менеджер проекта ВИПС
CALL add_user('Нилов'); --  старший менеджер проекта ВИПС
CALL add_user('Моргунов'); --  младший менеджер проекта ВИПС
CALL add_user('Носатенко'); --  младший менеджер проекта ВИПС
CALL add_user('Ясавеева'); --  младший менеджер проекта ВИПС

CALL add_object(NULL, 'ЦСП',      'csp'        ); -- 1
CALL add_object(1,    'Каталог',  'csp_catalog'    ); -- 2
CALL add_object(2,    'Seo',      'csp_seo'        ); -- 3
CALL add_object(1,    'Продукт',  'csp_product'    ); -- 4
CALL add_object(4,    'Seo',      'csp_seo'        ); -- 5
CALL add_object(NULL, 'ВИПС',     'vips'       ); -- 6
CALL add_object(6,    'Каталог',  'catalog'    ); -- 7
CALL add_object(7,    'Seo',      'seo'        ); -- 8
CALL add_object(6,    'Продукт',  'product'    ); -- 9
CALL add_object(9,    'Seo',      'seo'        ); -- 10
CALL add_object(NULL, 'Филиалы',  'affiliates' ); -- 11
CALL add_object(11,   'Seo',      'seo'        ); -- 12

CALL add_perm('read_all_csp', 1, 'Читать всё ЦСП'); -- 1
CALL add_perm('edit_all_csp', 1, 'Изменять всё ЦСП'); -- 2
CALL add_perm('read_catalog_csp', 2, 'Читать Каталог ЦСП'); -- 3
CALL add_perm('edit_catalog_csp', 2, 'Изменять Каталог ЦСП'); -- 4
CALL add_perm('read_products_csp', 3, 'Читать Продукты ЦСП'); -- 5
CALL add_perm('edit_products_csp', 3, 'Изменять Продукты ЦСП'); -- 6
CALL add_perm('read_all_vips', 4, 'Читать всё ВИПС'); -- 7
CALL add_perm('edit_all_vips', 4, 'Изменять всё ВИПС'); -- 8
CALL add_perm('read_catalog_vips', 5, 'Читать Каталог ВИПС'); -- 9
CALL add_perm('edit_catalog_vips', 5, 'Изменять Каталог ВИПС'); -- 10
CALL add_perm('read_products_vips', 6, 'Читать Продукты ВИПС'); -- 11
CALL add_perm('edit_products_vips', 6, 'Изменять Продукты ВИПС'); -- 12
CALL add_perm('read_affiliates', 7, 'Читать Филиалы'); -- 13
CALL add_perm('edit_affiliates', 7, 'Изменять Филиалы'); -- 14

CALL add_role('Администратор'); -- 1
CALL add_role('Seo специалист'); -- 2
CALL add_role('Директор'); -- 3
CALL add_role('Руководитель проекта ЦСП'); -- 3
CALL add_role('Руководитель проекта ВИПС'); -- 3
CALL add_role('Старший менеджер проекта ЦСП'); -- 4
CALL add_role('Старший менеджер проекта ВИПС'); -- 4
CALL add_role('Менеджер проекта ЦСП'); -- 4
CALL add_role('Менеджер проекта ВИПС'); -- 4
CALL add_role('Младший менеджер проекта ЦСП'); -- 5
CALL add_role('новый менеджер проекта ЦСП'); -- 4
CALL add_role('новый менеджер проекта ВИПС'); -- 4

CALL assign_role_parent(4,5);
CALL assign_role_parent(3,4);
CALL assign_role_parent(1,3);
CALL assign_role_parent(1,2);

CALL assign_permission_role(1,1);
CALL assign_permission_role(2,2);
CALL assign_permission_role(3,3);
CALL assign_permission_role(4,4);
CALL assign_permission_role(5,5);
-- CALL assign_permission_role(6,1);
-- CALL assign_permission_role(7,1);
-- CALL assign_permission_role(8,1);
-- CALL assign_permission_role(9,1);
-- CALL assign_permission_role(10,1);
-- CALL assign_permission_role(11,1);
-- CALL assign_permission_role(12,1);
-- CALL assign_permission_role(13,1);
-- CALL assign_permission_role(14,1);

CALL assign_role_user(1,1);


-- CALL add_role('1'); -- 1
-- CALL add_role('2'); -- 2
-- CALL add_role('3'); -- 3
-- CALL add_role('4'); -- 4
-- CALL add_role('5'); -- 5
-- CALL add_role('6'); -- 6

-- CALL assign_role_parent(2,1);
-- CALL assign_role_parent(3,2);
-- CALL assign_role_parent(5,4);
-- CALL assign_role_parent(6,5);
-- CALL assign_role_parent(4,3);
-- CALL get_roles_rel();

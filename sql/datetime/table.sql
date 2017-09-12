USE lab;
DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NULL,
	`name` VARCHAR(128) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uq_user_name` (`name`)
)
ENGINE=InnoDB
AUTO_INCREMENT 1
DEFAULT CHARSET=utf8
COLLATE utf8_general_ci;

INSERT INTO `test` (`name`) VALUES ('asd');
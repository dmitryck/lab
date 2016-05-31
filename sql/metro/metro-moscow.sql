use food;

SET AUTOCOMMIT = 0; SET FOREIGN_KEY_CHECKS = 0; SET UNIQUE_CHECKS = 0;
DROP TABLE IF EXISTS `metrostation`;
DROP TABLE IF EXISTS `metrobranch`;
SET AUTOCOMMIT = 1; SET FOREIGN_KEY_CHECKS = 1; SET UNIQUE_CHECKS = 1;

CREATE TABLE `metrobranch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `header` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


CREATE TABLE `metrostation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned NOT NULL,
  `header` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_metrostation_branchid_idx` (`branch_id`),
  CONSTRAINT `fk_metrostation_branchid` FOREIGN KEY (`branch_id`) REFERENCES `metrobranch` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into `food`.`metrobranch` (`id`, `header`) values
(1, 'Сокольническая (красная)'),
(2, 'Замоскворецкая (зелёная)'),
(3, 'Арбатско-Покровская (синяя)'),
(4, 'Филевская (голубая)'),
(5, 'Кольцевая (коричневая)'),
(6, 'Калужско-Рижская (оранжевая)'),
(7, 'Таганско-Краснопресненская (фиолетовая)'),
(8, 'Калининская (желтая)'),
(9, 'Серпуховско-Тимирязевская (серая)'),
(10, 'Люблинско-Дмитровская (салатовая)'),
(11, 'Каховская (бирюзовая)'),
(12, 'Бутовская (серо-голубая)');

-- 1 Сокольническая (красная)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(1,'Библиотека имени Ленина'),
(1,'Комсомольская (Сокольническая)'),
(1,'Кропоткинская'),
(1,'Парк Культуры (Сокольническая)'),
(1,'Румянцево'),
(1,'Спортивная'),
(1,'Фрунзенская'),
(1,'Юго-Западная'),
(1,'Бульвар Рокоссовского'),
(1,'Красносельская'),
(1,'Лубянка'),
(1,'Преображенская площадь'),
(1,'Саларьево'),
(1,'Тропарёво'),
(1,'Черкизовская'),
(1,'Воробьевы горы'),
(1,'Красные ворота'),
(1,'Охотный ряд'),
(1,'Проспект Вернадского'),
(1,'Сокольники'),
(1,'Университет'),
(1,'Чистые пруды');

-- 2 Замоскворецкая (зелёная)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(2, 'Автозаводская'),
(2, 'Белорусская (Замоскворецкая)'),
(2, 'Динамо'),
(2, 'Каширская (Замоскворецкая)'),
(2, 'Маяковская'),
(2, 'Павелецкая (Замоскворецкая)'),
(2, 'Тверская'),
(2, 'Царицыно'),
(2, 'Алма-Атинская'),
(2, 'Водный стадион'),
(2, 'Домодедовская'),
(2, 'Коломенская'),
(2, 'Новокузнецкая'),
(2, 'Речной вокзал'),
(2, 'Театральная'),
(2, 'Аэропорт'),
(2, 'Войковская'),
(2, 'Кантемировская'),
(2, 'Красногвардейская'),
(2, 'Орехово'),
(2, 'Сокол'),
(2, 'Технопарк');

-- 3 Арбатско-Покровская (синяя)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(3, 'Арбатская (Арбатско-Покровская)'),
(3, 'Измайловская'),
(3, 'Кунцевская (Арбатско-Покровская)'),
(3, 'Молодежная'),
(3, 'Партизанская'),
(3, 'Пятницкое шоссе'),
(3, 'Смоленская (Арбатско-Покровская)'),
(3, 'Электрозаводская'),
(3, 'Бауманская'),
(3, 'Киевская (Арбатско-Покровская)'),
(3, 'Курская (Арбатско-Покровская)'),
(3, 'Мякинино'),
(3, 'Первомайская'),
(3, 'Семеновская'),
(3, 'Строгино'),
(3, 'Волоколамская'),
(3, 'Крылатское'),
(3, 'Митино'),
(3, 'Парк Победы (Арбатско-Покровская)'),
(3, 'Площадь Революции'),
(3, 'Славянский бульвар'),
(3, 'Щелковская');

-- 4 Филевская (голубая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(4, 'Александровский сад'),
(4, 'Выставочная'),
(4, 'Кутузовская'),
(4, 'Смоленская (Филевская)'),
(4, 'Фили'),
(4, 'Арбатская (Филевская)'),
(4, 'Киевская (Филевская)'),
(4, 'Международная'),
(4, 'Студенческая'),
(4, 'Багратионовская'),
(4, 'Кунцевская (Филевская)'),
(4, 'Пионерская'),
(4, 'Филевский парк');

-- 5 Кольцевая (коричневая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(5, 'Белорусская (Кольцевая)'),
(5, 'Комсомольская (Кольцевая)'),
(5, 'Новослободская'),
(5, 'Парк Культуры (Кольцевая)'),
(5, 'Добрынинская'),
(5, 'Краснопресненская'),
(5, 'Октябрьская (Кольцевая)'),
(5, 'Проспект Мира (Кольцевая)'),
(5, 'Киевская (Кольцевая)'),
(5, 'Курская (Кольцевая)'),
(5, 'Павелецкая (Кольцевая)'),
(5, 'Таганская (Кольцевая)');

-- 6 Калужско-Рижская (оранжевая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(6, 'Академическая'),
(6, 'Беляево'),
(6, 'Калужская'),
(6, 'Ленинский проспект'),
(6, 'Новые Черёмушки'),
(6, 'Профсоюзная'),
(6, 'Сухаревская'),
(6, 'Тургеневская'),
(6, 'Алексеевская'),
(6, 'Ботанический сад'),
(6, 'Китай-город (Калужско-Рижская)'),
(6, 'Медведково'),
(6, 'Октябрьская (Калужско-Рижская)'),
(6, 'Рижская'),
(6, 'Теплый стан'),
(6, 'Шаболовская'),
(6, 'Бабушкинская'),
(6, 'ВДНХ'),
(6, 'Коньково'),
(6, 'Новоясеневская'),
(6, 'Проспект Мира (Калужско-Рижская)'),
(6, 'Свиблово'),
(6, 'Третьяковская (Калужско-Рижская)'),
(6, 'Ясенево');

-- 7 Таганско-Краснопресненская (фиолетовая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(7, 'Баррикадная'),
(7, 'Выхино'),
(7, 'Котельники'),
(7, 'Лермонтовский проспект'),
(7, 'Полежаевская'),
(7, 'Рязанский проспект'),
(7, 'Таганская (Таганско-Краснопресненская)'),
(7, 'Улица 1905 года'),
(7, 'Беговая'),
(7, 'Жулебино'),
(7, 'Кузнецкий мост'),
(7, 'Октябрьское поле'),
(7, 'Пролетарская'),
(7, 'Спартак'),
(7, 'Текстильщики'),
(7, 'Щукинская'),
(7, 'Волгоградский проспект'),
(7, 'Китай-город (Таганско-Краснопресненская)'),
(7, 'Кузьминки'),
(7, 'Планерная'),
(7, 'Пушкинская'),
(7, 'Сходненская'),
(7, 'Тушинская');

-- 8 Калининская (желтая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(8, 'Авиамоторная'),
(8, 'Новогиреево'),
(8, 'Перово'),
(8, 'Шоссе'),
(8, 'Энтузиастов'),
(8, 'Деловой центр'),
(8, 'Новокосино'),
(8, 'Площадь Ильича'),
(8, 'Марксистская'),
(8, 'Парк Победы (Калининская)'),
(8, 'Третьяковская (Калининская)');

-- 9 Серпуховско-Тимирязевская (серая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(9, 'Алтуфьево'),
(9, 'Боровицкая'),
(9, 'Дмитровская'),
(9, 'Нагорная'),
(9, 'Петровско-Разумовская'),
(9, 'Савеловская'),
(9, 'Тимирязевская'),
(9, 'Цветной бульвар'),
(9, 'Южная'),
(9, 'Аннино'),
(9, 'Бульвар Дмитрия Донского'),
(9, 'Менделеевская'),
(9, 'Нахимовский Проспект'),
(9, 'Полянка'),
(9, 'Севастопольская'),
(9, 'Тульская'),
(9, 'Чертановская'),
(9, 'Бибирево'),
(9, 'Владыкино'),
(9, 'Нагатинская'),
(9, 'Отрадное'),
(9, 'Пражская'),
(9, 'Серпуховская'),
(9, 'Улица академика Янгеля'),
(9, 'Чеховская');

-- 10 Люблинско-Дмитровская (салатовая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(10, 'Борисово'),
(10, 'Достоевская'),
(10, 'Кожуховская'),
(10, 'Марьина роща'),
(10, 'Римская'),
(10, 'Чкаловская'),
(10, 'Братиславская'),
(10, 'Дубровка'),
(10, 'Крестьянская застава'),
(10, 'Марьино'),
(10, 'Сретенский бульвар'),
(10, 'Шипиловская'),
(10, 'Волжская'),
(10, 'Зябликово'),
(10, 'Люблино'),
(10, 'Печатники'),
(10, 'Трубная');

-- 11 Каховская (бирюзовая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(11, 'Варшавская'),
(11, 'Каховская'),
(11, 'Каширская (Каховская)');

-- 12 Бутовская (серо-голубая)
insert into `food`.`metrostation` (`branch_id`, `header`) values
(12, 'Битцевский парк'),
(12, 'Лесопарковая'),
(12, 'Улица Старокачаловская'),
(12, 'Бульвар адмирала Ушакова'),
(12, 'Улица Горчакова'),
(12, 'Бунинская Аллея'),
(12, 'Улица Скобелевская');

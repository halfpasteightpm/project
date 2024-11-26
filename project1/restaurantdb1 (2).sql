-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 26 2024 г., 09:09
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restaurantdb1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`CustomerID`, `Firstname`, `Lastname`, `Phone`, `Email`, `CreatedAt`) VALUES
(34, 'sad', 'sad', '64646346666', 'sadboy@mail.com', '2024-11-21 19:02:09'),
(36, 'ilya', 'labutin', '66666666666', 'ilya@mail.ru', '2024-11-22 12:12:55');

-- --------------------------------------------------------

--
-- Структура таблицы `customerspasswords`
--

CREATE TABLE `customerspasswords` (
  `PasswordID` int(11) NOT NULL,
  `Passwordencrypt` varbinary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `customerspasswords`
--

INSERT INTO `customerspasswords` (`PasswordID`, `Passwordencrypt`) VALUES
(34, 0x6dc21d675dbfb0d1fd371a4b42dc1a41),
(36, 0x9bdd7de3efed2089e18d6eb20b3c2da0);

-- --------------------------------------------------------

--
-- Структура таблицы `menuitems`
--

CREATE TABLE `menuitems` (
  `MenuItemID` int(11) NOT NULL,
  `MenuItemName` varchar(100) DEFAULT NULL,
  `DescriptionItem` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `menuitems`
--

INSERT INTO `menuitems` (`MenuItemID`, `MenuItemName`, `DescriptionItem`, `Price`, `Weight`) VALUES
(21, 'Greek salad', 'A refreshing salad featuring cucumbers, tomatoes, red onions, olives, and feta cheese, typically dressed with olive oil and oregano.', 400.00, 300.00),
(22, 'Caesar salad', 'A classic salad made with romaine lettuce, croutons, Parmesan cheese, and a creamy Caesar dressing, often topped with grilled chicken or anchovies.', 400.00, 350.00),
(23, 'Borscht', 'A vibrant beet soup originating from Eastern Europe, often served hot or cold, typically containing vegetables like cabbage and potatoes, and garnished with sour cream.', 450.00, 400.00),
(24, 'Chicken soup', 'A comforting soup made with chicken, vegetables, and broth, often seasoned with herbs, and loved for its warm, nourishing qualities.', 350.00, 400.00),
(25, 'Beef burgundy', 'A rich beef stew braised in red wine, usually made with carrots, onions, and mushrooms, and infused with herbs, originating from the Burgundy region of France.', 900.00, 350.00),
(26, 'Fettuccine Bolognese', ' A pasta dish featuring fettuccine noodles topped with a hearty meat sauce made from minced beef, tomatoes, onions, and herbs, simmered to perfection.', 700.00, 350.00),
(27, 'Cheesecake', ' A creamy dessert made from cream cheese, sugar, and eggs on a crust, usually of graham crackers, with flavors like strawberry or chocolate.', 300.00, 200.00),
(28, 'Tiramisu', 'An Italian coffee-flavored dessert made of layers of mascarpone cheese, coffee-soaked ladyfingers, and dusted with cocoa powder.', 300.00, 200.00),
(29, 'Black tea', 'A strong and robust tea made from fully oxidized tea leaves, often enjoyed plain, with milk, or flavored with spices.', 150.00, 300.00),
(30, 'Green tea', 'A light and refreshing tea made from unoxidized leaves, known for its health benefits, often enjoyed plain or flavored with fruits or herbs.', 150.00, 300.00);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `items` text NOT NULL,
  `address` text NOT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reservations`
--

CREATE TABLE `reservations` (
  `ReservationID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ReservationDate` datetime DEFAULT NULL,
  `ReservationStatus` enum('Confirmed','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reservations`
--

INSERT INTO `reservations` (`ReservationID`, `CustomerID`, `ReservationDate`, `ReservationStatus`) VALUES
(28, 34, '2024-11-22 14:25:00', NULL),
(29, 34, '2024-11-22 14:25:00', NULL),
(30, 34, '2024-11-22 14:25:00', NULL),
(31, 34, '2024-11-22 14:25:00', NULL),
(32, 34, '2024-11-22 14:25:00', NULL),
(33, 34, '2024-11-22 14:25:00', NULL),
(34, 34, '2024-11-22 14:25:00', NULL),
(35, 34, '2024-11-22 14:25:00', NULL),
(36, 34, '2024-11-22 14:25:00', NULL),
(37, 34, '2024-11-22 14:25:00', NULL),
(38, 34, '2024-11-22 14:25:00', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Индексы таблицы `customerspasswords`
--
ALTER TABLE `customerspasswords`
  ADD PRIMARY KEY (`PasswordID`);

--
-- Индексы таблицы `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`MenuItemID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Индексы таблицы `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `customerspasswords`
--
ALTER TABLE `customerspasswords`
  MODIFY `PasswordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `MenuItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Ограничения внешнего ключа таблицы `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 07 2024 г., 16:57
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
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `BonusPoints` int(11) DEFAULT 0,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `customerspasswords`
--

CREATE TABLE `customerspasswords` (
  `PasswordID` int(11) NOT NULL,
  `Passwordencrypt` varbinary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Q1` int(11) DEFAULT NULL,
  `Q2` int(11) DEFAULT NULL,
  `Q3` int(11) DEFAULT NULL,
  `Q4` int(11) DEFAULT NULL,
  `Q5` int(11) DEFAULT NULL,
  `Q6` int(11) DEFAULT NULL,
  `Q7` int(11) DEFAULT NULL,
  `Q8` int(11) DEFAULT NULL,
  `Q9` int(11) DEFAULT NULL,
  `Q10` int(11) DEFAULT NULL,
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
  `TableID` int(11) DEFAULT NULL,
  `ReservationStatus` enum('Confirmed','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tables`
--

CREATE TABLE `tables` (
  `TableID` int(11) NOT NULL,
  `Seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `TableID` (`TableID`);

--
-- Индексы таблицы `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`TableID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `customerspasswords`
--
ALTER TABLE `customerspasswords`
  MODIFY `PasswordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `MenuItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tables`
--
ALTER TABLE `tables`
  MODIFY `TableID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`TableID`) REFERENCES `tables` (`TableID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

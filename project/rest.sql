create database restaurantdb1;
use restaurantdb1;

create table customers
(CustomerID int primary key auto_increment,
Firstname varchar(50),
Lastname varchar(50),
Phone varchar(15),
Email varchar(50),
Address varchar(255),
CreatedAt datetime default current_timestamp
);

create table customerspasswords
(PasswordID int primary key auto_increment,
Passwordencrypt varbinary(255),
);



create table menuitems
(MenuItemID int primary key auto_increment,
MenuItemName varchar(100),
DescriptionItem text,
Price decimal(10,2),
Weight decimal(10,2),
);

create table tables
(TableID int primary key auto_increment,
Seats int
);

create table orders
(OrderID int primary key auto_increment,
CustomerID int,
OrderDate datetime default current_timestamp,
Q1 int,
Q2 int,
Q3 int,
Q4 int,
Q5 int,
Q6 int,
Q7 int,
Q8 int,
Q9 int,
Q10 int,
TotalAmount decimal(10,2),
foreign key (customerid) references customers(customerid)
);

create table reservations
(ReservationID int primary key auto_increment,
CustomerID int,
ReservationDate datetime,
TableID int,
ReservationStatus ENUM('Confirmed','Cancelled'),
foreign key (customerID) references customers(customerID),
foreign key (TableID) references tables(tableid)
);




use restaurantdb1;
insert into customers(firstname,lastname,phone,email,address)
values
('ivan','ivanov','78005553535','ivanivanov@gmail.com','Kremlin, 1, 1'),
('neivan','neivaov','78576078802','neivanneivanov@gmail.com','pozharskogo st, 5, 3'),
('matvey','shulepin','77462787559','matveymail@gmail.com','pochainskaya st, 4, 5'),
('ilya','labutin','76578218224','ilyamail@gmail.com','sergievskaya st, 3 , 54'),
('ivan','smirnov','78003456565','smirnov@mail.ru','Kremlin, 1 ,4');


insert into menuitems(menuitemname,descriptionitem,price,weight)
values
('Greek salad','A refreshing salad featuring cucumbers, tomatoes, red onions, olives, and feta cheese, typically dressed with olive oil and oregano.',400,300.00),
('Caesar salad','A classic salad made with romaine lettuce, croutons, Parmesan cheese, and a creamy Caesar dressing, often topped with grilled chicken or anchovies.',400,350.00),
('Borscht','A vibrant beet soup originating from Eastern Europe, often served hot or cold, typically containing vegetables like cabbage and potatoes, and garnished with sour cream.',450,2,400.00),
('Chicken soup','A comforting soup made with chicken, vegetables, and broth, often seasoned with herbs, and loved for its warm, nourishing qualities.',350,400.00),
('Beef burgundy','A rich beef stew braised in red wine, usually made with carrots, onions, and mushrooms, and infused with herbs, originating from the Burgundy region of France.',900,350.00),
('Fettuccine Bolognese',' A pasta dish featuring fettuccine noodles topped with a hearty meat sauce made from minced beef, tomatoes, onions, and herbs, simmered to perfection.',700,350.00),
('Cheesecake',' A creamy dessert made from cream cheese, sugar, and eggs on a crust, usually of graham crackers, with various flavors like strawberry or chocolate.',300,200.00),
('Tiramisu','An Italian coffee-flavored dessert made of layers of mascarpone cheese, coffee-soaked ladyfingers, and dusted with cocoa powder.',300,200.00),
('Black tea','A strong and robust tea made from fully oxidized tea leaves, often enjoyed plain, with milk, or flavored with spices.',150,300.00),
('Green tea','A light and refreshing tea made from unoxidized leaves, known for its health benefits, often enjoyed plain or flavored with fruits or herbs.',150,300.00);

insert into tables(seats)
values
(2),(2),(4),(4),(4),(4),(6),(6),(8),(8);

insert into orders(customerid,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10)
values 
(2,1,0,1,0,0,0,0,0,1,0),
(5,3,1,1,0,0,1,0,0,2,0),
(3,1,0,1,0,1,0,2,4,1,1),
(1,1,2,1,3,0,0,0,0,3,1),
(4,0,1,1,0,0,3,0,0,1,0);

insert into reservations(customerid,reservationdate,tableid,reservationstatus)
values
(2,'2024-11-01 20:00:00',4,'Confirmed'),
(3,'2024-11-02 19:30:00',2,'Cancelled'),
(3,'2024-11-03 19:00:00',2,'Confirmed'),
(1,'2024-11-06 17:00:00',6,'Confirmed'),
(5,'2024-11-01 18:30:00',7,'Confirmed');


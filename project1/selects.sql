use restaurantdb1;

select * from customers where firstname like 'i%';

select * from menuitems where price<(select AVG(price) from menuitems);

select * from customers order by bonuspoints desc;
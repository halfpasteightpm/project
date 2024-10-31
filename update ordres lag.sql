use restaurantdb1;
update orders o
left join menuitems m1 on m1.menuitemid=1
left join menuitems m2 on m2.menuitemid=2
left join menuitems m3 on m3.menuitemid=3
left join menuitems m4 on m4.menuitemid=4
left join menuitems m5 on m5.menuitemid=5
left join menuitems m6 on m6.menuitemid=6
left join menuitems m7 on m7.menuitemid=7
left join menuitems m8 on m8.menuitemid=8
left join menuitems m9 on m9.menuitemid=9
left join menuitems m10 on m10.menuitemid=10
set o.totalamount=(o.q1*m1.price+o.q2*m2.price+o.q3*m3.price+o.q4*m4.price+o.q5*m5.price+o.q6*m6.price+o.q7*m7.price+o.q8*m8.price+o.q9*m9.price+o.q10*m10.price)
where o.orderid in (1,2,3,4,5)
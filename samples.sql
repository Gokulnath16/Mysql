use test;
select * from orders;
select * from customer;
select * from salesman;

-- select  salesman.salesman_id, salesman.name from salesman INNER JOIN customer ON salesman.salesman_id = customer.salesman_id;

-- select 
-- 	o.ord_no, o.purch_amt, c.cust_name, c.city 
-- from orders as o INNER JOIN customer as c 
-- ON o.customer_id = c.customer_id 
-- where o.purch_amt between 500 and 2000;

-- select 
-- 	s.salesman_id, c.customer_id, c.cust_name 
-- from customer as c INNER JOIN salesman as s 
-- ON c.salesman_id = s.salesman_id order by 1;


-- select cust_name from customer group by city having count(*) > 1;

-- select cust_name from customer where city IN (select city from customer group by city having count(*) > 1);

-- SELECT A.Cust_Name AS CustomerName1, B.Cust_Name AS CustomerName2, A.City
-- FROM Customer A, Customer B
-- WHERE A.Customer_ID <> B.Customer_ID
-- AND A.City = B.City
-- ORDER BY A.City;

-- select 
-- 	a.customer_id, a.salesman_id
-- from customer a, customer b 
-- where a.customer_id <> b.customer_id and a.salesman_id = b.salesman_id;

-- Name the emp who have orders. 
-- select c.cust_name, o.ord_no from customer as c INNER JOIN orders as o ON c.customer_id = o.customer_id; 

-- Name the cities where Both cust and salesman are present
-- select  s.city from salesman s INNER JOIN customer c ON s.salesman_id = c.salesman_id where s.city = c.city;
-- This the solution
-- select  s.city from salesman s INNER JOIN customer c ON  s.city = c.city;
-- name the cust associated with salesman name
-- select s.name, c.cust_name from salesman s INNER JOIN customer c ON s.salesman_id = c.salesman_id order by s.name;


--  Display the salesman name, total sales, commission will be 10% of puchace amount.
-- display customer who have not made any order
-- Find the salesman name which are not associated with customer
-- Find the customers name who have made than avg

-- 4 
select c.cust_name, o.purch_amt  from customer as c INNER JOIN orders as o ON c.customer_id = o.customer_id where o.purch_amt > (select avg(purch_amt) from orders);

-- 3
select s.name from salesman as s left JOIN customer as c on s.salesman_id = c.salesman_id where c.salesman_id is null;

-- 2
select c.cust_name from customer as c left JOIN orders as o ON c.customer_id = o.customer_id where o.customer_id is NUll; 

-- 1
select 
	s.salesman_id, s.name, sum(o.purch_amt) as Sum_of_purch, (0.1 * sum(o.purch_amt)) as commison 
from salesman as s INNER JOIN orders as o 
ON s.salesman_id = o.salesman_id 
group by s.salesman_id; 	

-- VIEW
-- create view my_customers AS select cust_name from customer where cust_name like '%a%';


select a.cust_name, a.city from customer a, customer b Where a.customer_id <> b.customer_id and a.city = b.city order by a.city;	
















































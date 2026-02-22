
-- 1. Display snum, sname, city and comm of all salespeople.
SELECT snum, sname, city, comm FROM salespeople;


-- 2. Display all snum without duplicates from all orders.
SELECT DISTINCT snum FROM orders;

-- 3. Display names and commissions of all salespeople in London.
SELECT sname, comm FROM salespeople WHERE city = 'London';

-- 4. All customers with rating of 100.

SELECT cname FROM cust WHERE rating = 100;

-- 5. Produce orderno, amount and date from all rows in the order table.
SELECT onum, amt, odate FROM orders;

-- 6. All customers in San Jose, who have rating more than 200.
SELECT cname FROM cust WHERE city = 'San Jose' AND rating > 200;

-- 7. All customers who were either located in San Jose or had a rating above 200.
SELECT cname FROM cust WHERE city = 'San Jose' OR rating > 200;



-- 8. All orders for more than $1000.
SELECT * FROM orders WHERE amt > 1000;


-- 9. Names and cities of all salespeople in London with commission above 0.10.
SELECT sname, city FROM salespeople WHERE comm > 0.10 AND city = 'London';


-- 10. All customers excluding those with rating <= 100 unless they are located in Rome.
SELECT cname FROM cust WHERE rating > 100 OR city = 'Rome';


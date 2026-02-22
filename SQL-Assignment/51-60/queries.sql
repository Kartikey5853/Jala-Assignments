-- SQL Assignment: Questions 51-60
-- Each query is commented with its question number and description

-- 51. Count the customers with rating above San Jose’s average.
SELECT COUNT(*) FROM cust WHERE rating > (SELECT AVG(rating) FROM cust WHERE city = 'San Jose');

-- 52. Obtain all orders for the customer named Cisnerous. (Assume you don’t know his customer no. (cnum)).
SELECT * FROM orders WHERE cnum = (SELECT cnum FROM cust WHERE cname = 'Cisnerous');

-- 53. Produce the names and rating of all customers who have above average orders.
SELECT c.cname, c.rating FROM cust c JOIN orders o ON c.cnum = o.cnum GROUP BY c.cname, c.rating HAVING SUM(o.amt) > (SELECT AVG(amt) FROM orders);

-- 54. Find total amount in orders for each salesperson for whom this total is greater than the amount of the largest order in the table.
SELECT snum, SUM(amt) AS total_amount FROM orders GROUP BY snum HAVING SUM(amt) > (SELECT MAX(amt) FROM orders);

-- 55. Find all customers with order on 3rd Oct.
SELECT c.cnum, c.cname FROM cust c JOIN orders o ON o.cnum = c.cnum WHERE odate = '03-OCT-94';

-- 56. Find names and numbers of all salesperson who have more than one customer.
SELECT s.snum, s.sname, COUNT(c.cnum) AS customer_count FROM salespeople s JOIN cust c ON s.snum = c.snum GROUP BY s.snum, s.sname HAVING COUNT(c.cnum) > 1;

-- 57. Check if the correct salesperson was credited with each sale.
SELECT CASE WHEN o.snum = c.snum THEN 'Correctly Credited' WHEN c.cnum IS NULL THEN 'Customer Missing' ELSE 'Incorrectly Credited' END AS result, COUNT(*) AS total_orders FROM orders o LEFT JOIN cust c ON o.cnum = c.cnum GROUP BY CASE WHEN o.snum = c.snum THEN 'Correctly Credited' WHEN c.cnum IS NULL THEN 'Customer Missing' ELSE 'Incorrectly Credited' END;

-- 58. Find all orders with above average amounts for their customers.
SELECT o.onum, o.cnum, o.amt FROM orders o WHERE o.amt > (SELECT AVG(o2.amt) FROM orders o2 WHERE o2.cnum = o.cnum);

-- 59. Find the sums of the amounts from order table grouped by date, eliminating all those dates where the sum was not at least 2000 above the maximum amount.
SELECT odate, SUM(amt) AS total_amount FROM orders GROUP BY odate HAVING SUM(amt) >= (SELECT MAX(amt) FROM orders) + 2000;

-- 60. Find names and numbers of all customers with ratings equal to the maximum for their city.
SELECT c.cname, c.cnum, c.city, c.rating FROM cust c WHERE c.rating = (SELECT MAX(c2.rating) FROM cust c2 WHERE c2.city = c.city);

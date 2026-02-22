

-- 61. Find all salespeople who have customers in their cities who they don’t service. (Join and Correlated subquery)
-- Join version
SELECT s.snum, s.sname, s.city FROM salespeople s JOIN cust c ON s.city = c.city AND s.snum <> c.snum;
-- Correlated subquery version
SELECT s.snum, s.sname, s.city FROM salespeople s WHERE EXISTS (SELECT 1 FROM cust c WHERE c.city = s.city AND c.snum <> s.snum);

-- 62. Extract cnum, cname and city from customer table if and only if one or more of the customers in the table are located in San Jose.
SELECT cnum, cname, city FROM cust WHERE city = 'San Jose';


-- 63. Find salespeople no. who have multiple customers.
SELECT snum FROM cust GROUP BY snum HAVING COUNT(cnum) > 1;


-- 64. Find salespeople number, name and city who have multiple customers.
SELECT s.snum, s.sname, s.city FROM salespeople s JOIN cust c ON s.snum = c.snum GROUP BY s.snum, s.sname, s.city HAVING COUNT(c.cnum) > 1;


-- 65. Find salespeople who serve only one customer.
SELECT s.snum, s.sname FROM salespeople s JOIN cust c ON s.snum = c.snum GROUP BY s.snum, s.sname HAVING COUNT(DISTINCT c.cnum) = 1;

-- 66. Extract rows of all salespeople with more than one current order.
SELECT s.snum, s.sname, COUNT(o.onum) AS current_order_count FROM salespeople s JOIN orders o ON s.snum = o.snum GROUP BY s.snum, s.sname, s.city, s.comm HAVING COUNT(o.onum) > 1;

-- 67. Find all salespeople who have customers with a rating of 300. (use EXISTS)

SELECT s.snum, s.sname FROM salespeople s WHERE EXISTS (SELECT 1 FROM cust c WHERE c.snum = s.snum AND c.rating = 300);

-- 68. Find all salespeople who have customers with a rating of 300. (use Join)
SELECT s.snum, s.sname FROM salespeople s JOIN cust c ON c.snum = s.snum WHERE c.rating = 300;

-- 69. Select all salespeople with customers located in their cities who are not assigned to them. (use EXISTS)

SELECT s.snum, s.sname, s.city FROM salespeople s WHERE EXISTS (SELECT 1 FROM cust c WHERE c.city = s.city AND c.snum <> s.snum);

-- 70. Extract from customers table every customer assigned a salesperson who currently has at least one other customer (besides the customer being selected) with orders in order table.
SELECT c.* FROM cust c WHERE EXISTS (SELECT 1 FROM cust c2 JOIN orders o ON c2.cnum = o.cnum WHERE c2.snum = c.snum AND c2.cnum <> c.cnum);




-- 71. Find salespeople with customers located in their cities (using both ANY and IN).
SELECT s.sname, s.city FROM salespeople s WHERE s.city = ANY (SELECT c.city FROM cust c WHERE c.snum = s.snum);

-- 72. Find all salespeople for whom there are customers that follow them in alphabetical order. (Using ANY and EXISTS)
SELECT DISTINCT s.snum, s.sname FROM salespeople s WHERE s.sname < ANY (SELECT c.cname FROM cust c WHERE c.snum = s.snum);
SELECT DISTINCT s.snum, s.sname FROM salespeople s WHERE EXISTS (SELECT 1 FROM cust c WHERE c.snum = s.snum AND c.cname > s.sname);

-- 73. Select customers who have a greater rating than any customer in Rome.
SELECT * FROM cust WHERE rating > ANY (SELECT rating FROM cust WHERE city = 'Rome');

-- 74. Select all orders that had amounts that were greater than at least one of the orders from Oct 6th.
SELECT * FROM orders WHERE amt > ANY (SELECT amt FROM orders WHERE odate = '06-OCT-94');


-- 75. Find all orders with amounts smaller than any amount for a customer in San Jose. (Both using ANY and without ANY)
-- Using ANY
SELECT * FROM orders WHERE amt < ANY (SELECT amt FROM orders WHERE cnum IN (SELECT cnum FROM cust WHERE city = 'San Jose'));

-- Without ANY using MAX


SELECT * FROM orders WHERE amt < (SELECT MAX(amt) FROM orders WHERE cnum IN (SELECT cnum FROM cust WHERE city = 'San Jose'));


-- 76. Select those customers whose ratings are higher than every customer in Paris. (Using both ALL and NOT EXISTS)

SELECT cname, cname, rating FROM cust WHERE rating > ALL (SELECT rating FROM cust WHERE city = 'Paris');

SELECT cnum, cname, rating FROM cust c WHERE NOT EXISTS (SELECT 1 FROM cust p WHERE p.city = 'Paris' AND p.rating >= c.rating);


-- 77. Select all customers whose ratings are equal to or greater than ANY of the Seeres.
SELECT * FROM cust WHERE rating >= ANY (SELECT rating FROM cust WHERE cname = 'Seeres');


-- 78. Find all salespeople who have no customers located in their city. (Both using ANY and ALL)
SELECT s.snum, s.sname, s.city FROM salespeople s WHERE s.city <> ANY (SELECT c.city FROM cust c WHERE c.snum = s.snum);
SELECT * FROM salespeople s WHERE s.city <> ALL (SELECT c.city FROM cust c);

-- 79. Find all orders for amounts greater than any for the customers in London.
SELECT * FROM orders WHERE amt > ANY (SELECT amt FROM orders o JOIN cust c ON o.cnum = c.cnum WHERE c.city = 'London');

-- 80. Find all salespeople and customers located in London.
SELECT sname, city, 'SALESPEOPLE' AS role FROM salespeople WHERE city = 'London' UNION SELECT cname, city, 'CUSTOMERS' AS role FROM cust WHERE city = 'London';

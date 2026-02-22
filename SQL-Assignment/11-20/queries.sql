


-- 11. All salespeople either in Barcelona or in London.
SELECT sname, city FROM salespeople WHERE city IN ('Barcelona', 'London');

-- 12. All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded)
SELECT sname, comm FROM salespeople WHERE comm > 0.10 AND comm < 0.12;

-- 13. All customers with NULL values in city column.
SELECT cname FROM cust WHERE city IS NULL;

-- 14. All orders taken on Oct 3rd and Oct 4th 1994.
SELECT * FROM orders WHERE odate IN ('03-OCT-94', '04-OCT-94');

-- 15. All customers serviced by Peel or Motika.

SELECT cname FROM cust, orders WHERE orders.cnum = cust.cnum AND orders.snum IN (SELECT snum FROM salespeople WHERE sname IN ('Peel', 'Motika'));


-- 16. All customers whose names begin with a letter from A to B.
SELECT cname FROM cust WHERE cname LIKE 'A%' OR cname LIKE 'B%';


-- 17. All orders except those with 0 or NULL value in amt field.
SELECT onum FROM orders WHERE amt != 0 OR amt IS NOT NULL;


-- 18. Count the number of salespeople currently listing orders in the order table.
SELECT COUNT(DISTINCT snum) FROM orders;

-- 19. Largest order taken by each salesperson, datewise.
SELECT odate, snum, MAX(amt) FROM orders GROUP BY odate, snum ORDER BY odate, snum;


-- 20. Largest order taken by each salesperson with order value more than $3000.

SELECT odate, snum, MAX(amt) FROM orders WHERE amt > 3000 GROUP BY odate, snum ORDER BY odate, snum;

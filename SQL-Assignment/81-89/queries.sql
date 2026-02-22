

-- 81. For every salesperson, dates on which highest and lowest orders were brought.
SELECT snum, MAX(amt) AS max_order, MIN(amt) AS min_order FROM orders GROUP BY snum;


-- 82. List all of the salespeople and indicate those who don’t have customers in their cities as well as those who do have.

SELECT s.snum, s.sname, s.city AS salespeople_city, CASE WHEN EXISTS (SELECT 1 FROM cust c WHERE c.snum = s.snum AND c.city = s.city) THEN 'HAS CUSTOMERS IN THEIR CITY' ELSE 'No customers in their city' END AS city_customer_status FROM salespeople s;

-- 83. Append strings to the selected fields, indicating whether or not a given salesperson was matched to a customer in his city.

SELECT s.snum, s.sname, s.city, CASE WHEN EXISTS (SELECT 1 FROM cust c WHERE c.snum = s.snum AND c.city = s.city) THEN s.city || '-Matched' ELSE s.city || '-Not Matched' END AS city_status FROM salespeople s;



-- 84. Create a union of two queries that shows the names, cities and ratings of all customers. Those with a rating of 200 or greater will also have the words ‘High Rating’, while the others will have the words ‘Low Rating’.
SELECT cname, city, rating, 'High Rating' AS rating_category FROM cust WHERE rating >= 200 UNION SELECT cname, city, rating, 'Low Rating' AS rating_category FROM cust WHERE rating < 200;



-- 85. Write command that produces the name and number of each salesperson and each customer with more than one current order. Put the result in alphabetical order.
SELECT s.sname AS salesperson_name, s.snum AS salesperson_number, c.cname AS customer_name, c.cnum AS customer_number FROM salespeople s JOIN orders o ON s.snum = o.snum JOIN cust c ON c.cnum = o.cnum GROUP BY s.sname, s.snum, c.cname, c.cnum HAVING COUNT(o.onum) > 1 ORDER BY s.sname ASC, c.cname ASC;


-- 86. Form a union of three queries. Have the first select the snums of all salespeople in San Jose, then second the cnums of all customers in San Jose and the third the onums of all orders on Oct. 3. Retain duplicates between the last two queries, but eliminates and redundancies between either of them and the first.
SELECT snum FROM salespeople WHERE city = 'San Jose' UNION (SELECT cnum FROM cust WHERE city = 'San Jose' UNION ALL SELECT onum FROM orders WHERE odate = '03-OCT-94');


-- 87. Produce all the salesperson in London who had at least one customer there.

SELECT DISTINCT s.sname FROM salespeople s JOIN cust c ON s.snum = c.snum WHERE s.city = 'London' AND c.city = 'London';

-- 88. Produce all the salesperson in London who did not have customers there.

SELECT s.snum, s.sname FROM salespeople s WHERE s.city = 'London' AND NOT EXISTS (SELECT 1 FROM cust c WHERE c.city = 'London' AND c.snum = s.snum);

-- 89. We want to see salespeople matched to their customers without excluding those salesperson who were not currently assigned to any customers. (Use OUTER join and UNION)

SELECT s.snum, s.sname AS salesperson_name, c.cnum, c.cname AS customer_name FROM salespeople s LEFT OUTER JOIN cust c ON s.snum = c.snum UNION SELECT s.snum, s.sname AS salesperson_name, c.cnum, c.cname AS customer_name FROM salespeople s RIGHT OUTER JOIN cust c ON s.snum = c.snum;

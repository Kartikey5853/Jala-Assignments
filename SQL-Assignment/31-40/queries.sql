-- SQL Assignment: Questions 31-40
-- Each query is commented with its question number and description

-- 31. Name of all customers matched with the salespeople serving them.
SELECT cname, sname FROM cust, salespeople WHERE cust.snum = salespeople.snum;

-- 32. List each order number followed by the name of the customer who made the order.
SELECT onum, cname FROM orders, cust WHERE orders.cnum = cust.cnum;

-- 33. Names of salesperson and customer for each order after the order number.
SELECT onum, sname, cname FROM orders, cust, salespeople WHERE orders.cnum = cust.cnum AND orders.snum = salespeople.snum;

-- 34. Produce all customer serviced by salespeople with a commission above 12%.
SELECT cname, sname, comm FROM cust, salespeople WHERE comm > 0.12 AND cust.snum = salespeople.snum;

-- 35. Calculate the amount of the salesperson’s commission on each order with a rating above 100.
SELECT sname, amt * comm FROM orders, cust, salespeople WHERE rating > 100 AND salespeople.snum = cust.snum AND salespeople.snum = orders.snum AND cust.cnum = orders.cnum;

-- 36. Find all pairs of customers having the same rating.
SELECT a.cname, b.cname, a.rating FROM cust a, cust b WHERE a.rating = b.rating AND a.cnum != b.cnum;

-- 37. Find all pairs of customers having the same rating, each pair coming once only.
SELECT a.cname, b.cname, a.rating FROM cust a, cust b WHERE a.rating = b.rating AND a.cnum != b.cnum AND a.cnum < b.cnum;

-- 38. Policy is to assign three salesperson to each customers. Display all such combinations.
SELECT c.cname, s1.sname, s2.sname, s3.sname FROM cust c, salespeople s1, salespeople s2, salespeople s3 WHERE s1.sname < s2.sname AND s2.sname < s3.sname ORDER BY c.cname, s1.sname, s2.sname, s3.sname;

-- 39. Display all customers located in cities where salesman Serres has customer.
SELECT cname FROM cust WHERE city = (SELECT city FROM cust, salespeople WHERE cust.snum = salespeople.snum AND sname = 'Serres');

-- 40. Find all pairs of customers served by single salesperson.
SELECT cname FROM cust WHERE snum IN (SELECT snum FROM cust GROUP BY snum HAVING COUNT(snum) > 1);

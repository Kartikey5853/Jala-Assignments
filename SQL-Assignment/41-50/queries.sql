-- SQL Assignment: Questions 41-50
-- Each query is commented with its question number and description

-- 41. Produce all pairs of salespeople which are living in the same city. Exclude combinations of salespeople with themselves as well as duplicates with the order reversed.
SELECT a.sname, b.sname FROM salespeople a, salespeople b WHERE a.snum > b.snum AND a.city = b.city;

-- 42. Produce all pairs of orders by given customer, names that customers and eliminates duplicates.
SELECT c.cname, a.onum, b.onum FROM orders a, orders b, cust c WHERE a.cnum = b.cnum AND a.onum > b.onum AND c.cnum = a.cnum;

-- 43. Produce names and cities of all customers with the same rating as Hoffman.
SELECT cname, city FROM cust WHERE rating = (SELECT rating FROM cust WHERE cname = 'Hoffman') AND cname != 'Hoffman';

-- 44. Extract all the orders of Motika.
SELECT onum FROM orders WHERE snum = (SELECT snum FROM salespeople WHERE sname = 'Motika');

-- 45. All orders credited to the same salesperson who services Hoffman.
SELECT onum, sname, cname, amt FROM orders a, salespeople b, cust c WHERE a.snum = b.snum AND a.cnum = c.cnum AND a.snum = (SELECT snum FROM orders WHERE cnum = (SELECT cnum FROM cust WHERE cname = 'Hoffman'));

-- 46. All orders that are greater than the average for Oct 4.
SELECT * FROM orders WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = '04-OCT-94');

-- 47. Find average commission of salespeople in London.
SELECT AVG(comm) FROM salespeople WHERE city = 'London';

-- 48. Find all orders attributed to salespeople servicing customers in London.
SELECT snum, cnum FROM orders WHERE cnum IN (SELECT cnum FROM cust WHERE city = 'London');

-- 49. Extract commissions of all salespeople servicing customers in London.
SELECT comm FROM salespeople WHERE snum IN (SELECT snum FROM cust WHERE city = 'London');

-- 50. Find all customers whose cnum is 1000 above the snum of Serres.
SELECT cnum, cname FROM cust WHERE cnum > (SELECT snum + 1000 FROM salespeople WHERE sname = 'Serres');


-- 21. Which day had the highest total amount ordered.

SELECT odate, amt, snum, cnum FROM orders WHERE amt = (SELECT MAX(amt) FROM orders);

-- 22. Count all orders for Oct 3rd.

SELECT COUNT(*) FROM orders WHERE odate = '03-OCT-94';


-- 23. Count the number of different non NULL city values in customers table.
SELECT COUNT(DISTINCT city) FROM cust;


-- 24. Select each customer’s smallest order.
SELECT cnum, MIN(amt) FROM orders GROUP BY cnum;


-- 25. First customer in alphabetical order whose name begins with G.
SELECT MIN(cname) FROM cust WHERE cname LIKE 'G%';


-- 26. Get the output like “For dd/mm/yy there are ___ orders.”
SELECT 'For ' || TO_CHAR(odate,'dd/mm/yy') || ' there are ' || COUNT(*) || ' Orders' FROM orders GROUP BY odate;


-- 27. Assume that each salesperson has a 12% commission. Produce order no., salesperson no., and amount of salesperson’s commission for that order.

SELECT onum, snum, amt, amt * 0.12 FROM orders ORDER BY snum;

-- 28. Find highest rating in each city. Output: For the city (city), the highest rating is : (rating).

SELECT 'For the city (' || city || '), the highest rating is : (' || MAX(rating) || ')' FROM cust GROUP BY city;


-- 29. Display the totals of orders for each day and place the results in descending order.

SELECT odate, COUNT(onum) FROM orders GROUP BY odate ORDER BY COUNT(onum) DESC;


-- 30. All combinations of salespeople and customers who shared a city.
SELECT sname, cname FROM salespeople, cust WHERE salespeople.city = cust.city;

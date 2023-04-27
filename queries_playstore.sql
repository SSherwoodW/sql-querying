-- query 1 --
SELECT * FROM analytics WHERE id = 1880;

-- query 2 --
SELECT id, app_name, last_updated FROM analytics WHERE last_updated = '2018-08-01';

-- query 3 --
SELECT category, COUNT(*) FROM analytics                                                 
    GROUP BY category      

-- query 4 --
SELECT * FROM analytics                                                                  
    ORDER BY reviews DESC
    LIMIT 5;

-- query 5 --
SELECT * FROM analytics
    WHERE rating >= 4.8
    ORDER BY reviews DESC
    LIMIT 1;

-- query 6 --
SELECT category, AVG(rating) FROM analytics
    GROUP BY category 
    ORDER BY AVG(rating) DESC;

-- query  7 --
SELECT name, price, rating FROM analytics
    WHERE rating < 3
    ORDER BY price DESC;

-- query  8 --
SELECT app_name, rating FROM analytics                                                         
WHERE min_installs <= 50 AND rating > 0
ORDER BY rating DESC;
 
-- query 9 --
SELECT app_name FROM analytics 
    WHERE rating < 3 AND reviews >= 10000;

-- query 10 --
SELECT app_name, reviews, price FROM analytics
    WHERE price >= 0.10 AND price <= 1.00 
    ORDER BY reviews DESC                                          
    LIMIT 10;

-- query 13 --
SELECT app_name, last_updated FROM analytics
    ORDER BY last_updated
    LIMIT 1;

-- query 14 --
SELECT app_name, price FROM analytics
    ORDER BY price DESC
    LIMIT 1;

-- query 15 --
SELECT app_name, reviews, min_installs, (min_installs/reviews) AS proportion             
    FROM analytics 
    WHERE min_installs > 100000 
    ORDER BY proportion                                       
    LIMIT 1;

-- FS1 --
SELECT app_name, rating, category FROM analytics
    WHERE (rating, category) IN (
    SELECT MAX(rating), category FROM analytics
    WHERE min_installs >= 50000
    GROUP BY category)  
    ORDER BY category;

-- FS2 --
SELECT * FROM analytics                                                                  
    WHERE app_name ILIKE '%facebook%';

-- FS3 --
SELECT * FROM analytics
    WHERE array_length(genres, 1) >= 2;

-- FS4 --
SELECT * FROM analytics
    WHERE genres @> '{"Education"}';
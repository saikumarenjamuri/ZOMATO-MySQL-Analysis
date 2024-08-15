create schema zomato;
USE zomato;

select* from zomato_dataset;
 
-- view all cusine which are available in zomato--
select distinct cusine from zomato_dataset;

-- How many(count) cusines are available in zomato --
select count(distinct cusine) as 'Total no of items' From zomato_dataset;

-- what are the least and most expensive items in the zomato--
select * from zomato_dataset
order by COST_FOR_TWO DESC;

-- how many Restaurants are available in zomato--
select count(distinct RESTAURANT_NAME) from zomato_dataset;

-- In which cities zomato providing service--
select distinct CITY from zomato_dataset;

-- which cousin had above 4 Rating --
select CUSINE,RATING  from zomato_dataset
where RATING >4
order by RATING DESC ; 

-- Which item have more no of Ratings--
select CUSINE,RATING_COUNT from zomato_dataset
order by RATING_COUNT DESC;

-- COUNT of online orders--
select count(ONLINE_ORDER) from zomato_dataset
where ONLINE_ORDER = 'Online-Order';

-- how many Reservations are happened in mumbai city--
select count(TABLE_RESERVATION) from zomato_dataset
where CITY='Mumbai' 
and TABLE_RESERVATION='Reservation';

-- what are the famous foods are there in zomato--
select FAMOUS_FOOD from zomato_dataset
where FAMOUS_FOOD !='-';

-- What are the top 3 famous food in zomato --
select FAMOUS_FOOD, RATING from zomato_dataset
where FAMOUS_FOOD !='-'
order by RATING DESC
LIMIT 3;

-- Which is most famous food ordered in zomato--
select FAMOUS_FOOD from zomato_dataset
where ONLINE_ORDER='Online-Order'
and RATING > 4;

-- which city people are using zomato frequently --
select CITY, COUNT(*)from zomato_dataset
group by CITY;

-- list of all restaurants in delhi --
SELECT restaurant_name
FROM zomato_dataset
WHERE CITY = 'Delhi NCR';

-- Find restaurants with a rating above a certain threshold --
SELECT restaurant_name, rating
FROM zomato_dataset
WHERE rating > 4.0;

-- Find the maximum rating --
SELECT MAX(rating)  AS max_rating
FROM zomato_dataset;

-- List of restaurants serving a particular cuisine( North Indian) --
SELECT RESTAURANT_NAME,CUSINE
FROM zomato_dataset
WHERE CUSINE = 'North Indian';

-- Find the top 5 highest-rated restaurants in a specific city area --
SELECT RESTAURANT_NAME, RATING
FROM zomato_dataset
WHERE CITY = 'Delhi NCR'
ORDER BY RATING DESC
LIMIT 5;

-- Find restaurants with a rating between 3.5 and 4.5 --
SELECT restaurant_name, rating
FROM zomato_dataset
WHERE rating BETWEEN 3.5 AND 4.5
order by rating desc;

-- List restaurants with a rating above 4.0 and offering table reservations --
SELECT RESTAURANT_NAME
FROM zomato_dataset
WHERE RATING > 4  
AND TABLE_RESERVATION = 'Reservation';

-- Count the number of restaurants in each city area --
SELECT city, COUNT(*) AS restaurant_count
FROM zomato_dataset
GROUP BY city;

-- Find restaurants with a specific famous food(Panipuri) --
SELECT restaurant_name, famous_food
FROM zomato_dataset
WHERE famous_food = 'Panipuri';

-- Find restaurants with a high rating and a low cost for two --
SELECT restaurant_name, rating, cost_for_two
FROM zomato_dataset
WHERE rating > 4.0 
AND cost_for_two < 500;
create database flipkart_project;
use flipkart_project;

drop table if exists mobiles;
create table mobiles(
Brand varchar(50),
Model varchar(50),
Color varchar(50),
Memory varchar(50),
Storage varchar (50),
Rating decimal (3,2),
Selling_price int,
Orginal_price int
);

ALTER TABLE mobiles11
RENAME TO mobile;

select * from mobile;
show tables;

select Brand from mobile;

-- Query 1: Total Records
select count(*) as total_records
from mobile;

-- Query 2: Table Structure
describe mobile;

-- Query 3: First 10 Records
select * from mobile
limit 10;

-- Query 4: Unique Brands
select distinct model 
from mobile;

-- Query 6: Price Range
SELECT MIN(`Selling Price`) AS minimum_price
FROM mobile;

-- max
SELECT MAX(`Selling Price`) AS maximum_price
FROM mobile;

-- Average Price
select avg(`Selling Price`) as average_price
from mobile;

-- Average Rating
select avg(rating) as average_rating
from mobile;

-- Null Values
select * from mobile
where rating is null;

-- Highest Price Mobile
select * from mobile 
order by `selling price` desc
limit 1;

-- Price ₹20,000
select * from mobile
where `selling price`='20000';

-- Price ₹15,000 less
select * from mobile
where `selling price` < 15000;

-- Rating 4.5 more or equal
select * from mobile
where rating >= 4.5;

-- two condition
select * from mobile
where model='A12' and rating >='4.3';

-- ORDER BY (Sorting Data)
-- Display all mobiles sorted by Selling Price (Low to High).
select * from mobile 
order by `selling price` Asc;

-- Display all mobiles sorted by Selling Price (High to Low).
select * from mobile 
order by `selling price` desc;

-- Display all mobiles sorted by Rating (Highest to Lowest).
select * from mobile
order by rating desc;

-- by model
select * from mobile
where brand = 'A53'
order by rating  desc;

-- Display the first 10 records.
select * from mobile 
limit 10;

-- Display the top 5 most expensive mobiles.
select * from mobile
order by `selling price` desc
limit 5;

-- Display all model brands.
select distinct model
from mobile;

-- Display all unique storage options.
select distinct storage
from mobile;

-- color
select count(color)
from mobile;

-- Display all models ending
select * from mobile 
where model like '%12';

-- Display
select * from mobile 
where brand ='oppo'
and model like '%A12' and color ='deep blue';

-- Display mobiles priced between ₹20,000 and ₹40,000.
select * from mobile
where `selling price` Between 20000 and 40000;

-- Display mobiles with a rating between 4.2 and 4.8.
select * from mobile
where rating between 4.2 and 4.8;

-- Display mobiles whose original price is between ₹25,000 and ₹50,000.
select * from mobile
where `selling price` between 25000 And 45000;

-- Display the top 5 mobiles priced between ₹20,000 and ₹50,000.
select * from mobile
where `selling price` between 20000 and 50000
order by `selling price` desc
limit 5;

--  Display mobiles of
select * from mobile
where model not in ('A12','A53', 'A33','A31');

-- Count mobiles per brand
select brand,count(*) as total_mobile
from mobile
group by brand;

-- Average selling price per brand
select brand,avg(`selling price`) as avg_price
from mobile
group by brand;

-- Maximum price per brand
select brand ,max(`selling price`) as max_Price
from mobile
group by brand;

-- Total value per brand
select brand, sum(`selling price`) as total_price
from mobile
group by brand;

-- Brands with more th-- an 5 mobiles
select model,count(*) as total_mobile
from mobile
group by model
Having count(*) > 5;

-- n 2: Brands with average price > 30000
select brand, avg(`selling price`) as avg_price
from mobile
group by brand
having avg(`selling price`) > 30000;

-- Rating Category
select *,
case 
when rating < 3 then 'poor'
when rating between 3 and 4 then 'Average'
else 'Excellent'
end as rating_category
from mobile;

-- Priority Label
select *, case
when model in('a12','a33') then 'preminium'
when model in ('a53','a53s 5G') then 'smarter'
Else 'model_based'
End as model_segment
from mobile;

-- Convert brand names to UPPERCASE
select brand, upper(brand) as brand_upper
from mobile;

-- Convert model names to lowercase
select moedel,lower(model) as model_lower
from mobile;

-- Find length of brand names
select brand,length(brand) as brand_length
from mobile;

-- Mobiles above average price
select * from mobile
where `selling price` > (select avg(`selling price`)
from mobile);

-- Mobiles above average rating
select * from mobile
where rating >(select avg(rating)
from mobile);

-- Top 5 expensive mobiles (CTE use)
WITH ranked_mobile AS (
    SELECT *
    FROM mobile
    ORDER BY `selling price` DESC
)
SELECT *
FROM ranked_mobile
LIMIT 5;

-- Rank mobiles by price (highest first)
select *,
row_number() over (order by `selling price` desc )as price_rank
from mobile;

-- RANK()
select *,
rank() over (order by `selling price` desc)
from mobile;
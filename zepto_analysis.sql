drop table if exists zepto;

create table zepto_(sku_id serial primary key,
category varchar(120),name varchar(150)not null,
mrp numeric(8,2), discountPercent numeric(5,2),
available_quantity integer,
discounted_SellingPrice numeric(8,2),
weighIngrams integer,
outOfStock boolean,
qauntity integer);



--data exploration

select count(*) from zepto;
select*from zepto LIMIT 10;

--null values
select * from zepto 
where name is null 
or
 category is null 
or
 mrp is null 
or
 discountpercent is null 
or
 available_quantity is null
or
 discounted_sellingprice is null 
or
 weighingrams is null 
or
 outofstock is null 
or 
 qauntity is null;

--different product categories
select distinct category
from zepto 
order by category;

--products in stock and off stock
select outofstock,count(sku_id)
from zepto
group by outofstock;


--product names multiple times 
select name,count(sku_id) as "Number of sKUs"
from zepto 
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

--data cleaning 
--products with price = 0
select * from zepto
where mrp = 0 or discounted_sellingprice = 0;

delete from zepto where mrp=0;

--converting mrp into rupees
update zepto
set mrp = mrp/100,
discounted_sellingprice = discounted_sellingprice/100;

select mrp,discounted_sellingprice from zepto limit 5;

--q1.find the top 10 best value product based on the discount percentage.
select distinct name,mrp,discountpercent
from zepto 
order by discountpercent desc limit 10;

--q2.what are the products with high mrp but out of stock
select name,mrp from zepto 
where outofstock = true and mrp > 300
order by mrp desc;

--q3calculate estimate revenue for each category
select category,sum(discounted_sellingprice*available_quantity) as
Total_revenue from zepto
group by category
order by Total_revenue;

--q4find all products where mrp is greater than 500 and discount percentage < 10.
select distinct name,mrp,discountpercent
from zepto
where mrp > 500 and discountpercent < 10
order by mrp desc,discountpercent desc;


--q5identify the top 5 categories offering the highest average discount percentage
select category,
round(avg(discountpercent),2) as average_discount_percent
from zepto
group by category
order by average_discount_percent desc limit 5;

--q6find the price per gram for products above 100 gm and sort by best value
select distinct name,weighingrams, discounted_sellingprice,
round(discounted_sellingprice/weighingrams,2) as price_per_gram
from zepto 
where weighingrams >= 100 
order by price_per_gram;

--q7.group the products into categories like low , medium, high
select distinct name,weighingrams,
case 
when weighingrams < 1000 then 'Low'
when weighingrams < 5000 then 'Medium'
else 'Bulk'
end as weight_category
from zepto
order by weight_category;

--q8.what is the total inventory weight per category
select category, sum(weighingrams*available_quantity) as
Total_inventory_weight
from zepto
group by category
order by total_inventory_weight;


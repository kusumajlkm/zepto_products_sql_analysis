Zepto SQL Analysis

Overview

This project analyzes Zepto product and inventory data using SQL to extract business insights related to pricing, discounts, stock availability, and revenue.

Tools Used
PostgreSQL
SQL

Dataset
The dataset contains product-level details such as:
Product name and category
MRP and discount percentage
Selling price and available quantity
Product weight and stock status
Key Analysis Performed
Data exploration and NULL value checks
Data cleaning (removal of zero-priced products, price normalization)
Stock availability analysis
Revenue estimation by category
Discount-based product ranking
Price-per-gram value analysis
Product weight classification (Low, Medium, Bulk)
Inventory weight calculation by category

SQL Concepts Used
SELECT, WHERE, ORDER BY
GROUP BY, HAVING
Aggregate functions (SUM, AVG, COUNT)
CASE WHEN
UPDATE, DELETE
Key Insights
Certain categories generate higher estimated revenue
High-MRP products are more likely to be out of stock
Bulk-weight products offer better value per gram
Discount strategies vary across categories

How to Run
Create a PostgreSQL database
Create the zepto table
Load the data
Execute the SQL queries in order

Purpose
This project demonstrates practical SQL skills for data analytics and business analysis in an e-commerce context.

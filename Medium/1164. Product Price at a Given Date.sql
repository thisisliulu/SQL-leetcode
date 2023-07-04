-- # Table: Products

-- # +---------------+---------+
-- # | Column Name   | Type    |
-- # +---------------+---------+
-- # | product_id    | int     |
-- # | new_price     | int     |
-- # | change_date   | date    |
-- # +---------------+---------+
-- # (product_id, change_date) is the primary key of this table.
-- # Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- # Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- # Return the result table in any order.

-- # The query result format is in the following example.

 

-- # Example 1:

-- # Input: 
-- # Products table:
-- # +------------+-----------+-------------+
-- # | product_id | new_price | change_date |
-- # +------------+-----------+-------------+
-- # | 1          | 20        | 2019-08-14  |
-- # | 2          | 50        | 2019-08-14  |
-- # | 1          | 30        | 2019-08-15  |
-- # | 1          | 35        | 2019-08-16  |
-- # | 2          | 65        | 2019-08-17  |
-- # | 3          | 20        | 2019-08-18  |
-- # +------------+-----------+-------------+
-- # Output: 
-- # +------------+-------+
-- # | product_id | price |
-- # +------------+-------+
-- # | 2          | 50    |
-- # | 1          | 35    |
-- # | 3          | 10    |
-- # +------------+-------+

Select a.product_id, a.new_price as price
From 
(
  Select *, rank () over (partition by product_id order by change_date desc) rk
  From Products
  where change_date <= '2019-08-16'
) a 
where a.rk = 1
UNION
Select distinct product_id, 10 as price
From Products
group by product_id
having min(change_date) > '2019-08-16'

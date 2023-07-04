-- # Table: Accounts

-- # +-------------+------+
-- # | Column Name | Type |
-- # +-------------+------+
-- # | account_id  | int  |
-- # | income      | int  |
-- # +-------------+------+
-- # account_id is the primary key for this table.
-- # Each row contains information about the monthly income for one bank account.
 

-- # Calculate the number of bank accounts of each salary category. The salary categories are:

-- # "Low Salary": All the salaries strictly less than $20000.
-- # "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- # "High Salary": All the salaries strictly greater than $50000.
-- # The result table must contain all three categories. If there are no accounts in a category, then report 0.

-- # Return the result table in any order.

-- # The result format is in the following example.

 

-- # Example 1:

-- # Input: 
-- # Accounts table:
-- # +------------+--------+
-- # | account_id | income |
-- # +------------+--------+
-- # | 3          | 108939 |
-- # | 2          | 12747  |
-- # | 8          | 87709  |
-- # | 6          | 91796  |
-- # +------------+--------+
-- # Output: 
-- # +----------------+----------------+
-- # | category       | accounts_count |
-- # +----------------+----------------+
-- # | Low Salary     | 1              |
-- # | Average Salary | 0              |
-- # | High Salary    | 3              |
-- # +----------------+----------------+
-- # Explanation: 
-- # Low Salary: Account 2.
-- # Average Salary: No accounts.
-- # High Salary: Accounts 3, 6, and 8.

Select 'Low Salary' as category, count(account_id) as accounts_count
From Accounts 
Where income < 20000
UNION
Select 'Average Salary' as category, count(account_id) as accounts_count
From Accounts 
Where income >= 20000 and income <= 50000
UNION
Select 'High Salary' as category, count(account_id) as accounts_count
From Accounts 
Where income > 50000

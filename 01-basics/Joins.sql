-- Problem: Recyclable and Low Fat Products
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Select
-- Approach: Used where clause for filtering
SELECT product_id FROM Products  WHERE low_fats = 'Y' and recyclable = 'Y';


-- Problem: Replace Employee ID With The Unique Identifier
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Joins
-- Approach: Joined the table on similar column
select u.unique_id, e.name 
from Employees as e
left join EmployeeUNI  as u
on e.id = u.id ;


-- Problem: Customer Who Visited but Did Not Make Any Transactions
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Joins, Group by
-- Approach: Used join table and grouping the data customer wise
select v.customer_id, count(v.visit_id) as count_no_trans 
from Visits as v left join Transactions as t
On v.visit_id = t.visit_id 
where t.transaction_id IS NULL
group by v.customer_id;


-- Problem: Employee Bonus
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Joins, Null checks 
-- Approach: Used joins and filter condition to check null 
select name, bonus
from Employee  as e
left join Bonus as b
on e.empId = b.empId
where b.bonus < 1000 OR b.bonus IS NULL


-- Problem: The Number of Employees Which Report to Each Employee
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Joins, Null checks 
-- Approach: Used self join
select m.employee_id, m.name, count(e.employee_id) as reports_count, Round(AVG(e.age)) as average_age
from employees as e 
join employees as m 
on e.reports_to = m.employee_id
group by m.employee_id, m.name
order by m.employee_id

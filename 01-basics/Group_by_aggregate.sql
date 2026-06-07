-- Problem: Not Boring Movies
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept:  Order by 
-- Approach: Used joins and order by desc
select * from Cinema where id&1 and description != "boring" 
Order by rating DESC;


-- Problem: Number of Unique Subjects Taught by Each Teacher
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Grouping
-- Approach: Used aggregate functions
select teacher_id, count(distinct subject_id) as cnt
from Teacher 
group by teacher_id;


-- Problem: Average Time of Process per Machine
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Aggregate functions
-- Approach: Used join table and aggreagte functions 
select machine_id, 
round(sum(case when activity_type='start' then -timestamp else timestamp end)/count(distinct process_id),3) 
as processing_time from Activity group by machine_id;



-- Problem:  Rising Temperature
-- Source: LeetCode
-- Difficulty: Easy 
-- Concept: Joins, Date functions
-- Approach: Used join table and added Date funtion for filtering the data
select today.id from Weather as yester cross join Weather as today
where DATEDIFF(today.recordDate , yester.recordDate) = 1 and today.temperature > yester.temperature
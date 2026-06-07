-- Problem: Recyclable and Low Fat Products
-- Source: LeetCode
-- Difficulty: Medium 
-- Concept: Rank()
-- Approach: Ranking to be done from highest to lowest 
SELECT 
    score ,
    DENSE_RANK() OVER (ORDER BY score DESC) AS Rank
FROM Scores;


-- Problem: Department Top Three Salaries
-- Source: LeetCode
-- Difficulty: Hard 
-- Concept: Dense_rank()
-- Approach: Added CTE to get all the records as per ranking, and then used the response to filter the needed data 
with ranked as (
    select d.name as Department 
        , e.name as Employee
        , Salary,
        dense_rank() over (partition by departmentId  order by salary desc ) as salary_rn
    from Employee as e 
    join  Department as d 
    on d.id = e.departmentId
)

select Department, Employee, salary
from ranked 
where salary_rn <= 3 
/* ============================================================
   TASK 15: Window Functions for Advanced Analytics
   MySQL 8+
   Tables used: employees, departments
   ============================================================ */
use intern_training_db;
-- ------------------------------------------------------------
-- 1) Join employees with departments
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    d.department_name,
    e.salary,
    e.hire_date
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- ------------------------------------------------------------
-- 2) ROW_NUMBER(): Unique ranking within each department
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    d.department_name,
    e.salary,
    ROW_NUMBER() OVER(
        PARTITION BY d.department_name
        ORDER BY e.salary DESC
    ) AS row_num_rank
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- ------------------------------------------------------------
-- 3) RANK() vs DENSE_RANK()
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    d.department_name,
    e.salary,
    RANK() OVER(
        PARTITION BY d.department_name
        ORDER BY e.salary DESC
    ) AS rank_position,
    DENSE_RANK() OVER(
        PARTITION BY d.department_name
        ORDER BY e.salary DESC
    ) AS dense_rank_position
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- ------------------------------------------------------------
-- 4) Running Total Salary per Department
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    d.department_name,
    e.salary,
    SUM(e.salary) OVER(
        PARTITION BY d.department_name
        ORDER BY e.hire_date
    ) AS running_salary_total
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- ------------------------------------------------------------
-- 5) LAG(): Compare salary with previous employee
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    e.salary,
    LAG(e.salary) OVER(
        ORDER BY e.salary
    ) AS previous_salary,
    e.salary - LAG(e.salary) OVER(
        ORDER BY e.salary
    ) AS salary_difference
FROM employees e;

-- ------------------------------------------------------------
-- 6) LEAD(): Compare salary with next employee
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    e.salary,
    LEAD(e.salary) OVER(
        ORDER BY e.salary
    ) AS next_salary
FROM employees e;

-- ------------------------------------------------------------
-- 7) Use WHERE with window function (Subquery Required)
--    Example: Top 2 highest salaries per department
-- ------------------------------------------------------------

SELECT *
FROM (
    SELECT 
        e.emp_id,
        e.name,
        d.department_name,
        e.salary,
        ROW_NUMBER() OVER(
            PARTITION BY d.department_name
            ORDER BY e.salary DESC
        ) AS rn
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
) ranked
WHERE rn <= 2;

-- ------------------------------------------------------------
-- 8) Salary Trend Analysis (Department Average)
-- ------------------------------------------------------------

SELECT 
    e.emp_id,
    e.name,
    d.department_name,
    e.salary,
    AVG(e.salary) OVER(
        PARTITION BY d.department_name
    ) AS department_avg_salary,
    e.salary - AVG(e.salary) OVER(
        PARTITION BY d.department_name
    ) AS difference_from_dept_avg
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
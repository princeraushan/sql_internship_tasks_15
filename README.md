# Task 15 – Window Functions for Advanced Analytics

This repository contains the solution for **Task 15 of the SQL Developer Internship**, which focuses on implementing **Window Functions** in MySQL 8+ to perform advanced analytical queries.

Window functions allow calculations across sets of rows while preserving individual row details, making them essential for ranking, trend analysis, and performance reporting.

---

## Objective

The main objectives of this task are:

- Understand and implement SQL window functions  
- Use ROW_NUMBER(), RANK(), and DENSE_RANK()  
- Calculate running totals using SUM() OVER  
- Compare rows using LAG() and LEAD()  
- Apply PARTITION BY for grouped analytics  
- Use window functions with subqueries and WHERE filters  
- Perform real-world analytical use cases  

---

## Database Tables Used

### 1. employees
| Column | Type |
|--------|------|
| emp_id | INT (PK) |
| name | VARCHAR(100) |
| email | VARCHAR(100) |
| department | VARCHAR(50) |
| salary | DECIMAL(10,2) |
| hire_date | DATE |
| created_at | TIMESTAMP |
| department_id | INT |

### 2. departments
| Column | Type |
|--------|------|
| department_id | INT (PK) |
| department_name | VARCHAR(50) |
| location | VARCHAR(50) |

---

## Concepts Implemented

### 1. ROW_NUMBER()
Assigned unique ranking within each department based on salary.

### 2. RANK() vs DENSE_RANK()
Demonstrated ranking differences when duplicate salary values exist.

### 3. Running Totals
Used `SUM() OVER (PARTITION BY ... ORDER BY ...)` to calculate cumulative salary totals.

### 4. LAG()
Compared each employee’s salary with the previous employee.

### 5. LEAD()
Compared each employee’s salary with the next employee.

### 6. Partitioning
Used `PARTITION BY` to perform department-level analytics without collapsing rows.

### 7. Subqueries with Window Functions
Filtered top N employees per department using a subquery with ROW_NUMBER().

### 8. Salary Trend & Analytics
Calculated department average salary and difference from department mean.

---

## Files in This Repository

| File | Description |
|------|------------|
| task15.sql | Contains all window function queries |
| screenshots/ | Output screenshots |
| README.md | Documentation |

---

## Tools Used

- MySQL 8+  
- MySQL Workbench  
- Git & GitHub  

---

## How to Run

1. Open MySQL Workbench  
2. Connect to your database  
3. Ensure `employees` and `departments` tables exist  
4. Run `task15.sql`  
5. Execute queries individually to observe outputs  
6. Capture screenshots for submission  

---

## Learning Outcomes

After completing this task, I learned:

- How window functions differ from GROUP BY  
- How ranking functions handle ties  
- How to compute running totals and analytics  
- How to perform row-by-row comparisons  
- How window functions are used in reporting and BI systems  

---

## Interview Preparation

**What is a window function?**  
A function that performs calculations across a set of rows without reducing the number of rows returned.

**Difference between RANK and DENSE_RANK?**  
RANK skips numbers after ties; DENSE_RANK does not.

**Why window functions don’t reduce rows?**  
Because they compute values per row rather than grouping rows.

**What is PARTITION BY?**  
It divides rows into logical groups for window calculations.

**Real-world use cases of LAG and LEAD?**  
Trend analysis, salary growth tracking, time-series comparisons, performance analytics.

---

## Conclusion

This task provided hands-on experience with **advanced analytical SQL queries** using window functions. These concepts are widely used in data platforms, reporting systems, and business intelligence tools to perform ranking, trend analysis, and performance tracking without collapsing data.<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 17 30 PM" src="https://github.com/user-attachments/assets/5f698955-ff45-4a39-818f-5aed88961b42" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 17 01 PM" src="https://github.com/user-attachments/assets/522d6118-2b12-44b7-8de5-915a10fda274" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 16 22 PM" src="https://github.com/user-attachments/assets/81b25e16-fb39-4c05-9630-2cc04c4fe84f" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 16 10 PM" src="https://github.com/user-attachments/assets/90fd1970-18b4-4881-be8d-e007b0b7385b" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 15 56 PM" src="https://github.com/user-attachments/assets/f11c235e-dc59-40c8-aed7-1d90f1267541" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 15 45 PM" src="https://github.com/user-attachments/assets/4c0a8b64-18b8-4cd8-8446-6fecc17e9022" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 15 32 PM" src="https://github.com/user-attachments/assets/a75d2f26-16cc-497e-bba0-ee49ca9a1e49" />
<img width="1440" height="900" alt="Screenshot 2026-02-15 at 9 15 19 PM" src="https://github.com/user-attachments/assets/1a03568b-af39-4314-ae0d-417176f9fe78" />

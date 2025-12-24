-- Situation-1: To analyze salary distribution, find the total salary paid in each department.
select departmentid, sum(salary) as total_salary from employees
group by departmentid;

-- Situation-2: For employee retention analysis, count the number of employees in each department.
select departmentid, count(employeeid) as employee_count from employees
group by departmentid;

-- Situation-3: The finance team wants to understand salary variation. Find the average salary in each department.
select departmentid, avg(salary) as average_salary from employees
group by departmentid;

-- Situation-4: To reward experienced employees, identify the earliest joining date in each department.
select departmentid, min(dateofjoining) as earliest_joining_date from employees
group by departmentid;

-- Situation-5: The HR team is preparing performance reports. Retrieve the maximum salary in each department.
select departmentid, max(salary) as max_salary from employees
group by departmentid;

-- Situation-6: To analyze junior-level hiring, find the minimum salary in each department.
select departmentid, min(salary) as min_salary from employees
group by departmentid;

-- Situation-7: The finance team wants to review high-salary employees.
-- Find the total salary paid for employees earning more than ₹60,000 in each department.
select departmentid, sum(salary) as total_high_salary from employees
where salary > 60000
group by departmentid;

-- Situation-8: To monitor departmental growth, count the number of employees who joined in 2024 in each department.
select departmentid, count(employeeid) as joined_2024 from employees
where year(dateofjoining) = 2024
group by departmentid;

-- Situation-9: For training allocation, count the number of employees
-- with salaries between ₹50,000 and ₹70,000 in each department.
select departmentid, count(employeeid) as salary_range_count from employees
where salary between 50000 and 70000
group by departmentid;

-- Situation-10: For diversity analysis, count the number of employees
-- whose names start with each letter of the alphabet.
select left(firstname, 1) as starting_letter, count(employeeid) as employee_count from employees
group by left(firstname, 1)
order by starting_letter;


-- Department Table Queries

-- Situation-11: For city-based analysis, count the number of departments located in each city.
select location, count(departmentid) as department_count from departments
group by location;

-- Situation-12: To manage high-budget projects, find the total budget allocated
-- to all departments in each city.
select location, sum(annualbudget) as total_budget from departments
group by location;

-- Situation-13: For leadership tracking, count the number of departments
-- headed by each manager.
select headofdepartment, count(departmentid) as department_count from departments
group by headofdepartment;

-- Situation-14: To plan budget allocation, calculate the average budget
-- of departments in each city.
select location, avg(annualbudget) as average_budget from departments
group by location;

-- Situation-15: For funding efficiency, find the maximum and minimum
-- budgets among departments in each city.
select location, max(annualbudget) as max_budget, min(annualbudget) as min_budget from departments
group by location;

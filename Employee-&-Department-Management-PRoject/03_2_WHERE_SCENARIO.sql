use companydb;
select * from employees;
-- 2] Situational Questions on WHERE Clause
-- Employee Table
-- Situation -1 We are planning a cybersecurity project. Find all employees working in the IT department (DepartmentID: 3).
select * from employees
where DepartmentID = 3;

-- Situation -2 To organize a corporate event, we need employees who joined after 2024-01-01. Retrieve their details.
select * from employees
where Dateofjoining > 2024-01-01;

-- Situation -3 The finance team is preparing budgets. List all employees whose salary is greater than ₹60,000.
select * from employees
where salary > 60000;

-- Situation -4 We are sending a company-wide newsletter. Find the details of employees whose email ends with '@example.com'.
select * from employees
where email like '%@example.com';

-- Situation -5 The Marketing department is launching a new campaign and needs a cost-effective team. Retrieve the details of employees 
-- in the Marketing department (DepartmentID: 11) who earn less than ₹60,000.
select * from employees
where DepartmentID = 11 and salary < 60000;

-- Situation -6 A client requires a project lead for their team. Find the employee details where the name starts with 'S'.
select * from employees
where Firstname like 'S%';

-- Situation -7 For recruitment analysis, retrieve all employees who joined in February 2024.
select * from employees
where dateofjoining  like '2024-02-%';

-- Situation -8 To shortlist mid-level employees, find the details of employees who are earning between ₹50,000 and ₹70,000
select * from employees
where salary between 50000 and 70000;

-- Situation -9 We need to identify senior employees. Retrieve the details of employees who joined before 2024-03-01 and earn more than ₹55,000.
select * from employees
where dateofjoining < '2024-03-01' and salary > 55000;

-- Situation -10 A special campaign is being planned for team leaders. Find employees who have "Manager" in their name.
Select * from employees
where firstname like '%Manager%' or lastname like '%Manager%';

-- Department Table
select * from departments;
-- Situation -11 To identify local opportunities, list all the departments located in Pune.
select * from departments 
where location = 'Pune';

-- Situation -12 The board is interested in high-budget projects. Find the details of departments where the budget exceeds ₹10,00,000.
select * from departments
where annualbudget > 1000000;

-- Situation -13 For a leadership meeting, retrieve the departments headed by "Rakesh Mehta".
select * from departments
where headofdepartment = 'Rakesh Mehta';

-- Situation -14 Marketing expansion is being planned. Find all departments whose names start with "M".
select * from departments
where departmentname like 'M%';

-- Situation -15 To allocate funds efficiently, list all departments where the budget is between ₹8,00,000 and ₹15,00,000.
select * from departments 
where annualbudget between 800000 and 1500000;

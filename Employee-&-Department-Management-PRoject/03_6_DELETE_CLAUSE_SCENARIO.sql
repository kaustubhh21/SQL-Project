-- Situation-1: Due to an employee leaving the company, delete the record of EmployeeID 101.
delete from employees
where employeeid = 101;

-- Situation-2: Delete all employees in the HR department (DepartmentID: 2)
-- who joined before 2022.
delete from employees
where departmentid = 2
and year(dateofjoining) < 2022;

-- Situation-3: Delete employees with a salary lower than ₹30,000.
delete from employees
where salary < 30000;

-- Situation-4: Delete employees who joined before 2020
-- and no longer have any active projects.
delete from employees
where year(dateofjoining) < 2020
and (current_project is null or current_project = '');

-- Situation-5: Delete all employees who were working on "Project Beta".
delete from employees
where current_project = 'Project Beta';

-- Situation-6: Delete the record of EmployeeID 135.
delete from employees
where employeeid = 135;

-- Situation-7: Delete employees from the Marketing department (DepartmentID: 3)
-- who joined before 2021.
delete from employees
where departmentid = 3
and year(dateofjoining) < 2021;

-- Situation-8: Delete employees who have not provided
-- their email addresses or contact numbers.
delete from employees
where (email is null or email = '')
or (phone_number is null or phone_number = '');

-- Situation-9: Delete employees earning above ₹1,00,000
-- who were part of a temporary contract.
delete from employees
where salary > 100000
and employment_type = 'Temporary';

-- Situation-10: Delete employees hired in the "North" region
-- whose employment ended before 2023.
delete from employees
where region = 'North'
and year(employment_end_date) < 2023;

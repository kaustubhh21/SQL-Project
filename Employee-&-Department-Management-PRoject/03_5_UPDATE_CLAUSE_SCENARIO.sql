-- Situation-1: Increase salary by 10% for all employees in the IT department (DepartmentID: 3).
update employees
set salary = salary * 1.10
where departmentid = 3;

-- Situation-2: Promote EmployeeID 101 to "Senior Developer".
update employees
set position = 'Senior Developer'
where employeeid = 101;

-- Situation-3: Update the phone number of EmployeeID 120 to "9876543210".
update employees
set phone_number = '9876543210'
where employeeid = 120;

-- Situation-4: Update email domain to "@newcompany.com" for employees who joined after January 1, 2023.
update employees
set email = concat(left(email, locate('@', email) - 1), '@newcompany.com')
where dateofjoining > '2023-01-01';

-- Situation-5: Update department name from "HR" to "Human Resources" for DepartmentID 5.
update departments
set departmentname = 'Human Resources'
where departmentid = 5;

-- Situation-6: Increase salary by ₹5,000 for employees earning below ₹50,000.
update employees
set salary = salary + 5000
where salary < 50000;

-- Situation-7: Update the location of the Marketing department (DepartmentID: 11) to "Mumbai".
update departments
set location = 'Mumbai'
where departmentid = 11;

-- Situation-8: Update salary of EmployeeID 135 to ₹60,000.
update employees
set salary = 60000
where employeeid = 135;

-- Situation-9: Update the project assignment of EmployeeID 110 to "Project Alpha".
update employees
set current_project = 'Project Alpha'
where employeeid = 110;

-- Situation-10: Update joining date of EmployeeID 103 to 2024-03-15.
update employees
set dateofjoining = '2024-03-15'
where employeeid = 103;

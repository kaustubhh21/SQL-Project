-- 4] Situational Questions on CONCAT and Concatenating Words
-- Situation -1: To create a full name column, concatenate the first name and last name of each employee.
select concat(firstname," ",lastname) as Full_Name from employees;

-- Situation -2: For a project report, concatenate the department name and its location to display a complete department address.
select concat(departmentname," Department in ",Location) as Complete_Department_address from departments;

-- Situation -3: To prepare a personalized email greeting, concatenate "Hello " with the employee's name and a comma.
select concat('Hello ', firstname," ",lastname) as Greeting from employees; 

-- Situation -4: For creating a unique employee ID, concatenate the department ID and employee number.
select concat(DepartmentID,employeeID) from employees;

-- Situation -5: For creating a company contact list, concatenate the employee's phone number with their extension (if applicable).
select EmployeeID, FirstName, LastName, CONCAT(phone_number, '-ext-', EmployeeID) as contact_number from Employees;

-- Situation -6: To display the complete address, concatenate the street, city, and postal code of each employee.
select EmployeeID, FirstName, LastName, CONCAT(street, ', ', city, ' - ', postal_code) as complete_address from Employees;

-- Situation -7: To create an employee login ID, concatenate the employee’s first name, last name, and their department ID.
select concat(firstname,lastname,departmentid) as Login_ID from employees;

-- Situation -8: For sending out a personalized notification, concatenate the employee's department with their position.
select EmployeeID, FirstName, LastName, CONCAT(DepartmentID, ' - ', Position) as department_position from Employees;

-- Situation -9: To display the employee's work status, concatenate their job title and current project.
select EmployeeID, FirstName, LastName, CONCAT(job_title, ' - ', current_project) as work_status from Employees;

-- Situation -10: For an annual report, concatenate the year and employee’s first name to create a unique report reference code.
select EmployeeID, CONCAT(YEAR(HireDate), '_', FirstName) as report_reference_code from Employees;

-- 7] Situational Questions on Table Schema Modifications (with Retrieval for Data Consistency)

-- Situation -1: Due to a change in company policy, we need to rename the Employee table to Staff. Please perform the necessary operation to rename the table. 
-- Note: Please do retrieve the changes made for consistency of the data. If you are changing the name of the table, make sure to restore it to the original 
-- state as Employee if needed.
rename table employees to staff;
select * from staff;
rename table staff to employees;
select * from employees;


-- Situation -2: As the company has decided to start tracking employees' marital status, add a new column MaritalStatus of type VARCHAR(20) to 
-- the Employee table. Note: Please do retrieve the changes made for consistency of the data and ensure the data remains accurate for all future entries.
alter table employees
add maritalstatus varchar(20);
desc employees;


-- Situation -3: The company has decided to store the employees' date of birth. Add a DateOfBirth column of type DATE to the Employee table. 
-- Note: Please ensure to retrieve the changes made to check the column's impact on future data consistency.
alter table employees
add dateofbirth date;
desc employees;


-- Situation -4: We need to change the data type of the Salary column in the Employee table from INT to DECIMAL(10,2) to accommodate fractional salary amounts.
-- Note: Please do retrieve the changes made for consistency of the data, ensuring that all existing salary data is preserved accurately.
alter table employees
modify salary decimal(10,2);
desc employees;

-- Situation -5: To better categorize employees, we need to add a new column EmployeeCategory in the Employee table. The column should accept values like "Full-time", 
-- "Part-time", or "Contract". Note: Please ensure the changes are reflected and retrieve the updated schema for consistency.
alter table employees
add employeecategory varchar(20);
desc employees;

-- Situation -6: The company wants to keep track of the department name for employees. Therefore, a column DepartmentName should be added to the Employee table. 
-- Note: After making the change, please retrieve the updates to ensure the column is populated correctly for future entries.
alter table employees
add departmentname varchar(50);
select employeeid, departmentname from employees;

-- Situation -7: We need to set the default value of the Status column in the Employee table to "Active" for any new employee added to the database. 
-- Note: After applying this change, please retrieve the changes and verify that all new employee records default to "Active".
alter table employees
modify status varchar(20) default 'Active';
desc employees;

-- Situation -8: As part of a company-wide restructuring, the DepartmentID column in the Employee table should be renamed to TeamID to reflect the new team-based structure. 
-- Note: Please retrieve the changes made for consistency of the data. If necessary, restore the column name back to DepartmentID for future references.
alter table employees
rename column departmentid to teamid;
desc employees;
alter table employees
rename column teamid to departmentid;
desc employees;

-- Situation -9: The company has decided to archive old employee data, so the Employee table needs to be partitioned by JoinDate in order to keep the data for 
-- employees who joined before 2020 separate. Note: After partitioning the data, ensure to retrieve the changes and check the data consistency and accessibility 
-- for employees prior to 2020.
create table employees_partitioned like employees;
alter table employees_partitioned
partition by range (year(dateofjoining)) (
    partition p_before_2020 values less than (2020),
    partition p_2020_onwards values less than maxvalue
);
select * from employees_partitioned
where year(dateofjoining) < 2020;

-- Situation -10: We need to create a foreign key constraint between the Employee table and the Department table to ensure the integrity of the department data linked 
-- to each employee. Note: Please retrieve the changes made to verify the foreign key relationship, ensuring data integrity and consistency across both tables.
alter table employees
add constraint fk_employee_department
foreign key (departmentid)
references departments(departmentid);
show create table employees;

-- QUESTIONS
-- 1]- Situational Questions on INSERT
-- Situation -1
-- We have hired two employees, Siddharth Gupta (email: siddharth.gupta@example.com, salary: ₹70,000, DOJ: 2024-01-01) and Aarav Jain (email: aarav.jain@example.com, salary: ₹72,000, DOJ: 2024-01-02), in the IT department (DepartmentID: 3). Add these records.
insert into employees (Firstname, Lastname, DepartmentID, Salary, DateofJoining, Email)
value ('Siddharth', 'Gupta', 3, 70000, '2024-01-01', 'siddharth.gupta@example.com'),
('Aarav', 'Jain', 3, 72000, '2024-01-02', 'aarav.jain@example.com');
-- Situation -2
-- The Marketing department has been created (DepartmentID: 11) with a budget of ₹13,00,000, located in Pune, and headed by Rakesh Mehta. Add this department.
insert into departments(Departmentname, Location, HeadofDepartment, Annualbudget)
values ('Marketing', 'Pune', 'Rakesh Mehta', 1300000);
-- Situation -3
-- Three employees have been hired for the Marketing department (DepartmentID: 11): Rahul Mehra (email: rahul.mehra@example.com, salary: ₹58,000, DOJ: 2024-01-10), 
-- Sara Kapoor (email: sara.kapoor@example.com, salary: ₹62,000, DOJ: 2024-01-11), and Nitin Shah (email: nitin.shah@example.com, salary: ₹60,000, DOJ: 2024-01-12). Add these records.
insert into Employees (Firstname, Lastname, DepartmentID, Salary, DateofJoining, Email)
values('Rahul', 'Mehra', 11, 58000, '2024-01-10', 'rahul.mehra@example.com'),
('Sara', 'Kapoor', 11, 62000,'2024-01-11','sara.kapoor@example.com'),
('Nitin','Shah', 11,60000,'2024-01-12','nitin.shah@example.com');
-- Situation -4
-- Two employees have been hired for the HR department (DepartmentID: 1): Riya Sharma (email: riya.sharma@example.com, salary: ₹50,000, DOJ: 2024-02-01) 
-- and Mohit Desai (email: mohit.desai@example.com, salary: ₹55,000, DOJ: 2024-02-02). Add these records.
insert into Employees (Firstname, Lastname, DepartmentID, Salary, DateofJoining, Email)
values('Riya', 'Sharma', 1, 50000, '2024-02-01', 'riya.sharma@example.com'),
('Mohit', 'Desai', 1, 55000,'2024-02-02','mohit.desai@example.com');
-- Situation -5
-- Sneha Rao (email: sneha.rao@example.com) has joined the Finance department (DepartmentID: 2) on 2024-02-15 with a salary of ₹60,000. Add this record.
insert into Employees (Firstname, Lastname, DepartmentID, Salary, DateofJoining, Email)
values('Sneha', 'Rao', 2, 60000, '2024-02-15', 'sneha.rao@example.com');
-- Situation -6
-- Three employees have been hired for the Legal department (DepartmentID: 7): Aditya Malhotra (email: aditya.malhotra@example.com, salary: ₹65,000, DOJ: 2024-03-01), 
-- Priyanka Kapoor (email: priyanka.kapoor@example.com, salary: ₹67,000, DOJ: 2024-03-02), and Kunal Singh (email: kunal.singh@example.com, salary: ₹68,000, DOJ: 2024-03-03). Add these records.
insert into employees (firstname, lastname, departmentid, salary, dateofjoining, email)
values ('Aditya','Malhotra',7,65000,'2024-03-01','aditya.malhotra@example.com'),
('Priyanka','Kapoor',7,67000,'2024-03-02','priyanka.kapoor@example.com'),
('Kunal','Singh',7,68000,'2024-03-03','kunal.singh@example.com');
-- Situation -7
-- The Research department (DepartmentID: 12) has been created with a budget of ₹20,00,000, located in Hyderabad, and headed by Dr. Meera Joshi. Add this department.
insert into departments(Departmentname, Location, Headofdepartment, AnnualBudget)
values ('Research', 'Hyderabad', 'Dr. Meera Joshi', 2000000);
-- Situation -8
-- Two employees have been hired for the Research department (DepartmentID: 12): Arjun Shah (email: arjun.shah@example.com, salary: ₹75,000, DOJ: 2024-04-01) and 
-- Riya Patel (email: riya.patel@example.com, salary: ₹72,000, DOJ: 2024-04-02). Add these records.
insert into employees(firstname, lastname, departmentid, salary, dateofjoining, email)
values('Arjun', 'Shah', 12, 75000,'2024-04-01','arjun.shah@example.com'),
('Riya', 'Patel', 12, 72000,'2024-04-02','riya.patel@example.com');
-- Situation -9
-- The Logistics department (DepartmentID: 13) has been created with a budget of ₹9,00,000, located in Chennai, and headed by Ravi Verma. Add this department.
insert into departments(Departmentname, Location, Headofdepartment, Annualbudget)
values('Logistics', 'Chennai', 'Ravi Verma', 900000);
-- Situation -10
-- Two employees have been hired for the Logistics department (DepartmentID: 13): Kavita Desai (email: kavita.desai@example.com, salary: ₹50,000, DOJ: 2024-05-01) and
-- Amit Jain (email: amit.jain@example.com, salary: ₹52,000, DOJ: 2024-05-02). Add these records.
insert into employees(firstname, lastname, departmentid, salary, dateofjoining, email)
values('Kavita', 'Desai', 13, 50000,'2024-05-01','kavita.desai@example.com'),
('Amit', 'Jain', 13, 52000,'2024-05-02','amit.jain@example.com');
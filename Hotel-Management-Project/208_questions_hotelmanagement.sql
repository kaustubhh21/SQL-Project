-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption.
select * from payments
where paymentmethod = 'UPI';

-- Question - 2] List all unique first names of customers for a duplicate check.
select distinct firstname from customers;

-- Question - 3] Delete all rooms with Capacity = 1.
delete from rooms
where capacity = 1;

-- Question - 4] Display each customer’s name and phone number together using CONCAT.
select concat(firstname, ' ', lastname, ' - ', phone) as customer_contact from customers;

-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room.
select * from bookings
where roomid = 10;

-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
select * from rooms
where capacity > (select avg(capacity) from rooms);

-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone.
create view staffcontact as
select firstname, lastname, role, phone from staff;

-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers.
select * from rooms
where roomtype = 'Suite' and pricepernight < 7000;

-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers table.
select email from customers
order by lastname;

-- Question - 10] Show staff full names combined into one column.
select concat(firstname, ' ', lastname) as full_name from staff;

-- Question - 11] Display all payment details in one line using CONCAT_WS.
select concat_ws(', ', paymentid, bookingid, paymentdate, paymentmethod, amount) as payment_details
from payments;

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests.
select * from rooms
order by pricepernight desc
limit 2;

-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined.
select concat(bookingid, ' : ', checkindate, ' to ', checkoutdate) as booking_dates
from bookings;

-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod.
select paymentmethod, avg(amount) as average_amount
from payments
group by paymentmethod;

-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50.
select city
from customers
group by city
having avg(customerid) > 50;

-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery)
select * from bookings
where totalamount > (select avg(totalamount) from bookings);

-- Question - 17] Display the last 2 added rooms from the Rooms table.
select * from rooms
order by roomid desc
limit 2;

-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
select * from payments
where amount < 1500;

-- Question - 19] Management wants to list all customers who have made more than 5 bookings.
select customerid
from bookings
group by customerid
having count(bookingid) > 5;

-- Question - 20] Identify customers who live in the same city. (Customers self join)
select c1.customerid, c1.firstname, c1.city
from customers c1
join customers c2
on c1.city = c2.city and c1.customerid <> c2.customerid;

-- Question - 21] Show the total revenue handled by each StaffID.
select staffid, sum(totalamount) as total_revenue
from bookings
group by staffid;

-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns.
select * from customers
where city = 'Mumbai';

-- Question - 23] Display the 3 lowest booking amounts.
select * from bookings
order by totalamount asc
limit 3;

-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table.
insert into rooms (roomtype, pricepernight, capacity) values
('Deluxe', 3500, 2),
('Suite', 6500, 3),
('Standard', 2000, 2),
('Family', 5000, 4),
('Economy', 1800, 1);

-- Question - 25] Show all unique CustomerIDs from bookings.
select distinct customerid from bookings;

-- Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
create trigger delete_payment_after_booking_delete
after delete on bookings
for each row
delete from payments
where bookingid = old.bookingid;

-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'.
update customers
set firstname = 'Rahul'
where customerid = 30;

-- Question - 28] List all bookings ordered by CheckInDate.
select * from bookings
order by checkindate;

-- Question - 29] Show all rooms where capacity is greater than 2.
select * from rooms
where capacity > 2;

-- Question - 30] List staff emails ordered by their roles.
select email from staff
order by role;

-- Question - 31] Display each customer’s full name and city using CONCAT_WS.
select concat_ws(' ', firstname, lastname, city) as customer_details
from customers;

-- Question - 32] Show the first 4 customers’ full names only.
select concat(firstname, ' ', lastname) as full_name
from customers
limit 4;

-- Question - 33] Show each staff’s role with their full name.
select concat(firstname, ' ', lastname, ' - ', role) as staff_role
from staff;

-- Question - 34] Management wants to find the average StaffID per role.
select role, avg(staffid) as average_staffid
from staff
group by role;

-- Question - 35] List all bookings handled by StaffID = 2.
select * from bookings
where staffid = 2;

-- Question - 36] Display the first 3 staff alphabetically by their first names.
select * from staff
order by firstname
limit 3;

-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention.
select * from customers
where firstname = 'Amit' and city = 'Nagpur';

-- Question - 38] Show all unique payment methods in descending order.
select distinct paymentmethod
from payments
order by paymentmethod desc;

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email.
insert into staff (firstname, lastname, role, phone, email) values
('Ravi', 'Patil', 'Manager', '9876543211', 'ravi.patil@hotel.com'),
('Sneha', 'Joshi', 'Receptionist', '9876543212', 'sneha.joshi@hotel.com'),
('Amit', 'Verma', 'Chef', '9876543213', 'amit.verma@hotel.com'),
('Neha', 'Shah', 'Housekeeping', '9876543214', 'neha.shah@hotel.com'),
('Karan', 'Mehta', 'Waiter', '9876543215', 'karan.mehta@hotel.com');

-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024-01-01' to analyze recent occupancy.
select * from bookings
where checkindate > '2024-01-01';

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program.
select * from customers
where firstname = 'Rahul';

-- Question - 42] Show all unique room types offered by the hotel.
select distinct roomtype from rooms;

-- Question - 43] Identify customers who spent more than 50,000 in total.
select customerid
from bookings
group by customerid
having sum(totalamount) > 50000;

-- Question - 44] Delete all customers from the city 'TestCity'.
delete from customers
where city = 'TestCity';

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join)
select r1.roomid, r1.pricepernight
from rooms r1
join rooms r2
on r1.pricepernight = r2.pricepernight
and r1.roomid <> r2.roomid;

-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie-ups.
select * from staff
where email like '%@tcs.in';

-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100.
select city
from customers
group by city
having max(customerid) > 100;

-- Question - 48] Show all unique capacities in descending order.
select distinct capacity
from rooms
order by capacity desc;

-- Question - 49] List staff working as Managers.
select * from staff
where role = 'Manager';

-- Question - 50] Display each payment’s ID, Method, Amount in one line.
select concat(paymentid, ' - ', paymentmethod, ' - ', amount) as payment_details
from payments;

-- Question - 51] Show the first 4 payments only.
select * from payments
limit 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts.
select * from rooms
where pricepernight between 2000 and 4000;

-- Question - 53] List all bookings ordered by CheckInDate.
select * from bookings
order by checkindate;

-- Question - 54] Display all unique CustomerIDs from bookings.
select distinct customerid from bookings;

-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table.
insert into customers (firstname, lastname, email, phone, city) values
('Rahul', 'Sharma', 'rahul.sharma@mail.com', '9811111111', 'Mumbai'),
('Amit', 'Patel', 'amit.patel@mail.com', '9822222222', 'Ahmedabad'),
('Neha', 'Joshi', 'neha.joshi@mail.com', '9833333333', 'Pune'),
('Kiran', 'Verma', 'kiran.verma@mail.com', '9844444444', 'Delhi'),
('Sneha', 'Kulkarni', 'sneha.kulkarni@mail.com', '9855555555', 'Nagpur');

-- Question - 56] Show the last 2 staff hired.
select * from staff
order by staffid desc
limit 2;

-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
select * from rooms
where pricepernight >
(select max(pricepernight) from rooms where capacity = 2);

-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation.
select * from staff
where role <> 'Chef';

-- Question - 59] Show all unique cities in descending order from the Customers table.
select distinct city from customers
order by city desc;

-- Question - 60] Display the phone number of the Waiter only.
select phone from staff
where role = 'Waiter';

-- Question - 61] Display the last 2 bookings in the table.
select * from bookings
order by bookingid desc
limit 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions.
select * from customers
where city in ('Delhi', 'Chennai');

-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations.
select * from rooms
where roomtype <> 'Family';

-- Question - 64] List staff emails ordered by their roles.
select email from staff
order by role;

-- Question - 65] Display all unique payment methods.
select distinct paymentmethod from payments;

-- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers.
select * from customers
where phone like '98%';

-- Question - 67] Show the 3 cheapest rooms available for budget travelers.
select * from rooms
order by pricepernight asc
limit 3;

-- Question - 68] Display the last 2 payments.
select * from payments
order by paymentid desc
limit 2;

-- Question - 69] Management wants to know which unique cities customers come from.
select distinct city from customers;

-- Question - 70] List all bookings where TotalAmount > 5000.
select * from bookings
where totalamount > 5000;

-- Question - 71] Display each staff’s Role with their Email in one column.
select concat(role, ' - ', email) as staff_contact
from staff;

-- Question - 72] Show the first 4 staff full names.
select concat(firstname, ' ', lastname) as full_name
from staff
limit 4;

-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery)
select * from bookings
where totalamount >
(select max(totalamount) from bookings where customerid = 10);

-- Question - 74] List rooms with capacity >= 3 for family bookings.
select * from rooms
where capacity >= 3;

-- Question - 75] Display the RoomType and Price of only Suite rooms.
select roomtype, pricepernight from rooms
where roomtype = 'Suite';

-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks.
select * from payments
where amount between 2000 and 7000;

-- Question - 77] Insert 5 booking records into the Bookings table with all details.
insert into bookings (customerid, roomid, staffid, checkindate, checkoutdate, totalamount) values
(1, 2, 1, '2024-01-05', '2024-01-07', 4500),
(2, 3, 2, '2024-02-10', '2024-02-12', 6000),
(3, 4, 3, '2024-03-15', '2024-03-18', 9000),
(4, 5, 4, '2024-04-01', '2024-04-03', 7000),
(5, 1, 2, '2024-05-10', '2024-05-12', 5000);

-- Question - 78] Display the 3 lowest payments made by customers.
select * from payments
order by amount asc
limit 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, ' - ', totalamount) as booking_amount
from bookings;

-- Question - 80] Show all unique RoomIDs in descending order.
select distinct roomid from bookings
order by roomid desc;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS.
select concat_ws(' - ', roomtype, pricepernight) as room_details
from rooms;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3.
delete from bookings
where staffid = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study.
select * from customers
where length(firstname) > 5;

-- Question - 84] Show all unique roles available in the hotel.
select distinct role from staff;

-- Question - 85] List all rooms where capacity is greater than 2.
select * from rooms
where capacity > 2;

-- Question - 86] Display each payment’s ID with Amount using CONCAT.
select concat(paymentid, ' - ', amount) as payment_info
from payments;

-- Question - 87] List all Card payments from the Payments table.
select * from payments
where paymentmethod = 'Card';

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid.
delete from customers
where email like '%@test.com';

-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023-12-31' to measure old occupancy.
select * from bookings
where checkoutdate < '2023-12-31';

-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples.
select * from rooms
where capacity = 2;

-- Question - 91] Show all unique capacities in descending order.
select distinct capacity from rooms
order by capacity desc;

-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings.
select min(totalamount) as minimum_totalamount
from bookings;

-- Question - 93] Display all rooms by capacity in ascending order.
select * from rooms
order by capacity asc;

-- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, ' - ', totalamount) as booking_amount
from bookings;

-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for premium family packages.
select * from rooms
where capacity = 4 and pricepernight > 6000;

-- Question - 96] Show staff full names combined into one column.
select concat(firstname, ' ', lastname) as full_name
from staff;

-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than ₹10,000 to track high-value customers.
select * from bookings
where totalamount > 10000;

-- Question - 98] Show all unique payment methods in descending order.
select distinct paymentmethod from payments
order by paymentmethod desc;

-- Question - 99] List staff members who share the same Role. (Staff self join)
select s1.staffid, s1.firstname, s1.role
from staff s1
join staff s2
on s1.role = s2.role and s1.staffid <> s2.staffid;

-- Question - 100] Show customer first name, last name, and TotalAmount of their bookings using JOIN between Customers and Bookings.
select c.firstname, c.lastname, b.totalamount
from customers c
join bookings b on c.customerid = b.customerid;

-- Question - 101] Display the first 4 bookings only.
select * from bookings
limit 4;

-- Question - 102] Show all unique staff first names.
select distinct firstname from staff;

-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table.
insert into rooms (roomtype, pricepernight, capacity) values
('Deluxe', 4200, 2),
('Suite', 7500, 4),
('Standard', 2500, 2),
('Family', 5200, 4),
('Economy', 1800, 1);

-- Question - 104] Display each customer’s full name and city using CONCAT_WS.
select concat_ws(' ', firstname, lastname, city) as customer_details
from customers;

-- Question - 105] Show all unique cities in descending order from the Customers table.
select distinct city from customers
order by city desc;

-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is morethan 100.
select city
from customers
group by city
having max(customerid) > 100;

-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition.
select * from staff
where firstname = 'Priya';

-- Question - 108] Display the last 2 staff members from the Staff table.
select * from staff
order by staffid desc
limit 2;

-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount.
create view bookingsummary as
select bookingid, customerid, roomid, totalamount
from bookings;

-- Question - 110] Show all unique RoomIDs in descending order.
select distinct roomid from bookings
order by roomid desc;

-- Question - 111] Display each staff’s role with their full name.
select concat(firstname, ' ', lastname, ' - ', role) as staff_role
from staff;

-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers.
select * from rooms
where roomtype = 'Suite' and pricepernight < 7000;

-- Question - 113] Display the first 3 staff alphabetically by their first names.
select * from staff
order by firstname
limit 3;

-- Question - 114] List all bookings ordered by CheckInDate.
select * from bookings
order by checkindate;

-- Question - 115] Show all unique StaffIDs from the bookings.
select distinct staffid from bookings;

-- Question - 116] Display the first 4 customers’ full names only.
select concat(firstname, ' ', lastname) as full_name
from customers
limit 4;

-- Question - 117] Show all unique room types offered by the hotel.
select distinct roomtype from rooms;

-- Question - 118] Display the phone number of the Waiter only.
select phone from staff
where role = 'Waiter';

-- Question - 119] Show all bookings where TotalAmount > 5000.
select * from bookings
where totalamount > 5000;

-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12.
update staff
set role = 'Senior Manager'
where staffid = 12;

-- Question - 121] List all staff working as Managers.
select * from staff
where role = 'Manager';

-- Question - 122] Show the last 2 registered customers for follow-up.
select * from customers
order by customerid desc
limit 2;

-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, ' - ', totalamount) as booking_amount
from bookings;

-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email.
insert into staff (firstname, lastname, role, phone, email) values
('Anita', 'Rao', 'Manager', '9876500011', 'anita.rao@hotel.com'),
('Vikas', 'Shah', 'Receptionist', '9876500012', 'vikas.shah@hotel.com'),
('Pooja', 'Mehta', 'Chef', '9876500013', 'pooja.mehta@hotel.com'),
('Suresh', 'Patil', 'Housekeeping', '9876500014', 'suresh.patil@hotel.com'),
('Nikhil', 'Desai', 'Waiter', '9876500015', 'nikhil.desai@hotel.com');

-- Question - 125] Display the RoomType and Price of only Suite rooms.
select roomtype, pricepernight from rooms
where roomtype = 'Suite';

-- Question - 126] The admin wants to delete all payments linked to BookingID = 15.
delete from payments
where bookingid = 15;

-- Question - 127] Display all unique capacities in descending order.
select distinct capacity from rooms
order by capacity desc;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType.
select * from rooms
order by roomtype
limit 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
select * from payments
where amount < 1500;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, ' - ', totalamount) as booking_amount
from bookings;

-- Question - 131] Display the last 2 added rooms from the Rooms table.
select * from rooms
order by roomid desc
limit 2;

-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention.
select * from customers
where firstname = 'Amit' and city = 'Nagpur';

-- Question - 133] Insert 5 new customer details into the Customers table.
insert into customers (firstname, lastname, email, phone, city) values
('Rohit', 'Jain', 'rohit.jain@mail.com', '9812345670', 'Indore'),
('Pankaj', 'Verma', 'pankaj.verma@mail.com', '9812345671', 'Bhopal'),
('Swati', 'Kulkarni', 'swati.kulkarni@mail.com', '9812345672', 'Pune'),
('Manoj', 'Yadav', 'manoj.yadav@mail.com', '9812345673', 'Lucknow'),
('Ankita', 'Singh', 'ankita.singh@mail.com', '9812345674', 'Patna');

-- Question - 134] Show staff full names combined into one column.
select concat(firstname, ' ', lastname) as full_name
from staff;

-- Question - 135] Show all room details separated by commas using CONCAT_WS.
select concat_ws(', ', roomid, roomtype, pricepernight, capacity) as room_details
from rooms;

-- Question - 136] Display each customer’s name and phone number together using CONCAT.
select concat(firstname, ' ', lastname, ' - ', phone) as customer_contact
from customers;

-- Question - 137] Display all payment details in one line using CONCAT_WS.
select concat_ws(', ', paymentid, bookingid, paymentdate, paymentmethod, amount) as payment_details
from payments;

-- Question - 138] Show the last 2 bookings in the table.
select * from bookings
order by bookingid desc
limit 2;

-- Question - 139] List all payments ordered by PaymentDate.
select * from payments
order by paymentdate;

-- Question - 140] Show the 2 highest payments received.
select * from payments
order by amount desc
limit 2;

-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyalty program.
select * from customers
where firstname = 'Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT.
select concat(paymentid, ' - ', paymentmethod) as payment_info
from payments;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times.
select paymentmethod
from payments
group by paymentmethod
having count(paymentid) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests.
select * from rooms
order by pricepernight desc
limit 2;

-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS.
select concat_ws(' - ', roomtype, pricepernight) as room_details
from rooms;

-- Question - 146] Display the first 3 staff alphabetically by their first names.
select * from staff
order by firstname
limit 3;

-- Question - 147] List all bookings handled by StaffID = 2.
select * from bookings
where staffid = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50.
select city
from customers
group by city
having avg(customerid) > 50;

-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests.
select * from rooms
order by pricepernight desc
limit 2;

-- Question - 150] Show all unique first names of customers for a duplicate check.
select distinct firstname from customers;

-- Question - 151] Show all unique roles in descending order.
select distinct role from staff
order by role desc;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
select * from rooms
where capacity > (select avg(capacity) from rooms);

-- Question - 153] Display all rooms by capacity in ascending order.
select * from rooms
order by capacity asc;

-- Question - 154] Display the first 4 payments only.
select * from payments
limit 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line.
select concat(paymentid, ' - ', paymentmethod, ' - ', amount) as payment_details
from payments;

-- Question - 156] List all bookings where TotalAmount > 5000.
select * from bookings
where totalamount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. (Customers subquery)
select * from customers
where customerid > (select avg(customerid) from customers);

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation.
select * from staff
where role <> 'Chef';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than ₹10,000.
select * from bookings
where totalamount > 10000;

-- Question - 160] Display each staff’s role with their full name.
select concat(firstname, ' ', lastname, ' - ', role) as staff_role
from staff;

-- Question - 161] List staff members who share the same Role. (Staff self join)
select s1.staffid, s1.firstname, s1.role
from staff s1
join staff s2
on s1.role = s2.role and s1.staffid <> s2.staffid;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments.
select concat(c.firstname, ' ', c.lastname) as customer_name, p.amount
from customers c
join bookings b on c.customerid = b.customerid
join payments p on b.bookingid = p.bookingid;

-- Question - 163] Display all bookings where TotalAmount > 5000.
select * from bookings
where totalamount > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'.
select * from customers
where phone like '98%';

-- Question - 165] Identify customers who live in the same city. (Customers self join)
select c1.customerid, c1.firstname, c1.city
from customers c1
join customers c2
on c1.city = c2.city and c1.customerid <> c2.customerid;

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'.
select * from bookings
where checkoutdate < '2023-12-31';

-- Question - 167] Display all unique StaffIDs from the bookings.
select distinct staffid from bookings;

-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'.
create view onlinepayments as
select * from payments
where paymentmethod = 'Online';

-- Question - 169] Display all unique payment methods in descending order.
select distinct paymentmethod from payments
order by paymentmethod desc;

-- Question - 170] Display each payment’s ID with Amount using CONCAT.
select concat(paymentid, ' - ', amount) as payment_info
from payments;

-- Question - 171] Show all unique RoomIDs in descending order.
select distinct roomid from bookings
order by roomid desc;

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100.
select city
from customers
group by city
having max(customerid) > 100;

-- Question - 173] List staff emails ordered by their roles.
select email from staff
order by role;

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery)
select * from bookings
where totalamount > (select avg(totalamount) from bookings);

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recommendations.
select * from rooms
where pricepernight > 5000;

-- Question - 176] Show all unique capacities in descending order.
select distinct capacity from rooms
order by capacity desc;

-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType.
select * from rooms
order by roomtype
limit 4;

-- Question - 178] Show all unique staff first names.
select distinct firstname from staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
select * from rooms
where pricepernight >
(select max(pricepernight) from rooms where capacity = 2);

-- Question - 180] Show all unique cities in descending order from the Customers table.
select distinct city from customers
order by city desc;

-- Question - 181] List all bookings where TotalAmount > 5000.
select * from bookings
where totalamount > 5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
select p.paymentid, concat(c.firstname, ' ', c.lastname) as customer_name, b.bookingid
from payments p
join bookings b on p.bookingid = b.bookingid
join customers c on b.customerid = c.customerid
where p.paymentmethod = 'Credit Card';

-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, ' - ', totalamount) as booking_amount
from bookings;

-- Question - 184] Show all bookings handled by StaffID = 2.
select * from bookings
where staffid = 2;

-- Question - 185] Display the last 2 added rooms from the Rooms table.
select * from rooms
order by roomid desc
limit 2;

-- Question - 186] List all rooms where capacity is greater than 2.
select * from rooms
where capacity > 2;

-- Question - 187] Display the last 2 staff members from the Staff table.
select * from staff
order by staffid desc
limit 2;

-- Question - 188] Show all unique roles available in the hotel.
select distinct role from staff;

-- Question - 189] Display the last 2 payments.
select * from payments
order by paymentid desc
limit 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests.
select * from bookings
where customerid in (2,4,6,8);

-- Question - 191] Show all unique first names of customers for a duplicate check.
select distinct firstname from customers;

-- Question - 192] Display all bookings where TotalAmount > 5000.
select * from bookings
where totalamount > 5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000.
delete from payments
where amount < 1000;

-- Question - 194] Display all unique RoomIDs in descending order.
select distinct roomid from bookings
order by roomid desc;

-- Question - 195] List customers who made more than 5 bookings.
select customerid
from bookings
group by customerid
having count(bookingid) > 5;

-- Question - 196] Display all rooms by capacity in ascending order.
select * from rooms
order by capacity asc;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, ' - ', totalamount) as booking_amount
from bookings;

-- Question - 198] List all staff working as Managers.
select * from staff
where role = 'Manager';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study.
select * from customers
where length(firstname) > 5;

-- Question - 200] Display all unique capacities in descending order.
select distinct capacity from rooms
order by capacity desc;

-- Question - 201] List staff members who share the same Role. (Staff self join)
select s1.staffid, s1.firstname, s1.role
from staff s1
join staff s2
on s1.role = s2.role and s1.staffid <> s2.staffid;

-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
select p.paymentid, concat(c.firstname, ' ', c.lastname) as customer_name, b.bookingid
from payments p
join bookings b on p.bookingid = b.bookingid
join customers c on b.customerid = c.customerid
where p.paymentmethod = 'Credit Card';

-- Question - 203] Display the first 4 payments only.
select * from payments
limit 4;

-- Question - 204] Show each payment’s ID, Method, Amount in one line.
select concat(paymentid, ' - ', paymentmethod, ' - ', amount) as payment_details
from payments;

-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20,000.
create view highvaluebookings as
select * from bookings
where totalamount > 20000;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
Delimiter //
create trigger delete_payment_after_booking_delete
after delete on bookings
for each row
delete from payments
where bookingid = old.bookingid;

delimiter //

-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate.

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments.
create trigger update_booking_total_after_payment
after insert on payments
for each row
update bookings
set totalamount = totalamount + new.amount
where bookingid = new.bookingid;

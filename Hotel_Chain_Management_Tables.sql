DROP DATABASE IF EXISTS Hotel_chain_management_system;

CREATE DATABASE Hotel_chain_management_system;

USE Hotel_chain_management_system;

DROP TABLE IF EXISTS Feedback, Employee, Roles, Bookings, Guest, Rooms, Hotel;

CREATE TABLE Hotel (
    hotel_code INT NOT NULL PRIMARY KEY,
    hotel_name VARCHAR(250),
    city VARCHAR(250),
    number_of_rooms INT,
    star_rating FLOAT
);

CREATE TABLE Rooms (
    room_num INT NOT NULL PRIMARY KEY,
    room_type VARCHAR(250),
    price_per_night INT,
    availability_status VARCHAR(250),
    hotel_id INT,
    FOREIGN KEY(hotel_id) REFERENCES Hotel(hotel_code)
);

CREATE TABLE Guest (
    guest_ID INT NOT NULL PRIMARY KEY,
    guest_name VARCHAR(250),
    loyalty_level VARCHAR(250)
);

CREATE TABLE Bookings (
    booking_id INT NOT NULL PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATETIME,
    check_out DATETIME,
    total_bill FLOAT,
    FOREIGN KEY(guest_id) REFERENCES Guest(guest_ID),
    FOREIGN KEY(room_id) REFERENCES Rooms(room_num)
);

CREATE TABLE Roles (
    role_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(250)
);

CREATE TABLE Employee (
    employee_ID INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(250),
    role_id INT,
    hotel_assigned INT,
    shift_details VARCHAR(250),
    FOREIGN KEY(role_id) REFERENCES Roles(role_id),
    FOREIGN KEY(hotel_assigned) REFERENCES Hotel(hotel_code)
);

CREATE TABLE Feedback (
    ffeedback_id INT NOT NULL PRIMARY KEY,
    booking_id INT,
    comments VARCHAR(250),
    rating FLOAT,
    FOREIGN KEY(booking_id) REFERENCES Bookings(booking_id)
);

-- Now insert data, without duplicates and with corrected columns

INSERT INTO Hotel (hotel_code, hotel_name, city, number_of_rooms, star_rating) VALUES
(101, 'Grand Plaza', 'New York', 150, 4.5),
(102, 'Ocean View Resort', 'Miami', 120, 4.2),
(103, 'Mountain Retreat', 'Denver', 80, 4.8),
(104, 'City Center Inn', 'Chicago', 100, 4.0),
(105, 'Sunset Motel', 'Los Angeles', 60, 3.5),
(106, 'Lakeside Hotel', 'Orlando', 90, 4.3),
(107, 'Downtown Suites', 'San Francisco', 110, 4.7);

INSERT INTO Rooms (room_num, room_type, price_per_night, availability_status, hotel_id) VALUES
(1, 'Single', 100, 'Available', 101),
(2, 'Double', 150, 'Booked', 101),
(3, 'Suite', 300, 'Available', 101),
(101, 'Single', 90, 'Available', 102),
(102, 'Double', 140, 'Booked', 102),
(201, 'Suite', 350, 'Available', 103),
(202, 'Double', 160, 'Booked', 103),
(301, 'Single', 80, 'Available', 104),
(302, 'Suite', 250, 'Booked', 104),
(401, 'Double', 120, 'Available', 105),
(402, 'Single', 70, 'Available', 105),
(501, 'Suite', 400, 'Booked', 106),
(502, 'Double', 130, 'Available', 106),
(601, 'Single', 150, 'Booked', 107);

INSERT INTO Guest (guest_ID, guest_name, loyalty_level) VALUES
(1, 'Alice Johnson', 'Gold'),
(2, 'Bob Smith', 'Silver'),
(3, 'Charlie Brown', 'Platinum'),
(4, 'Diana Prince', 'Gold'),
(5, 'Ethan Hunt', 'Silver'),
(6, 'Fiona Gallagher', 'Gold'),
(7, 'George Michael', 'Bronze');

INSERT INTO Bookings (booking_id, guest_id, room_id, check_in, check_out, total_bill) VALUES
(1001, 1, 2, '2025-06-10 15:00:00', '2025-06-15 11:00:00', 750.0),
(1002, 2, 102, '2025-06-12 14:00:00', '2025-06-14 10:00:00', 280.0),
(1003, 3, 201, '2025-07-01 16:00:00', '2025-07-05 11:00:00', 1400.0),
(1004, 4, 302, '2025-07-10 15:00:00', '2025-07-12 11:00:00', 500.0),
(1005, 5, 401, '2025-06-20 13:00:00', '2025-06-22 11:00:00', 240.0),
(1006, 6, 501, '2025-07-15 14:00:00', '2025-07-18 11:00:00', 1200.0),
(1007, 7, 601, '2025-08-01 16:00:00', '2025-08-04 11:00:00', 450.0);

INSERT INTO Roles (role_id, role_name) VALUES
(1, 'Manager'),
(2, 'Receptionist'),
(3, 'Housekeeping'),
(4, 'Chef'),
(5, 'Security'),
(6, 'Maintenance'),
(7, 'Concierge');

INSERT INTO Employee (employee_ID, emp_name, role_id, hotel_assigned, shift_details) VALUES
(501, 'John Doe', 1, 101, 'Morning Shift'),
(502, 'Emma Stone', 2, 102, 'Evening Shift'),
(503, 'Michael Clarke', 3, 103, 'Night Shift'),
(504, 'Sophie Turner', 4, 104, 'Morning Shift'),
(505, 'David Miller', 5, 105, 'Night Shift'),
(506, 'Olivia Brown', 6, 106, 'Evening Shift'),
(507, 'Liam Wilson', 7, 107, 'Morning Shift');

INSERT INTO Feedback (ffeedback_id, booking_id, comments, rating) VALUES
(9001, 1001, 'Very comfortable stay and friendly staff.', 4.8),
(9002, 1002, 'Great location but room was a bit noisy.', 3.9),
(9003, 1003, 'Loved the view and the suite was spacious.', 5.0),
(9004, 1004, 'Good service but food could improve.', 4.0),
(9005, 1005, 'Nice and cozy, would visit again.', 4.2),
(9006, 1006, 'Excellent amenities and staff.', 4.9),
(9007, 1007, 'Room was clean but a bit small.', 3.8);


DROP DATABASE IF EXISTS Hotel_chain_management_system;

CREATE DATABASE Hotel_chain_management_system;

USE Hotel_chain_management_system;

CREATE TABLE Hotel (
    hotel_id INT NOT NULL PRIMARY KEY,
    hotel_name VARCHAR(250) NOT NULL,
    city VARCHAR(250),
    number_of_rooms INT CHECK (number_of_rooms >= 0),
    star_rating DECIMAL(2,1) CHECK (star_rating >= 0 AND star_rating <= 5)
);

CREATE TABLE Rooms (
    room_id INT NOT NULL PRIMARY KEY,
    room_type VARCHAR(250),
    price_per_night DECIMAL(10,2) CHECK (price_per_night >= 0),
    availability_status ENUM('available', 'occupied', 'maintenance') DEFAULT 'available',
    hotel_id INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

CREATE TABLE Guest (
    guest_id INT NOT NULL PRIMARY KEY,
    guest_name VARCHAR(250) NOT NULL,
    loyalty_level VARCHAR(250)
);

CREATE TABLE Bookings (
    booking_id INT NOT NULL PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATETIME NOT NULL,
    check_out DATETIME NOT NULL,
    total_bill DECIMAL(10,2) CHECK (total_bill >= 0),
    FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    CHECK (check_out > check_in)
);

CREATE TABLE Roles (
    role_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(250) NOT NULL
);

CREATE TABLE Employee (
    employee_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(250) NOT NULL,
    role_id INT,
    hotel_id INT,
    shift_details VARCHAR(250),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

DROP TABLE IF EXISTS Feedback;

CREATE TABLE Feedback (
    feedback_id INT NOT NULL PRIMARY KEY,
    booking_id INT NOT NULL,
    comments VARCHAR(250),
    rating FLOAT CHECK (rating >= 0 AND rating <= 5),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Insert Hotels
INSERT INTO Hotel (hotel_id, hotel_name, city, number_of_rooms, star_rating) VALUES
(1, 'Grand Plaza', 'New York', 150, 4.5),
(2, 'Seaside Resort', 'Miami', 100, 4.0),
(3, 'Mountain Inn', 'Denver', 80, 3.8);

-- Insert Rooms
INSERT INTO Rooms (room_id, room_type, price_per_night, availability_status, hotel_id) VALUES
(101, 'Single', 120.00, 'available', 1),
(102, 'Double', 180.00, 'occupied', 1),
(201, 'Suite', 300.00, 'available', 2),
(202, 'Double', 150.00, 'maintenance', 2),
(301, 'Single', 100.00, 'available', 3);

-- Insert Guests
INSERT INTO Guest (guest_id, guest_name, loyalty_level) VALUES
(1, 'Alice Johnson', 'Gold'),
(2, 'Bob Smith', 'Silver'),
(3, 'Charlie Lee', 'Bronze');

-- Insert Roles
INSERT INTO Roles (role_id, role_name) VALUES
(1, 'Manager'),
(2, 'Receptionist'),
(3, 'Housekeeping');

-- Insert Employees
INSERT INTO Employee (employee_id, emp_name, role_id, hotel_id, shift_details) VALUES
(1, 'Sarah Parker', 1, 1, 'Morning'),
(2, 'James Wilson', 2, 2, 'Evening'),
(3, 'Linda Gomez', 3, 3, 'Night');

-- Insert Bookings
INSERT INTO Bookings (booking_id, guest_id, room_id, check_in, check_out, total_bill) VALUES
(1, 1, 101, '2025-06-10 14:00:00', '2025-06-15 11:00:00', 600.00),
(2, 2, 201, '2025-07-01 15:00:00', '2025-07-05 12:00:00', 1200.00),
(3, 3, 301, '2025-06-20 16:00:00', '2025-06-22 10:00:00', 200.00);

INSERT INTO Feedback (feedback_id, booking_id, comments, rating) VALUES
(1, 1, 'Great stay, very comfortable rooms and excellent service.', 4.8),
(2, 2, 'Beautiful location but the room was a bit noisy.', 3.9),
(3, 3, 'Staff were friendly, but the room was smaller than expected.', 4.0);

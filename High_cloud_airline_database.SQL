– High Cloud Airline MySQL Schema 


CREATE DATABASE HighCloudAirlineDB;
USE HighCloudAirlineDB;
-- 2. Tables and Schema
-- Airports

CREATE TABLE Airports (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    airport_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    iata_code CHAR(3)
);



CREATE TABLE Aircrafts (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_model VARCHAR(50),
    capacity INT,
    manufacturer VARCHAR(50)
);





CREATE TABLE Routes (
    route_id INT PRIMARY KEY AUTO_INCREMENT,
    origin_airport_id INT,
    destination_airport_id INT,
    FOREIGN KEY (origin_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES Airports(airport_id)
);






CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    route_id INT,
    aircraft_id INT,
    flight_date DATE,
    scheduled_departure DATETIME,
    actual_departure DATETIME,
    scheduled_arrival DATETIME,
    actual_arrival DATETIME,
    FOREIGN KEY (route_id) REFERENCES Routes(route_id),
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id)
);







CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    nationality VARCHAR(50)
);








CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_class ENUM('Economy', 'Business', 'First'),
    ticket_price DECIMAL(10,2),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);







CREATE TABLE FlightDelays (
    delay_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT,
    delay_reason VARCHAR(100),
    delay_minutes INT,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);










INSERT INTO Airports (airport_name, city, country, iata_code) VALUES
('John F. Kennedy International Airport', 'New York', 'USA', 'JFK'),
('Los Angeles International Airport', 'Los Angeles', 'USA', 'LAX'),
('Heathrow Airport', 'London', 'UK', 'LHR'),
('Dubai International Airport', 'Dubai', 'UAE', 'DXB'),
('Changi Airport', 'Singapore', 'Singapore', 'SIN'),
('Haneda Airport', 'Tokyo', 'Japan', 'HND'),
('Sydney Kingsford Smith Airport', 'Sydney', 'Australia', 'SYD'),
('Charles de Gaulle Airport', 'Paris', 'France', 'CDG'),
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA'),
('Toronto Pearson International Airport', 'Toronto', 'Canada', 'YYZ'),
('Incheon International Airport', 'Seoul', 'South Korea', 'ICN'),
('Beijing Capital Airport', 'Beijing', 'China', 'PEK'),
('Madrid-Barajas Airport', 'Madrid', 'Spain', 'MAD'),
('Istanbul Airport', 'Istanbul', 'Turkey', 'IST'),
('Amsterdam Schiphol Airport', 'Amsterdam', 'Netherlands', 'AMS'),
('Zurich Airport', 'Zurich', 'Switzerland', 'ZRH'),
('Brussels Airport', 'Brussels', 'Belgium', 'BRU'),
('Vienna International Airport', 'Vienna', 'Austria', 'VIE'),
('Cairo International Airport', 'Cairo', 'Egypt', 'CAI'),
('Indira Gandhi International Airport', 'Delhi', 'India', 'DEL');








INSERT INTO Aircrafts (aircraft_model, capacity, manufacturer) VALUES
('Boeing 777', 396, 'Boeing'),
('Airbus A380', 853, 'Airbus'),
('Boeing 737', 215, 'Boeing'),
('Airbus A350', 440, 'Airbus'),
('Boeing 787', 296, 'Boeing'),
('Airbus A320', 180, 'Airbus'),
('Embraer E190', 114, 'Embraer'),
('Bombardier CRJ900', 90, 'Bombardier'),
('Boeing 767', 375, 'Boeing'),
('Airbus A330', 335, 'Airbus'),
('Comac C919', 168, 'COMAC'),
('Tupolev Tu-204', 210, 'Tupolev'),
('McDonnell Douglas MD-11', 293, 'McDonnell Douglas'),
('Concorde', 100, 'Aérospatiale/BAC'),
('Boeing 727', 189, 'Boeing'),
('Airbus A310', 280, 'Airbus'),
('Ilyushin Il-96', 262, 'Ilyushin'),
('Lockheed L-1011', 250, 'Lockheed'),
('Boeing 747', 660, 'Boeing'),
('Airbus A319', 144, 'Airbus');



INSERT INTO Routes (origin_airport_id, destination_airport_id) VALUES
(1, 2), (2, 3), (3, 4), (4, 5), (5, 1),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 6),
(11, 12), (12, 13), (13, 14), (14, 15), (15, 11),
(16, 17), (17, 18), (18, 19), (19, 20), (20, 16);






INSERT INTO Flights (route_id, aircraft_id, flight_date, scheduled_departure, actual_departure, scheduled_arrival, actual_arrival) VALUES
(1, 1, '2025-04-01', '2025-04-01 08:00:00', '2025-04-01 08:10:00', '2025-04-01 11:00:00', '2025-04-01 11:20:00'),
(2, 2, '2025-04-02', '2025-04-02 14:00:00', '2025-04-02 14:00:00', '2025-04-02 22:00:00', '2025-04-02 22:00:00'),
(3, 3, '2025-04-03', '2025-04-03 09:00:00', '2025-04-03 09:30:00', '2025-04-03 17:00:00', '2025-04-03 17:45:00'),
(4, 4, '2025-04-04', '2025-04-04 11:00:00', '2025-04-04 11:05:00', '2025-04-04 19:00:00', '2025-04-04 18:55:00'),
(5, 5, '2025-04-05', '2025-04-05 07:00:00', '2025-04-05 07:00:00', '2025-04-05 13:00:00', '2025-04-05 13:00:00'),
(6, 6, '2025-04-06', '2025-04-06 06:00:00', '2025-04-06 06:05:00', '2025-04-06 12:00:00', '2025-04-06 12:10:00'),
(7, 7, '2025-04-07', '2025-04-07 10:00:00', '2025-04-07 10:30:00', '2025-04-07 16:00:00', '2025-04-07 16:40:00'),
(8, 8, '2025-04-08', '2025-04-08 15:00:00', '2025-04-08 15:20:00', '2025-04-08 20:30:00', '2025-04-08 20:50:00'),
(9, 9, '2025-04-09', '2025-04-09 13:00:00', '2025-04-09 13:00:00', '2025-04-09 18:00:00', '2025-04-09 18:00:00'),
(10, 10, '2025-04-10', '2025-04-10 07:00:00', '2025-04-10 07:10:00', '2025-04-10 11:00:00', '2025-04-10 11:15:00'),
(11, 11, '2025-04-11', '2025-04-11 10:00:00', '2025-04-11 10:00:00', '2025-04-11 14:00:00', '2025-04-11 14:00:00'),
(12, 12, '2025-04-12', '2025-04-12 08:00:00', '2025-04-12 08:05:00', '2025-04-12 15:00:00', '2025-04-12 15:10:00'),
(13, 13, '2025-04-13', '2025-04-13 09:00:00', '2025-04-13 09:00:00', '2025-04-13 13:00:00', '2025-04-13 13:00:00'),
(14, 14, '2025-04-14', '2025-04-14 06:00:00', '2025-04-14 06:10:00', '2025-04-14 10:00:00', '2025-04-14 10:15:00'),
(15, 15, '2025-04-15', '2025-04-15 07:30:00', '2025-04-15 07:45:00', '2025-04-15 11:30:00', '2025-04-15 11:50:00'),
(16, 16, '2025-04-16', '2025-04-16 12:00:00', '2025-04-16 12:20:00', '2025-04-16 18:00:00', '2025-04-16 18:30:00'),
(17, 17, '2025-04-17', '2025-04-17 08:00:00', '2025-04-17 08:00:00', '2025-04-17 12:00:00', '2025-04-17 12:00:00'),
(18, 18, '2025-04-18', '2025-04-18 10:00:00', '2025-04-18 10:10:00', '2025-04-18 16:00:00', '2025-04-18 16:40:00'),
(19, 19, '2025-04-19', '2025-04-19 13:00:00', '2025-04-19 13:30:00', '2025-04-19 17:00:00', '2025-04-19 17:50:00'),
(20, 20, '2025-04-20', '2025-04-20 09:00:00', '2025-04-20 09:15:00', '2025-04-20 14:00:00', '2025-04-20 14:30:00');




INSERT INTO Passengers (first_name, last_name, gender, nationality) VALUES
('Alice', 'Johnson', 'Female', 'USA'),
('Bob', 'Smith', 'Male', 'UK'),
('Chloe', 'Tan', 'Female', 'Singapore'),
('David', 'Lee', 'Male', 'UAE'),
('Eva', 'Miller', 'Female', 'USA'),
('Liam', 'Garcia', 'Male', 'Mexico'),
('Olivia', 'Wong', 'Female', 'Malaysia'),
('Noah', 'Kim', 'Male', 'South Korea'),
('Sophia', 'Brown', 'Female', 'Canada'),
('James', 'Anderson', 'Male', 'USA'),
('Isabella', 'Martinez', 'Female', 'Spain'),
('Benjamin', 'Nguyen', 'Male', 'Vietnam'),
('Mia', 'Patel', 'Female', 'India'),
('Lucas', 'Chen', 'Male', 'Taiwan'),
('Charlotte', 'Wilson', 'Female', 'Australia'),
('Elijah', 'Alvarez', 'Male', 'Colombia'),
('Amelia', 'Thomas', 'Female', 'UK'),
('Ethan', 'Yamada', 'Male', 'Japan'),
('Grace', 'Singh', 'Female', 'India'),
('Henry', 'Zhang', 'Male', 'China');





INSERT INTO Bookings (passenger_id, flight_id, booking_date, seat_class, ticket_price) VALUES
(1, 1, '2025-03-20', 'Economy', 450.00),
(2, 2, '2025-03-21', 'Business', 1200.00),
(3, 3, '2025-03-22', 'Economy', 700.00),
(4, 4, '2025-03-23', 'First', 2000.00),
(5, 5, '2025-03-24', 'Economy', 800.00),
(6, 3, '2025-03-25', 'Business', 1100.00),
(7, 1, '2025-03-26', 'First', 2500.00),
(8, 6, '2025-03-27', 'Economy', 600.00),
(9, 7, '2025-03-28', 'Business', 950.00),
(10, 8, '2025-03-29', 'Economy', 520.00),
(11, 9, '2025-03-30', 'First', 1900.00),
(12, 2, '2025-03-31', 'Business', 1000.00),
(13, 4, '2025-04-01', 'Economy', 720.00),
(14, 5, '2025-04-02', 'Economy', 830.00),
(15, 6, '2025-04-03', 'First', 2100.00),
(16, 7, '2025-04-04', 'Business', 1130.00),
(17, 8, '2025-04-05', 'Economy', 640.00),
(18, 9, '2025-04-06', 'First', 1800.00),
(19, 10, '2025-04-07', 'Business', 990.00),
(20, 1, '2025-04-08', 'Economy', 580.00);






INSERT INTO FlightDelays (flight_id, delay_reason, delay_minutes) VALUES
(1, 'Weather', 20),
(3, 'Technical Issue', 45),
(4, 'Runway Traffic', 5),
(2, 'Security Check', 15),
(5, 'Late Arrival of Aircraft', 30),
(6, 'Crew Unavailable', 40),
(7, 'Air Traffic Congestion', 25),
(8, 'Weather', 60),
(9, 'Technical Issue', 35),
(10, 'Security Alert', 50),
(11, 'Runway Maintenance', 20),
(12, 'Passenger Medical Emergency', 10),
(13, 'Late Boarding', 12),
(14, 'Fuel Refill Delay', 18),
(15, 'Catering Services Delay', 22),
(16, 'Weather', 55),
(17, 'Luggage Loading Delay', 14),
(18, 'Crew Shift Change', 30),
(19, 'Flight Plan Clearance', 8),
(20, 'Technical Issue', 42);


select * from Airports;
SELECT * FROM Aircrafts;
select * from Routes;
select * from Flights;
select * from Passengers;
SELECT * FROM BOOKINGS;
SELECT * FROM FlightDelays;


-- 📊 1. Total Bookings by Seat Class


SELECT seat_class, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY seat_class;



-- 2. Daily Flight Count (useful for time-series visualization)

SELECT flight_date, COUNT(*) AS flights_count
FROM Flights
GROUP BY flight_date
ORDER BY flight_date;





-- 📌 3. Most Frequent Routes

SELECT 
    a1.airport_name AS origin,
    a2.airport_name AS destination,
    COUNT(*) AS total_flights
FROM Flights f
JOIN Routes r ON f.route_id = r.route_id
JOIN Airports a1 ON r.origin_airport_id = a1.airport_id
JOIN Airports a2 ON r.destination_airport_id = a2.airport_id
GROUP BY origin, destination
ORDER BY total_flights DESC;


-- 📍 4. Delay Summary by Reason

SELECT delay_reason, COUNT(*) AS occurrences, AVG(delay_minutes) AS avg_minutes
FROM FlightDelays
GROUP BY delay_reason
ORDER BY occurrences DESC;



-- ⏱ 5. Average Delay Per Flight

SELECT f.flight_id, 
       a1.airport_name AS origin, 
       a2.airport_name AS destination, 
       fd.delay_minutes
FROM Flights f
JOIN Routes r ON f.route_id = r.route_id
JOIN Airports a1 ON r.origin_airport_id = a1.airport_id
JOIN Airports a2 ON r.destination_airport_id = a2.airport_id
LEFT JOIN FlightDelays fd ON f.flight_id = fd.flight_id
WHERE fd.delay_minutes IS NOT NULL;



-- 💸 6. Revenue per Flight

SELECT 
    f.flight_id,
    f.flight_date,
    SUM(b.ticket_price) AS total_revenue
FROM Bookings b
JOIN Flights f ON b.flight_id = f.flight_id
GROUP BY f.flight_id, f.flight_date
ORDER BY total_revenue DESC;



-- 🌐 7. Passenger Nationality Distribution


SELECT nationality, COUNT(*) AS passenger_count
FROM Passengers
GROUP BY nationality
ORDER BY passenger_count DESC;


-- 8. On-time vs Delayed Flights Count

SELECT 
    CASE 
        WHEN fd.delay_minutes IS NULL THEN 'On Time'
        ELSE 'Delayed'
    END AS flight_status,
    COUNT(*) AS flight_count
FROM Flights f
LEFT JOIN FlightDelays fd ON f.flight_id = fd.flight_id
GROUP BY flight_status;






-- 📅 9. Booking Trends by Date


SELECT booking_date, COUNT(*) AS bookings
FROM Bookings
GROUP BY booking_date
ORDER BY booking_date;




-- 🛩10. Aircraft Usage Statistics


SELECT 
    a.aircraft_model, 
    COUNT(f.flight_id) AS total_flights
FROM Flights f
JOIN Aircrafts a ON f.aircraft_id = a.aircraft_id
GROUP BY a.aircraft_model
ORDER BY total_flights DESC;





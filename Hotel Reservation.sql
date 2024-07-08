-- Create the database
CREATE DATABASE hotel_reservations;

-- Use the created database
USE hotel_reservations;

-- Create the reservations table
CREATE TABLE reservations (
    Booking_ID INT PRIMARY KEY,
    no_of_adults INT,
    no_of_children INT,
    no_of_weekend_nights INT,
    no_of_week_nights INT,
    type_of_meal_plan VARCHAR(50),
    room_type_reserved VARCHAR(50),
    lead_time INT,
    arrival_date DATE,
    market_segment_type VARCHAR(50),
    avg_price_per_room DECIMAL(10, 2),
    booking_status VARCHAR(50)
);

-- Insert sample data into the reservations table
INSERT INTO reservations (Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, type_of_meal_plan, room_type_reserved, lead_time, arrival_date, market_segment_type, avg_price_per_room, booking_status)
VALUES
(1, 2, 1, 2, 3, 'Meal Plan 1', 'Room Type A', 14, '2023-06-15', 'Online', 120.00, 'Confirmed'),
(2, 1, 0, 0, 2, 'Meal Plan 2', 'Room Type B', 7, '2023-06-16', 'Corporate', 150.00, 'Cancelled'),
(3, 3, 2, 1, 4, 'Meal Plan 1', 'Room Type A', 30, '2023-07-20', 'Online', 200.00, 'Confirmed'),
(4, 2, 0, 2, 1, 'Meal Plan 3', 'Room Type C', 5, '2023-08-10', 'Travel Agent', 100.00, 'Confirmed'),
(5, 1, 1, 1, 1, 'Meal Plan 1', 'Room Type B', 20, '2023-09-05', 'Online', 180.00, 'Confirmed');

-- Total number of reservations in the dataset
SELECT COUNT(*) AS total_reservations
FROM reservations;

-- Most popular meal plan among guests
SELECT type_of_meal_plan, COUNT(*) AS count
FROM reservations
GROUP BY type_of_meal_plan
ORDER BY count DESC;

-- Average price per room for reservations involving children
SELECT AVG(avg_price_per_room) AS average_price
FROM reservations
WHERE no_of_children > 0;

-- Reservations made for the year 20XX
SELECT COUNT(*) AS reservations_in_year
FROM reservations
WHERE YEAR(arrival_date) = 2023;

-- Most commonly booked room type
SELECT room_type_reserved, COUNT(*) AS count
FROM reservations
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Reservations that fall on a weekend (no_of_weekend_nights > 0)

SELECT COUNT(*) AS weekend_reservations
FROM reservations
WHERE no_of_weekend_nights > 0;


-- Highest and lowest lead time for reservations

SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM reservations;


-- Most common market segment type for reservations

SELECT market_segment_type, COUNT(*) AS count
FROM reservations
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;


-- Reservations with a booking status of "Confirmed"

SELECT COUNT(*) AS confirmed_reservations
FROM reservations
WHERE booking_status = 'Confirmed';


-- Total number of adults and children across all reservations

SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM reservations;


-- Average number of weekend nights for reservations involving children

SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights
FROM reservations
WHERE no_of_children > 0;


-- Reservations made in each month of the year

SELECT MONTH(arrival_date) AS month, COUNT(*) AS reservations_count
FROM reservations
GROUP BY MONTH(arrival_date)
ORDER BY month;


-- Average number of nights (both weekend and weekday) spent by guests for each room type

SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM reservations
GROUP BY room_type_reserved;


-- Most common room type for reservations involving children and the average price for that room type

SELECT room_type_reserved, 
       COUNT(*) AS count, 
       AVG(avg_price_per_room) AS avg_price
FROM reservations
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;


-- Market segment type that generates the highest average price per room

SELECT market_segment_type, 
       AVG(avg_price_per_room) AS avg_price
FROM reservations
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;











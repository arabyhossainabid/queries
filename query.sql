-- QUERY 1
SELECT
    Bookings.booking_id,
    Users.name AS customer_name,
    Vehicles.name AS vehicle_name,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.status
FROM
    Bookings
    JOIN Users ON Bookings.user_id = Users.user_id
    JOIN Vehicles ON Bookings.vehicle_id = Vehicles.vehicle_id;

-- QUERY 2:
SELECT *
FROM Vehicles
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Bookings
        WHERE
            Bookings.vehicle_id = Vehicles.vehicle_id
    );

-- QUERY 3
SELECT *
FROM Vehicles
WHERE
    availability_status = 'available'
    AND type = 'car';

-- QUERY 4
SELECT
    Vehicles.name AS vehicle_name,
    COUNT(Bookings.booking_id) AS total_bookings
FROM Bookings
    JOIN Vehicles ON Bookings.vehicle_id = Vehicles.vehicle_id
GROUP BY
    Vehicles.vehicle_id,
    Vehicles.name
HAVING
    COUNT(Bookings.booking_id) > 2;
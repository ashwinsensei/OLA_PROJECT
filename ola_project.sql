select * from ride_bookings;

--1.Retrieve all Successful Bookings
create view Successful_bookings as 
select * from ride_bookings
where booking_status = 'Successful';

--Final
select * from Successful_bookings;



--2.Find the average ride distance for each vehicle type
create view avg_ride_dist as 
select vehicle_type , avg(ride_distance_km)  from ride_bookings
group by vehicle_type;

--Final 
select * from  avg_ride_dist ;

--3. Get the total number of cancelled rides by customers
Create view ride_cancel_by_customer as
select count(*) from ride_bookings
where booking_status = 'Cancelled by Driver';

--Final
select * from ride_cancel_by_customer;

--4.List the top 5 customers who booked the highest number of rides:
create view top5_customer as 
select customer_id, count(booking_id) as total_rides
from ride_bookings
group by customer_id
order by total_rides desc limit 5;

--Final
select * from top5_customer ;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view ride_cancel_driverissues as 
select count(driver_cancellation_reason) from ride_bookings
where driver_cancellation_reason = 'Personal & Car related issues';

--Final
select * from ride_cancel_driverissues;

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_primesedan_rating as
select max(driver_rating) as max_rating,
min(driver_rating) as min_rating from ride_bookings
where vehicle_type = 'Prime Sedan';

--Final
select * from max_min_driver_primesedan_rating ;

--7.Find the average customer rating per vehicle type:
create view avg_customer_rating as 
select vehicle_type,avg(customer_rating) from ride_bookings 
group by vehicle_type;

--Final
select * from avg_customer_rating;

--8.Find the expensive booking value for each vehicle type
create view expensive_booking as 
select vehicle_type, max(booking_value_inr) from ride_bookings
group by vehicle_type;

--Final 
select * from expensive_booking;

--9.Calculate the total booking value of rides completed successfully:
create view totalbooking_of_successfulride as
select sum(booking_value_inr) from ride_bookings 
where booking_status = 'Successful';

--Final
select * from totalbooking_of_successfulride;

--10.List all incomplete rides along with the reason:
create view  incomplete_ride_reason as 
select booking_id, incomplete_ride_reason from ride_bookings
where incomplete_ride = 'true';

--Final 
select * from incomplete_ride_reason ;
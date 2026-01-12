# OLA_PROJECT
In this Project I used SQL, Excel and PowerBI skills on OLA dataset to find the important insights and created dashboard to track and analyse OLA Customer and Driver Data .
Excel –  In Excel we first loaded 1,00,000 rows of data and perfrom basic data cleaning steps which include removing duplicates and other data transformation steps necessary for SQL Part. 

SQL Queries- In this we created a database and then created a table in which I imported the Excel CSV File of OLA Dataset .
Below I have Find Necessary insights using SQL Query . 
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

Power BI
Segregation of the views: 
1. Overall - Ride Volume Over Time - Booking Status Breakdown
 2. Vehicle Type - Top 5 Vehicle Types by Ride Distance
 3. Revenue - Revenue by Payment Method - Top 5 Customers by Total Booking Value - Ride Distance Distribution Per Day 
4. Cancellation - Cancelled Rides Reasons (Customer) - cancelled Rides Reasons(Drivers) 
5. Ratings - Driver Ratings - Customer Ratings
Answers: 1. Ride Volume Over Time: A time-series chart showing the number of rides per day/week. 
2. Booking Status Breakdown: A pie or doughnut chart displaying the proportion of different booking statuses (success, cancelled by the customer, cancelled by the driver, etc.).
 3. Top 5 Vehicle Types by Ride Distance: A bar chart ranking vehicle types based on the total distance covered.
 4. Average Customer Ratings by Vehicle Type: A column chart showing the average customer ratings for different vehicle types. 
5. cancelled Rides Reasons: A bar chart that highlights the common reasons for ride cancellations by customers and drivers. 
6. Revenue by Payment Method: A stacked bar chart displaying total revenue based on payment methods (Cash, UPI, Credit Card, etc.).
 7. Top 5 Customers by Total Booking Value: A leaderboard visual listing customers who have spent the most on bookings.
 8. Ride Distance Distribution Per Day: A histogram or scatter plot showing the distribution of ride distances for different Dates.
 9. Driver Rating Distribution: A box plot visualizing the spread of driver ratings for different vehicle types. 
10. Customer vs. Driver Ratings: A scatter plot comparing customer and driver ratings for each completed ride, analyzing correlations.

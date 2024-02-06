# Q1) How many female passengers traveled a minimum distance of 600KMs ?
select count(*) as no_pass from passenger where gender = 'F' and distance >=600 ;


# Q2) Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select * from passenger where distance > 500 and bus_type = 'sleeper';

# Q3) Select passenger names whose names start with the character 'S'.
select * from passenger where passenger_name like 'S%';

# Q4) Calculate the price charged for each passenger, displaying the Passengername, BoardingCity, DestinationCity, Bustype, and Price in the output.

select P.Passenger_name, P.Boarding_city, P.Destination_city, P.Bus_type, Pr.Price
From Passenger P
join Price Pr on P.Bus_type = Pr.Bus_type and P.Distance = Pr.Distance;

# select distinct(passenger_id),passenger_name,boarding_city,destination_city,price,bus_type from passenger left join price on passenger.distance = price.distance


#Q5) What are the passengername(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?

SELECT passenger.passenger_name,price.price from passenger,price where passenger.distance > 1000 and passenger.bus_type = 'Sitting';

# Q6) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji ?  

select * from passenger where passenger_name = 'Pallavi';
#select top(1)* from passenger;
#select top(1)* from price;
#select bus_type,distance,price from price GROUP by bus_type,distance,price
select bus_type,price from price where distance = (select distance from passenger where passenger_name = 'Pallavi');

# Q7) Alter the column category with the value "Non-AC" where the Bus_Type is sleeper. 

select * from passenger;
update passenger set category = 'NON-AC' where bus_type = 'Sleeper';

# Q8) Delete an entry from the table where the passenger name is Piyush and commit this change in the database.

delete from passenger where passenger_name = 'Piyush';
commit;

# Q9) Truncate the table passenger and comment on the number of rows in the table.

truncate table passenger;
select * from passenger; #zero rows in the table except the column name

# Q10) Delete the table passenger from the database.

drop table passenger;

# PROJECT-1st
 my Project: Travel Friend app

Overview : An Online delivery app
          It allows users to register their cars anytime they move from one city to another, so that other users can share the ride with them.
The application has 3 main users: the customer, the driver and the manager. They must all be able to perform the following tasks for the app to function properly.

As a customer, I must be able to do the following:
- Choose the city
- Choose the type of car
- Choose the driver
- Display driver information (name, mobile number, arrival time, price...)

As an application manager, I should be able to do the following:
- Add a new driver
-Determine the price so that it is not less than a certain price
- View total earnings
- Number of drivers in cities

As a driver I should be able to:
- Accept delivery request
-Delivery refused
-View customer information (name, mobile number…)


Usage :
user:

##To use this application , create a new user using the protocol user
##Create an enum TypeCity String
case riyadh
case hail
case jeddah
case dammam
case abha
--
##Create an enum ErrorOrder
##case orderSameCity

--
##Create a struct Customer to User
- method requestDriver(fromCity:TypeCity,toCity:TypeCity) throws -> String

- method requestDriver2(fromCity:TypeCity,toCity:TypeCity) throws -> String

- method requestDriver3(fromCity:TypeCity,toCity:TypeCity) throws -> String

## Create a struct Driver to User
- method driveCustomer(customer : Customer, payment: Int)

- method driveCustomer2(driverTow: Driver ,customer2:Customer)

- method driveCustomer3(driver : Driver ,customer3:Customer)
- using do, catch call the method driveCustomer
 If an error, print("Sorry Your order is wrong you order the same city”)

- call driver.driveCustomer
## create a class manager to User
- use initi for the class

## create extension  to Manager
-  using do, catch call the method ourDriver


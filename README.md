# MY-FIRST-PROJECT

## My Project :  An Home Services App :

#### Overview :   An online app that provide home services to customers. This online app has 2 main users. The customer and the manager of the app . Each one of them should be able to do the following tasks for the app to function properly .

#### As a customer I should be able to do the following :
- Browse  services . 
- View the service info (summary, Service type, price, info of worker , time to come.)
- View the worker inf (name, age, nationality, request times.
- Get a discount.
- choose  payment method. 

#### As a manager of the home services app, I should be able to do the following :
- Add new services to the app.
- Remove services from the app.
- View the services profit .  
- View the most requested service on the app. 



#### Usage :

#Create protocol User  . It has the following properties and methods :
.name : String
.phoneNumber : Int
.email : String
.age : Int
.address : String
.houseType :TypeOfHouse 
.doDiscount ()
.ShowServices()

#Create a class Manager that conforms to protocol User
.Conform to the protocol User properties and methods
.Use an init for the class

#Create an enum ChooseTheService: String
. case houseCleaning = "House Cleaning"
. case babyCareOrElderly = "BabyCare Or Elderly"
. case deepCleaning = "Deep Cleaning"
. case none = "None"

#Create an enum TimeToComeHome
. case evening
. case moring

#Create an enum TypeOfHouse
. case villa
. case flat
. case groundFloor
    
#Create a struct Customer that conforms to protocol User
.Conform to the protocol User properties and methods
.method ShowServices() print selected Service of type ChooseTheService
.static method printCustomerInfo()
#Create a struct Service 
.type : ChooseTheService
.price : Int
.worker : worker
.TimeToComeHome : TimeToComeHome
. printDesService() that retern 
        "The Service Is :<type>,`The price of service Is : <price>,` <worker.description>,`Time to come home is in the <TimeToComeHome>.`"
        
#Create a struct Worker
.name : String
.age   : Int
.nationality : String
.NumberOfrequestTimes : Int
. add property services : array of Services returns it as output
. computed property description : String {
        return "The Name of worker is : <name> , age : <age> , Nationality :<nationality> , Number Of request Times :<NumberOfrequestTimes>."
    }
#Create an enum nonDiscountError
.case nonDiscount

#Create an extension to class Manager
.doDiscount(price : Int)
.func ddoDiscount(price : Int) accepts a discount of price 500 or more . Using a guard , throw an error of type nonDiscountError.nonDiscount if the price is less than 500 .
If No errors thrown , the method doDiscount(price : Int) prints "There Is Discount."

#Create a Manager user .

using do, catch . Call the the method doDiscount(price : Int). If an error, print "There Is No Discount"
#Create an enum paymentMethod
    case cash
    case creditCards
    case appplePay
    case cancelled

#Create a Dictionarie & Closure
.View the services profit .  


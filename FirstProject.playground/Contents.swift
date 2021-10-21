import UIKit

// protocol of User..............
protocol User {

    var name : String {get}
    var phoneNumber : Int {get}
    var email : String {get}
    var age : Int {get}
    var address : String {get}
    var houseType :TypeOfHouse {get}
    func doDiscount ()
    static func ShowServices(selectedService: ChooseTheService)
    
}

// class of manager..............
class Manager : User{
    var name : String
    var phoneNumber : Int
    var email : String
    var age : Int
    var address : String
    var houseType: TypeOfHouse

init(name : String , phoneNumber : Int , email : String , age : Int ,
     address : String , houseType : TypeOfHouse){
    self.name = name
    self.phoneNumber = phoneNumber
    self.email = email
    self.age = age
    self.address = address
    self.houseType = houseType
    
}
   
    
    static func ShowServices(selectedService: ChooseTheService){}
    func doDiscount (){}
    
    
}
// enum for types of Services.........
enum ChooseTheService: String {
    case houseCleaning = "House Cleaning"
    case babyCareOrElderly = "BabyCare Or Elderly"
    case deepCleaning = "Deep Cleaning"
    case none = "None"
}
// enum for types time to come home(worker)....
enum TimeToComeHome {
    case evening
    case moring
    
}
// enum for types of house....
enum TypeOfHouse: String {
    case villa = "Villa"
    case flat = "Flat"
    case groundFloor = "Ground Floor"
    
}
// struct of Customer.......
struct Customer : User {
    var name: String
    var phoneNumber: Int
    var email: String
    var age: Int
    var address: String
    var houseType: TypeOfHouse
    var services : [Service]
    func doDiscount (){}
    static func ShowServices(selectedService: ChooseTheService) {
        
        print("service selected: \(selectedService.rawValue)")
        print()
        
    }
    static func printCustomerInfo(customer: Customer) {
        print("This is the info of customer: name: \(customer.name),age: \(customer.age),phone number:\(customer.phoneNumber),email:\(customer.email),address:\(customer.address),house type: \(customer.houseType.rawValue), and the service selected is:")
        for service in customer.services {
            print("\(service.type.rawValue),the price of service Is: \(service.price),the worker of service:\(service.worker.name), age : \(service.worker.age),nationality: \(service.worker.nationality),number of request times:\(service.worker.NumberOfrequestTimes),Time to come home is in the \(service.TimeToComeHome)")
        }
        
    }
    

    }

// struct of  Services.............
struct Service {
  var type : ChooseTheService
  var price : Int
  var worker : worker
  var TimeToComeHome : TimeToComeHome
        
    func printDesService() {
        print("The Service Is :\(type),`The price of service Is : \(price),` \(worker.description),`Time to come home is in the \(TimeToComeHome).`")
    }
}
// struct of worker...............
struct worker {
  var name : String
  var age   : Int
  var nationality : String
  var NumberOfrequestTimes : Int
  var description : String {
        return "The Name of worker is : \(name) , age : \(age) , Nationality :\(nationality) , Number Of request Times :\(NumberOfrequestTimes)."
    }
    
    
}
// enum for error to checking is there discount..........
enum nonDiscountError : Error{
   case nonDiscount
}
// extension of class Manager......
extension Manager{
    func doDiscount(price : Int)throws -> String{
        guard price > 500 else { throw nonDiscountError.nonDiscount}
        return ("There Is Discount")
    }
    
}

// enum of types of payment method........
enum paymentMethod{
    case cash
    case creditCards
    case appplePay
    case cancelled
}


//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

//name of project.......
let myProject = "Home Services"
print("welcome to \(myProject) App Explore our tailor-made Home Services that were designed to make your life easier.")

print()

print("Our customer support team is available from 8 am till 8 pm")

func ServicesApp<T,U>(_ phone: T, _ Email: U) -> (T, U) {
    return (phone, Email)
}
let nn = ServicesApp(920000000, "support@gmail.com")
print("\(nn)")


print()
// set of services.......
var homeservices : Set<String> = ["House Cleaning", "BabyCare or Elderly", "Deep Cleaning"]
print("Please choose service :\n")
for homeservice0 in homeservices {
    print(homeservice0)
}
// Manager can insert or remove services
homeservices.insert("nwe service")
homeservices.remove("service")


print()
//workers..........
print("The workers is :\n")
let workerDescription1 = worker(name: "Sara", age: 28, nationality: "Indian", NumberOfrequestTimes: 7)
print(workerDescription1.description)
let workerDescription2 = worker(name: "sma", age: 25, nationality: "Indonesian", NumberOfrequestTimes: 11)
print(workerDescription2.description)
let workerDescription3 = worker(name: "sam", age: 33, nationality: "Kenya", NumberOfrequestTimes: 15)
print(workerDescription3.description)

print()
//Services...........
let service_1 = Service(type:.babyCareOrElderly, price: 1000, worker:workerDescription1, TimeToComeHome: .moring)
Customer.ShowServices(selectedService: ChooseTheService.babyCareOrElderly)
service_1.printDesService()
print()
let service_2 = Service(type:.houseCleaning, price: 500, worker: workerDescription2,  TimeToComeHome: .moring)
Customer.ShowServices(selectedService: ChooseTheService.houseCleaning)
service_2.printDesService()
print()
let service_3 = Service(type: .deepCleaning, price: 300, worker: workerDescription3, TimeToComeHome: .evening)
Customer.ShowServices(selectedService: .deepCleaning)
service_3.printDesService()
print()

//Customers........
print("The Customers is :\n ")
let customer1 = Customer(name: "saad", phoneNumber: 0566666666, email: "saad@gmail.com", age: 30, address: "sadyan", houseType: .flat, services: [service_2])
Customer.printCustomerInfo(customer: customer1)


let customer2 = Customer(name: "sami", phoneNumber: 0577777777, email: "sami@gmail.com", age: 27, address: "Ajja", houseType:.villa, services:[service_3])

let customer3 = Customer(name: "Asma", phoneNumber: 0588888888, email: "asma@gmail.com", age: 25, address: "Alnaqra", houseType:.groundFloor, services:[service_3])

let customer4 = Customer(name: "Afaf", phoneNumber: 0522222222, email: "afaf@gmail.com", age: 33, address: "Ajja", houseType:.villa, services:[service_1])

print()
//check if there discount or not.......
print("Check if there is a discount or not \n")
do{
    let user = Manager(name: "Ahmed", phoneNumber: 050000000000, email: "ahmed55@gmail.com", age: 27, address: "Alnaqrah", houseType:.groundFloor)
    let user1 = try user.doDiscount(price : 600)
    print(user1)
}
    
    catch nonDiscountError.nonDiscount{
    print("There Is No Discount")
}
print()
//payment method.........
print("Please choose the payment method that suits you:")
let payment_0 = paymentMethod.cash
switch payment_0 {
case .cash:
    print("cash")
case .creditCards:
    print("credit cards")
case .appplePay:
    print("appple pay")
case .cancelled:
    print("cancelled")
}

print()
//The total of profit in one year(Dictionaries & Closure)
print("The total of profit in one year :\n")
var totalprofit = ["House Cleaning": 30000 , "Baby care or elderly" : 20000 , "Deep cleaning" : 15000]

let sortedtotalprofit = totalprofit.sorted { i, j in
    return i.value > j.value
 }
for sortedtotalprofit in sortedtotalprofit {
    print(sortedtotalprofit.key,sortedtotalprofit.value)
}

print()

print("The most requested service is :\n")
let mostRequested = totalprofit.max{i , j in i.value < j.value}
print(mostRequested!)

print()



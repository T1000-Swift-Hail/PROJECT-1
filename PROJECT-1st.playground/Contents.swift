import UIKit


print("Welcome to the Travel Friend ")
print("Travel Friend is in the follwoing areas : Riyadh , Hail , Jeddah , Dammam , Abha ")
protocol User {
    var name: String{get}
    var email: String{get}
    var mobailNumber: Int{get}
    var address: String {get}
    var price: Int {get}
    var timeToGo: String{get}
    }

enum PaymentError: Error {
   case paymentLow
}

//Optional
var userNameUser : String?
print(userNameUser ?? "")
userNameUser = "ahmed"
if let userNameUser = userNameUser {
    print("The New User is : ")
    print(userNameUser)
}

enum TypeCity: String {
case riyadh = "Riyadh"
case hail = "Hail"
case jeddah = "Jeddah"
case dammam = "Dammam"
case abha = "Abha"
}

enum ErrorOrder : Error {
    
    case orderSameCity
    
}
struct Customer: User {
    var name: String
    var email: String
    var mobailNumber: Int
    var address: String
    var price: Int
    var timeToGo: String


    func requestDriver(fromCity:TypeCity,toCity:TypeCity) throws -> String {
    print("\(name) is requesting a driver from \(fromCity) to \(toCity)")
    if fromCity.rawValue == toCity.rawValue {
    throw ErrorOrder.orderSameCity
    } else {
    return "Order now please wait for Driver we will Ask to delevry from \(fromCity.rawValue) to \(toCity.rawValue)"
}
}
    /*
    func requestDriver2(fromCity:TypeCity,toCity:TypeCity) throws -> String {
    print("\n\(customer.name) is requesting a driver from \(fromCity) to \(toCity)")
    if fromCity.rawValue == toCity.rawValue {
    throw ErrorOrder.orderSameCity
    } else {
    return "Order now please wait for Driver we will Ask to delevry from \(fromCity.rawValue) to \(toCity.rawValue)"
}
}
    
    func requestDriver3(fromCity:TypeCity,toCity:TypeCity) throws -> String {
    print("\n\(customer.name) is requesting a driver from \(fromCity) to \(toCity)")
    if fromCity.rawValue == toCity.rawValue {
    throw ErrorOrder.orderSameCity
    } else {
    return "Order now please wait for Driver we will Ask to delevry from \(fromCity.rawValue) to \(toCity.rawValue)"
    }
}*/
}
 



// SET
var typeOfCarsInHail : Set = ["Jeep" ,"HONDA" ,"TOYOTA" ]
print("\ntypes of cars in a Travel Friend in city Hail :")
for car in typeOfCarsInHail {
    print(car)
}
var typeOfCarsInRiyadh : Set = ["HAVAL" ,"DODGE" ,"GMC" ]
print("\ntypes of cars in a Travel Friend in city Riyadh :")
for car in typeOfCarsInRiyadh {
    print(car)
}


struct Driver: User {
    var name: String
    var email: String
    var address: String
    var mobailNumber: Int
    var price: Int
    var timeToGo: String
    var describePerson:String{
        return "Driver name is: \(name)email : \(email)mobailNumber: \(mobailNumber)address: \(address)price is: \(price)timeToGo is: \(timeToGo) "
        
    }
    
    func driveCustomer(customer : Customer, payment: Int) {
    print ("\(customer.name)  ride with the driver \(driver.name) and pays an amount to \(driver.name) : \(payment)")
    }
    
  
    

}

let driver = Driver(name: "khled", email: "ff@gmail.com", address: "hail", mobailNumber: 05555, price: 300, timeToGo: "7pm")
let customer = Customer(name: "ahmed", email: "gg@gmail.com", mobailNumber: 09999, address: "riyadh", price: 800, timeToGo: "6am")

let driverTow = Driver (name: "abdalaziz", email: "ww@gmail.com", address: "jeddah", mobailNumber: 04555, price: 400, timeToGo: "3pm")

let driverThree = Driver (name: "abduallh", email: "gg@gmail.com", address: "dammam", mobailNumber: 08888, price: 800, timeToGo: "6am")

let customerTow = Customer (name: "sami", email: "dd@gmail.com", mobailNumber: 0222, address: "abha", price: 800, timeToGo: "5am")

let customerThree = Customer (name: "saad", email: "yy@gmail.com", mobailNumber: 0555, address: "riyadh", price: 300, timeToGo: "6am")



do {
let result = try customer.requestDriver(fromCity: .riyadh, toCity: .hail)
    
    print(result)
    
} catch ErrorOrder.orderSameCity {
    
print("Sorry Your order is wrong you order the same city")
}







do {
    let result = try customerTow.requestDriver(fromCity: .abha, toCity: .riyadh)
    
    print(result)
    
} catch ErrorOrder.orderSameCity {
    
print("Sorry Your order is wrong you order the same city")}








driver.driveCustomer(customer: customer, payment: 400)

driverTow.driveCustomer(customer: customerTow, payment: 100)

driverThree.driveCustomer(customer: customerThree, payment: 240)






//Classes with an initializer
class Manager  : User{
    var name: String = ""
    var email: String = ""
    var mobailNumber: Int = 0
    var address: String = ""
    var price:Int = 0
    var timeToGo:String = ""

init(name:String, email: String,
     mobailNumber:Int, address:String, price:Int, timeToGo:String) {
    self.name = name
    self.email = email
    self.mobailNumber = mobailNumber
    self.address = address
    self.price = price
    self.timeToGo = timeToGo
}
}

//extension and return, error
extension Manager{
  func ourDriver (payment : Int) throws -> String  {
      guard payment >= 300 else{throw
          PaymentError.paymentLow}
      return "\n Manager \(name) accepted the payment. The Payment is Done"
  }
  }

do{
    let waleed = Manager(name: "ahmed", email: "aa@gmail.com", mobailNumber: 99999, address: "Riyadh", price: 500, timeToGo: "1pm")
    let result = try waleed.ourDriver(payment:350)
    print(result)
} catch PaymentError.paymentLow {
    print("\nThe Payment is low")
}


//closure and the Array

print("\nSales for five months Amounts from biggest to lowest")
let numbers = ["12000 SR", "10000 SR", "25000 SR", "15000 SR", "19000 SR"]
let sortedNumbers = numbers.sorted(by: {(i:String, j:String) -> Bool in
   return i > j
})

for numbers in sortedNumbers {
    print(numbers)
}


//DICT
print("\nThe number of drivers in the cities :")

let  numberOfDrivers = ["riyadh":90, "Hail":44, "Jeddah":70, "Dammam":66, "Abha":50]
let number = numberOfDrivers.max {a,b
in a.value < b.value}
for number in numberOfDrivers {
    print("drivers in \(number.key): \(number.value) ")
}







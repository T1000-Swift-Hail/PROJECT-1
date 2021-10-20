import UIKit

enum PaymentError : Error {
    case PaymentLow
}

// this is protocol for user...
protocol User {
    var name: String {get}
    var phonenumber :String { get  }
    var email : String{get}
    var password : Int {get}
    func buy (payment: Int, realEstate : RealState)
}
// this is struct
struct Salesman {
    var name: String
    var phonenumber :String
    var email : String
    var password : Int
    var offers : String
}
//this is extensions
extension Salesman {
    func sell (Selling : Int) throws -> String{
        guard Selling >= 100000 else { throw PaymentError.PaymentLow}
        return("The sale is Done")}
}
//this is struct
struct Address  {
    var number :Int
    var street : String
    var description :String {"\(number) ,\(street)"}
    
}
//this is struct
struct RealState : Equatable {
    var name : String
    var location : String
    var price : Int
    
    //computed property
    var description : String {
        return "real estate is \(name), located in \(location). You can buy for \(price) USD"
    }
}
// this is class with initalizer
class Buyer : User {
    
    var name: String
    var phonenumber :String
    var email : String
    var password : Int
    var address : Address
    
    init (name: String ,phonenumber: String , email: String,  password: Int, address : Address) {
        self.name = name
        self.phonenumber = phonenumber
        self.email = email
        self.password = password
        self.address = address
    }
    //funcation return output
    func buy( payment : Int, realEstate : RealState) {
        print("\(name) is buying a house \(realEstate.name) for \(payment) in \(realEstate.location) ")
    }
    
    struct offerstypes {
        var   offers = ["lands", "Apartments" ,"office" ,"villa"]
        
    }
    // Generic
    func getBayernumber<T,U>(name :T, phonenumber : U) ->(T,U){
        return (name,phonenumber)
    }
}


// ***************************************************



print("Real estate app")
print("WE SELL REAL ESTATE")

//dictionaries & arrays
var expensiveDuplex = ["Duplex1":1099 ,"Duplex2" :9888 ,"Duplex3": 4488 ,"Duplex4" :1233]
var expensiveDuplexValues: Array<Int> = []

for value in expensiveDuplex {
    expensiveDuplexValues.append(value.value)
}

let miximDuplexValues = expensiveDuplexValues.max { $0 < $1 }
print("The most expensive douplex is:\(miximDuplexValues ?? 0)")

//Error Handling
var Abdallah = Salesman(name: "Abdallah", phonenumber: "051221177", email: "abdallah.1@gmail.com", password: 578888,  offers: "office ")
do {
    let result = try Abdallah.sell(Selling:2000)
    print(result)
}
catch PaymentError.PaymentLow {
    print ("The sell is low")
}


var house = RealState(name: "house", location: "Hail", price: 455)
var villa = RealState(name: "villa", location: "Rayidh", price: 650)
var farm = RealState(name: "farm", location: "Jeddah", price: 500)
var land = RealState(name: "land", location: "Makkah", price: 350)
var apartments = RealState(name: "Apartments", location: "Abha", price: 200)
print("Information requested for : ")
print(land.description)
print(farm.description)
print(villa.description)
print(apartments.description)
print(house.description)

//clsures

var ourRealStateList = [house, villa, farm, land ,apartments]

var sortedOurRealStateList = ourRealStateList.sorted(by: { c1, c2 in
    return c1.price > c2.price
    
})

print("Our list of sorted houses from high to low :")
for house in sortedOurRealStateList {
    print(house.name)
    
}

//print(bayernumber.name)
//bayernumber.bay()

var buyer1 = Buyer(name: "ahmed", phonenumber: "053382736", email: "ahmad.2@gmail.com", password: 787, address: Address(number: 3454, street: "3rd street"))
var buyer2 = Buyer (name: "mohammed", phonenumber: "054435768", email: "mohammed.9@gmail.com", password: 345, address: Address(number: 233, street: "2rd street"))
var buyer3 = Buyer(name: "saud", phonenumber: "0566789977", email: "saud.1@gmail.com", password: 78489, address: Address(number: 5678, street: "3rd street"))

var buyer4 = Buyer(name: "salim", phonenumber: "0562358737", email: "salim.1@gmail.com", password: 734529, address: Address(number: 3478, street: "3rd street"))

var buyer5 = Buyer(name: "sultan", phonenumber: "058293737", email: "sultan.1@gmail.com", password: 723429, address: Address(number: 3098, street: "2rd street"))




buyer1.buy(payment: 70000, realEstate: farm)
buyer2.buy(payment: 20000, realEstate: apartments)
buyer3.buy(payment: 65000, realEstate: house)
buyer4.buy(payment: 55000, realEstate: land)
buyer5.buy(payment: 95000, realEstate: villa)


var ourCustomers = [buyer1, buyer2, buyer3,buyer4,buyer5]

print("list of customers :")
for customer in ourCustomers {
    print(customer.name)
}




print("Seller's name and phone number :")
let buyer = Buyer(name: "Ali", phonenumber: "55678756444", email: "ali.11@gmail.com", password: 59549, address: .init(number: 594, street: "2street"))
let numberbayer = buyer.getBayernumber(name: "saud" , phonenumber:0566789977)
print(numberbayer)


//optional
var profit : Int?
print (profit ?? "default value")
if profit == nil {
    print ("profit required")
}
else {
    print("call")
}
profit = 259999
print(profit!)

//Set
var villa1 : Set<String> = ["kitchen", "master room" ,"bathroom"]
var villa2  : Set<String> = ["kitchen", "bathroom", "master room", "living room","garden"]

var vil = villa2.union(villa1)
print ("all villa" )
for x in vil {
    
    print (x)
}

var vil1 = villa2.intersection(villa1)
print ("villa1 and villa2 :")
for y in vil1 {
    print(y)
}
var vil2 = villa2.subtracting(villa1)
print ("villa1 did not : ")
for z in vil2 {
    print(z)
}


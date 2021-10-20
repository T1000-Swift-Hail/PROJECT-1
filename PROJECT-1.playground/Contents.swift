import UIKit
import Darwin

let PROJECT_NAME = "Health Club"
let desc = "The health club is available most of the services"

print("welcome to our \(PROJECT_NAME). You will have a great time")
print(desc)

protocol person {
    var name : String {get}
    var age : Int {get}

}
enum ErrorPayment:Error {
    case paymentLow
}

struct Service {
    var name : String
    var description : String
    var price : Int
}
// class information for customer .
class customer: person, Hashable{

    
    var name: String
    var age: Int
    let services : [Service]
    
    var description : String {
        return " the customer name is \(name) and age is \(age)"
    }
    
    init (name : String, age : Int, service:[Service]){
        self.name = name
        self.age = age
        self.services = service
    }
// customers trainong with the golden car .
    func buyPackage(payment : Int) throws -> String {
        print("\(name) paid \(payment)")
        if (payment>500)  {
            print("Your card is gold , you can train . This number is \(payment)")
        } else if (payment < 500) {
            print("This payment is low you cannot train. Buy the Gold ,The number is \(payment)")
            throw ErrorPayment.paymentLow
        }else {
        }
        return ""
    }
    
    func train(){
        print("\(name) is training ...")
    }
    
    func printServices() {
       
       for service in services {
           print("The chosen service by \(name) is:\(service.name),\(service.price),\(service.description)")
       }
   }
    
    static func == (lhs: customer, rhs: customer) -> Bool {
        return lhs.name == rhs.name
    }
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
// There are five services .
var training = Service(name: "training", description: "muscle strengthening", price: 140)
var boxing = Service(name:"boxing",description: "increase muscle mass",price: 150)
var swimming = Service(name: "swimming",description:"physical activity",price:130)
var yaki = Service(name:"yaki",description: "relaxation",price: 120)
var zumba = Service(name:"zumba",description: "fitness",price: 140)

var ourServices = [training, boxing,swimming,yaki,zumba]
print("\n our services are :")
for service in ourServices {
    print("service is : \(service.name) for price \(service.price)")
}


//
// customers can use more than one service all categories .
var customer1 = customer(name: "mona", age: 20, service:[boxing,training])
customer1.printServices()
try? customer1.buyPackage(payment: 700)
customer1.train()
var customer2 = customer(name: "mohamed",age: 25, service: [boxing])
try? customer2.buyPackage(payment: 300)
customer2.train()
var customer3 = customer(name:"hana", age: 22, service: [yaki])
customer3.printServices()
try? customer3.buyPackage(payment: 600)
var customer4 = customer(name:"sara",age: 30, service:[yaki,boxing])
customer4.printServices()
try? customer4.buyPackage(payment: 800)
var customer5 = customer(name:"abdullah",age:27,service:[swimming,yaki])
customer5.printServices()
try? customer5.buyPackage(payment: 900)
var customer6 = customer(name:"hanadi",age:33,service:[zumba,boxing])
customer6.printServices()
try? customer6.buyPackage(payment: 500)



 /*
    struct customer : person{
        var eamil : String
        var mobial : Int
        var accesscode :Int
    }
*/
    
var customers=[ customer1,customer2,customer3,customer4,customer5,customer6]
print("Our customers are :")
for customer in customers {
    print(customer.description)

}

print("Our customers who did Boxing:")
var customersServiceBoxing : Set = [customer1,customer2,customer4,customer6]
for customer in customersServiceBoxing {
    print(customer.name)
}	




//Service.printServices(services: [training,boxing,swimming])






            
    
    
    
    
    
    
    



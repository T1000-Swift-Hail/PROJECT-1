import UIKit
import Darwin


// I use Error Handling to avoid recoverable Error.

enum AgeError : Error {
    case AgeYoung }

enum QuantityError : Error {
    case QuantityLow
    
}
enum EmailError : Error {
    case EmailNotReal
    
}

enum PassWordError : Error {
    case PassWordNotCorrect
    
}

enum NameError : Error {
    case NameIsShort
    case NameIsLong
    
}
// Now I use Plastic as a protocol to help me in Create values.
protocol Plastic {
    var ProductName: String { get }
    var ProductHeight: Int { get }
    var ProductWidth: Int { get }
    var ProductColor: String { get }
    var ProductQuantity: Int { get }
    var Productprice: Int { get }
}

struct Store {
    
    func welcomeToStore() {
        // this is a Welcome Sentences
        print("Welcome to my plastic Store! 😊")
        print("  ")
 }
 
    
    // Here I write some Using tips by Using function.
    func UsingTips ( ) {
        print("Here some Tips for Using plastic :")
        print("1.Avoid single use plastics.")
        print("2.Recognize microplastics in disguise.")
        print("3.Carry a reusable water bottle.")
        print("4.remember to Recycle it.")
        print("  ")
        
    }
    }

// a class here for help me in Describe my Products.
class Product : Plastic {
    var ProductName: String
    var ProductHeight: Int
    var ProductWidth: Int
    var ProductColor: String
    var ProductQuantity: Int
    var Productprice: Int
    
    
    // Now I Use initializer with self to make the code simple.
    init (n:String, h:Int ,w:Int , c:String ,  q:Int , p:Int ) {
        self.ProductName = n
        self.ProductHeight = h
        self.ProductWidth = w
        self.ProductColor = c
        self.ProductQuantity = q
        self.Productprice = p
    }
    
}
struct Customer {
    var CustomerName : String
    var CustomerAge : Int
    var CustomerEmail : String
    var CustomerPassWord : Int?
    var CustomerPhone : Int
    
    func buyProduct(products : [Product]) {
        print("\(CustomerName) has bought:")
        for product in products {
            print(product.ProductName)
        }
        print("Thanks for baying from our store ❤️")
        
    }
    
    func login(password : Int){
        print("\(CustomerName) has logged in with password \(password) ..")
    }
    
    static func getNameOfCustomer(customer: Customer) {
        print("This is customer name:\(customer.CustomerName)")
    }
    
    
}
// extension for fix things.
extension Product {
    
    func Description(Quantity:Int) throws {
        
        guard Quantity < 100 else { throw QuantityError.QuantityLow }
        print("it is low")
        
    }
}
// Name rules
extension Customer {
    
    func User(Name:String) throws -> String {
        if ( Name.count < 4 ) {
            throw NameError.NameIsShort
            
        } else if Name.count > 10  {
            throw NameError.NameIsLong
            
        }
        
        // this Result will show it to the Customer if they write a correct Name.
        return "Your User is confirmed"
    }
}

// Here I called the function to see the Tips.
let store = Store()
store.welcomeToStore()
store.UsingTips()

// My Plastic materials Types
print("In my store I use the safest plastic Types :")
var PlasticType : Set<String> = ["PETE","HDPE","V","LDPE","PP"]
PlasticType.remove("V") // I remove Toxic materials
PlasticType.insert("PS") // I insert another material less toxic than V Type .

// I Count the materials by use loops
for PlasticType in (PlasticType) {
    print("\(PlasticType) Type.")
}
print("  ")
 
// do and catch to tell the customer that is Error.
do {
    let result = try customer1.User(Name: "jojo")
    print(result)
    print("  ")
    
} catch NameError.NameIsShort { print("Your Name is too short try to insert more Letters ") }
catch NameError.NameIsLong { print("Your Name is too long try to put less Letters") }



//My Products informations
let Product1 = Product(n:"spoon" , h:15 , w:4 , c:"White", q:50 , p:20)
let Product2 = Product(n:"fork", h:15 , w:3 , c: "black", q:50 , p:20)
let Product3 = Product(n:"knife", h:15 , w:2 , c: "blue", q:50 ,p:20)
let Product4 = Product(n:"cup", h:15 , w:6, c:"green", q:30 ,p:30)
let Product5 = Product(n:"sandwich bags", h: 25, w: 5, c:"transparent" , q: 50 , p:10 )
let Product6 = Product(n:"straws", h: 15, w: 1 , c:"White", q:50 , p: 15 )
let Product7 = Product(n:"Tablecloth", h: 40, w:40 , c:"pink", q:10 , p:40 )




// My customers informations.
var customer1 = Customer(CustomerName: "Hana", CustomerAge: 20 , CustomerEmail: "hanaadam@gmail.com", CustomerPassWord:8664422, CustomerPhone: 0500998877)
var customer2 = Customer(CustomerName: "mona", CustomerAge: 22 , CustomerEmail: "monajfaisal@gmail.com", CustomerPassWord:7837299, CustomerPhone: 0500119991)
var customer3 = Customer(CustomerName:"huda", CustomerAge: 50, CustomerEmail: "hudaahmed@gmail.com", CustomerPassWord:182828282, CustomerPhone: 0500112200)
var customer4 = Customer(CustomerName:"reem", CustomerAge:47, CustomerEmail: "reemfahd@gmail.com", CustomerPassWord:6766868686, CustomerPhone: 0598712309)

//
Customer.getNameOfCustomer(customer: customer1)



// Here My first Customer Hana login in her account and she is bought 2 Products 😍.
customer1.login(password: 8664422)
let productsCustomer1 = [Product1,Product4]
customer1.buyProduct(products: productsCustomer1)//(custmercustmer: productsCustomer1)
print("  ")

// now reem my fourth Customer also login in her account and bought 3 Products 😍.
customer4.login(password: 6766868686)
let productsCustomer4 = [Product3,Product6,Product4]
customer4.buyProduct(products: productsCustomer4)


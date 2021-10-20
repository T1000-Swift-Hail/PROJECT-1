import UIKit
import Foundation
import Darwin


print("Welcome to our Big Glasses STORE ! \n")

struct Product {
    
    var brand:String
    var quantity:Int
    var made:String
    var type:String
    var price:Double
    
    init(brand:String, quantity:Int,  made:String, type:String,price:Double){
        self.brand = brand
        self.quantity = quantity
        self.made = made
        self.type = type
        self.price = price
        
    }
    
    func PrintDescription() {
        
        print("The glasess brand is \(brand) and the quantity is \(quantity) and made in \(made) this type is \(type)")
    }
    
}

var SunGls1 : Product = Product (brand: "Dior", quantity: 1, made: "italy", type: "SunGlasess",price: 44.50)
var Sungls2 : Product = Product (brand: "police", quantity: 1, made: "italy", type: "SunGlasess",price: 34.44)
var SunGls3 : Product = Product (brand: "Fendi", quantity: 1, made: "italy", type: "SunGlasess",price: 50.99)
var Sungls4 : Product = Product (brand: "Ray Ban", quantity: 1, made: "italy", type: "SunGlasess",price: 32.10)

var Glas1: Product = Product (brand: "carter", quantity: 1, made: "italy", type: "glasess", price: 50.99)
var Glas2 = Product (brand: "gucci", quantity: 1, made: "italy", type: "glasess", price: 34.44)
var Glas3 = Product (brand: "D&G", quantity: 1, made: "italy", type: "glasess", price: 44.5)
var Glas4 = Product (brand: "Lv", quantity: 1, made: "italy", type: "glasess", price: 14.1)


let Sunglasses:[Product] = [SunGls1, Sungls2, SunGls3, Sungls4]

print("------")

let Glasess:[Product] = [Glas1, Glas2, Glas3, Glas4]

print("Our list of product are :")

for glass in Sunglasses {
    
    print(" \n Sunglasess \(glass.brand) and price is \(glass.price) Dollars")
    
}

print(" \n and this :")

for glasses in Glasess {
    
    print(" \n glasess \(glasses.brand) and price is \(glasses.price) Dollars")
    
}

class User  : Hashable{
    
    var name:String = ""
    var phoneNumber:Int = 0
    var age:Int=0
    
    var shoppingCart : [Product] = []
    var ShoppingCartR : [Product] = [Sungls4]
    
    init(name:String, phoneNumber:Int, age:Int){
        self.name = name
        self.phoneNumber = phoneNumber
        self.age = age
        
        signIn()
    }
    
    func addToShoppingCart (product : Product){
        print("The product \(product.brand) is added to shopping cart")
        shoppingCart.append(product)
    }
    
    func rmToShoppingCart (product1 : Product){
        print("The product \(product1.brand) is Remove from shopping cart")
        ShoppingCartR.remove(at: 0)
        
    }
    
    func addToShoppingCart (product2 : Product){
        print("The product \(product2.brand) is added to shopping cart")
        shoppingCart.append(product2)
    }
    
    
    func searchForGlass(brandName : String) {
        print("\(name) is searching for sunglass \(brandName)")
        //let foundGlass =  Glasess.first(where: { $0.brand == brandName })
        let foundGlass =  Glasess.first(where: { p in
            return p.brand == brandName
        } )
        if let myGlass = foundGlass {
            print("\(myGlass.brand) Glass is found!!")
        }
        
        else {
            print("\(brandName) Glass not found")
        }
    }
    
    
    func signIn () {
        print(" \n  \(name) has signd In  ")
    }
    
    func PrintDescription()->String {
        
        return(" \n user name is  \(name) and his phone number is \(phoneNumber) and his age is \(age)  ")
    }
    
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

enum ShoppingRules: Error {
    
    case MinimumPrice
    case CheckProduct
    
}

func MinimumPr(price:Double,quantity:Int, customer : User) throws -> String {
    
    let minimumPrice = 25.0
    let checkProudct = 2
    
    guard price < minimumPrice else {
        
        throw ShoppingRules.MinimumPrice
    }
    guard quantity >= checkProudct else {
        
        throw ShoppingRules.CheckProduct
    }
    return "Your order is Confirmd"
    
}


print("------")

var userAz = User(name: "Ahmed", phoneNumber: 0533333333, age: 22)
let userA = userAz.PrintDescription()
print(userA)

userAz.addToShoppingCart(product: Glas3)
userAz.addToShoppingCart(product: Glas4)

print("-------")

var userkh = User(name:"khalid",phoneNumber:05055055,age:33)
let userkh1 = userkh.PrintDescription()
print(userkh1)

userkh.rmToShoppingCart(product1: Sungls4)
userkh.addToShoppingCart(product: Glas2)
userkh.searchForGlass(brandName: "gucci")
userkh.addToShoppingCart(product: Sungls2)

print("-------")

var userMH = User(name: "Mohammed", phoneNumber: 054345434, age: 20)
var userMH1 = userMH.PrintDescription()
print(userMH1)
userMH.addToShoppingCart(product: SunGls1)
userMH.addToShoppingCart(product: Glas2)

print("-------")

var userNr = User(name: "Nora", phoneNumber: 05554534, age: 25)
var userNr1 = userNr.PrintDescription()
print(userNr1)
userNr.addToShoppingCart(product: Sungls2)
userNr.addToShoppingCart(product: Glas2)

print("--------")

var userSr = User(name: "Sara", phoneNumber: 05435855, age: 21)
var userSr1 = userSr.PrintDescription()
print(userSr1)
userSr.rmToShoppingCart(product1: Glas2)

print("----------")

var userTH = User(name: "Tahani", phoneNumber: 0555165553, age: 23)
var userTH1 = userTH.PrintDescription()
print(userTH1)
userTH.searchForGlass(brandName: "carter")

print("---------")

var userAli = User(name: "Ali", phoneNumber: 0544334, age: 30)
var userAli1 = userAli.PrintDescription()
print(userAli1)
userAli.addToShoppingCart(product: Glas2)
userAli.addToShoppingCart(product: Sungls2)


print("--------")

do {
    let orderMax = try MinimumPr(price: 25, quantity: 2, customer:userNr )
    print("\(userNr.name)  \(orderMax)")
} catch ShoppingRules.MinimumPrice {
    print("\(userNr.name) your order is low, you must order 25 Dollors or more")
    
} catch ShoppingRules.CheckProduct {
    
    print("\(userNr.name) your order is low, you must order 2 Glasess or more")
}

class Manager {
    
    var name:String = ""
    var phoneNumber:Int=0
    var email:String=""
    var age:Int=0
    
    var discription : String {
        
        return " \n manager name is \(name) and his phone Number \(phoneNumber) and his Email is \(email) and his age is \(age) \n  "
    }
    
    
    init(name:String,phoneNumber:Int,email:String,age:Int) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.age=age
    }
    
}

print("---------")

var managerAz = Manager(name: "abdulaziz", phoneNumber: 055555555, email: "Az@gmail.com",age: 27)
print(managerAz.discription)


print("--------")



var groupBuyingGucci : Set<User> = [userkh, userMH]
var groupBuyingPolice : Set<User> = [userAli, userNr]


var BuyingGucci = groupBuyingGucci.union(groupBuyingPolice)

print(" \n Buying gucci Brand \n ")


for BuyingGucciBrand in BuyingGucci {
    
    print(BuyingGucciBrand.name)
}

print("------")

var BuyingBoth = groupBuyingGucci.intersection(groupBuyingPolice)

print(" \n all buying Both \n ")

for Buyingboth in BuyingBoth {
    print(Buyingboth.name)
}

if BuyingBoth.isEmpty {
    
    print("No one is buying gucci and police at the same time")
}

print("-------")


var groubbuyingpolice = groupBuyingPolice.subtracting(groupBuyingGucci)

print(" \n All buying Police but didn't buy gucci \n ")

for Buying in groubbuyingpolice {
    
    print(Buying.name)
}





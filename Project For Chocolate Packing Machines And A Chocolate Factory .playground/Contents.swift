import UIKit
import Foundation

// Enumartion for chocolate Types
enum chocolateTypes: String {
    case milkChocolate = "Milk Chocolate"
    case darkChocolate =  "Dark Chocolate"
    case brownChocolate = "Brown Chocolate"
    case roseChocolate = "rose Chocolate"
    case kaptshinoChocolate = "kaptshino Chocolate"
}

protocol person{
    var email :String {get}
    var phone :Int {get}
}

//the struct is store
struct Store {
    var overView: String?
    
    func getName() -> String{
        return "LA Chocolatera "
    }
    // fune the overview types
    func getTheOverView() -> String {
        return "Chocolate Made Entirely From The Fruits Cocoa Chocolate Stuffed With Nuts Or Caramel Colored Chocolate For Children Wafer Covered With Chocolate , and we sells these types of chocolates: \(chocolateTypes.darkChocolate.rawValue),\(chocolateTypes.milkChocolate),\(chocolateTypes.milkChocolate.rawValue),\(chocolateTypes.brownChocolate),\(chocolateTypes.milkChocolate.rawValue),\(chocolateTypes.darkChocolate)"
        
    }
}



class Product {
    
    var color:String
    var quantity:Int
    var price:Int
    var name : String
    var productType : chocolateTypes
    
    var description : String {
        return  "name of product \(name),price of product \(price) ,color of product \(color)quantity of product \(quantity)productType of product \(productType) "
    }
    
    init(color:String,quantity:Int,price:Int,name : String,productType : chocolateTypes ){
        self.price = price
        self.color = color
        self.name = name
        self.quantity = quantity
        self.productType = productType
        
    }
}

//Enumration for shopping car Error
enum ShoppingCartError : Error {
    case shoppingCartEmpty(String)
}


struct Customer : person, Hashable {
    
    
    var email: String
    
    var phone: Int
    
    var name :String,thenumber:Int,price:Int
    
    var shoppingCart : [Product]
    
    func removeChoclate(productToremove : Product) throws -> String {
        if shoppingCart.isEmpty {
            throw ShoppingCartError.shoppingCartEmpty("\(name) cannot remove \(productToremove.name), It is already empty")
        } else {
            return "\(name) removed \(productToremove.name) from shopping cart"
        }
        
    }
    
    mutating func buychocolate(productToBuy : Product){
        
        print("\(name) added \(productToBuy.name) to shopping cart")
        
        shoppingCart.insert(productToBuy, at: 0)
        
        
    }
    
    func orderProduct<T>(productToOrder : T){
        print("ordered \(productToOrder)")
    }
    
    
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    func compirePrices() {
        
        if product3.price > product2.price {
            print ("\(product3.name) is greater than (\(product2.name)")
        }else{
            print ("\(product3 .name)is less than or equal (\(product2.name)")
        }
    }
    
}

// ______________________________________________________________________________________

// Welcome to The Store

let store = Store(overView: nil)
print("Welcome to our store \(store.getName())")
print(store.getTheOverView())

// __________________________

var products = ["product":"string","product2":"string","product3":"string"]

var product = Product(color: "dark", quantity: 50, price: 120 , name: "dark chocolate", productType: .darkChocolate)

var product2 = Product(color: "white", quantity: 80, price: 150 , name: "milk chocolate", productType: .milkChocolate)
var product3 = Product(color: "brown", quantity: 90, price: 180, name: "brownchocolate", productType: .brownChocolate)

var produc4 : Product? = Product(color: "Red", quantity: 20, price: 100, name: "Redchocolate", productType: .darkChocolate)
var product5 = Product(color: "pink", quantity: 89, price: 177, name: "roseChocolate", productType: .roseChocolate)
var product6 = Product(color: "brown", quantity: 91, price: 189, name: "cofechocolate", productType: .brownChocolate)
var product7 = Product(color: "kaptshino", quantity: 94, price: 192, name: "browChocolate", productType: .kaptshinoChocolate)


var storeProducts = [product, product2, product3,product5,product6,product7]

print("Our list of prodcuts....")
for product in storeProducts {
    print(product.description)
}
product.color = "brown" //.updateValue("brown", forKey: "color")

var customer = Customer(email: "sehem1312@hotmail.com", phone: 05342456778, name:"sehem", thenumber: 3, price: 150, shoppingCart:[] )

var customer2 = Customer(email: "ahmad1231@hotmail.com", phone: 050176543, name: "ahmad", thenumber: 5, price: 110, shoppingCart:[] )

var customer3 = Customer(email: "hind2342@gmail.com", phone: 05623467, name: "hind", thenumber: 9, price: 190, shoppingCart:[])

var customer4 = Customer(email: "lana4560@gmail.com", phone: 055347899, name: "lana", thenumber: 2, price: 118, shoppingCart: [])

var customer5 = Customer(email: "sara@gmail.com", phone: 0567654435, name: "sara", thenumber: 9, price: 166, shoppingCart: [])

var customer6 = Customer(email: "hoor767@gmail.com", phone: 056456788, name: "hoor", thenumber: 2, price: 119, shoppingCart: [])

var customer7 = Customer(email: "hana00@gmail.com", phone: 0553477654, name: "hana", thenumber: 1, price: 155, shoppingCart: [])

var customer8 = Customer(email: "mona07@hotmail.com", phone: 055345432, name: "mona", thenumber: 7, price: 118, shoppingCart: [])


customer4.buychocolate(productToBuy: product3)
customer4.buychocolate(productToBuy: product2)
customer4.buychocolate(productToBuy: product)
customer2.buychocolate(productToBuy: product2)

let customers = [customer2:product3,customer3:product3,customer6:product3,customer7:product5,customer8:product7,customer5:product]
for (customer,product) in customers {
    do {
        let result = try customer.removeChoclate(productToremove: product)
        print(result)
    } catch ShoppingCartError.shoppingCartEmpty {
        print("Error: The Shopping Cart is Empty..")
    }
}

customer6.buychocolate(productToBuy: product6)
customer8.buychocolate(productToBuy: product5)
customer.buychocolate(productToBuy: product)

var storecustomers = [customer,customer2,customer3,customer4,customer5,customer6,customer7,customer8]

print("our list of customers...")
for customer in storecustomers {
    print(customer.name)
}


print("Customers who bought Dark Chocolate :")

var customersBoughtDarkChocolate : Set<Customer> = [customer, customer5, customer4]
for customer in customersBoughtDarkChocolate {
    print(" \(customer.name)")
}

var customersBoughtbrownChocolate : Set<Customer> = [customer2,customer3,customer4,customer6]

print("Customers who bought Dark Chocolate & Brown Chocolate :")

var unionDarkBrowns = customersBoughtDarkChocolate.union(customersBoughtbrownChocolate)
for unionDarkBrown in unionDarkBrowns {
    print(unionDarkBrown.name)
}

print("Customer who bought brown Chocolate : ")

var intersectionDarkBrowns = customersBoughtDarkChocolate.intersection(customersBoughtbrownChocolate)
for intersectionDarkBrown in intersectionDarkBrowns {
    print(intersectionDarkBrown.name)
}

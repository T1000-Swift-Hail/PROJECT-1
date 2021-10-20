

import UIKit
import Foundation

// protocol for customer info
protocol customers {
    var fristname : String {get}
    var secondname : String {get}
    var email : String {get}
    var passward : Int {get}
    var phonenumber : Int {get}
    func search ()
    func Viewtheproduct ()
    func add (product : Product?)
    func remove (product: Product)
    func address ()
    func CheckDeliveryStatus ()
}


enum PetSuppliersError : Error {
    case PetSupplierslow
}

//struct for the shop products info + extension product
struct Product : Hashable {
    var name : String
    var description : String
    var price : [Curancy:Int]
    

    
}
extension Product {
   
    func PetSuppliersProduct () {
        print("product: \(name) and \(description) price is \(price.values)")
    }
    
    }
// class for customer informations in the store
class PetSuppliersStoreCustomer : customers, Hashable {
   
    
    var fristname: String
    var secondname: String
    var email: String
    var passward: Int
    var phonenumber: Int
    var addres: String
    var description : String {
        return "\(fristname) and his email is \(email)"
    }
    
    init( f: String, s: String, e: String, p: Int, ph: Int, addres: String) {
        self.fristname = f
        self.secondname = s
        self.email = e
        self.passward = p
        self.phonenumber = ph
        self.addres = addres
        
    }
    // funcs for product search, view
    func search() {
        print("Search for Products.")
    }
    
    func Viewtheproduct() {
        
        print("Viewtheproduc...")
    }

    //optional
    func add(product : Product?) {
        if product == nil {
         print("product is required to register")
        }
        print("\(fristname) Added Products to the shopping cart \(product?.name ?? "no product")")
    }
    
    func remove(product : Product) {
        assert((product.price[.sar] ?? 0) > 0)
        
        print("\(secondname) Remove a product from the shopping cart \(product.name) ")
    }
    
    func address() {
        print("Fill in my address for delivery:\(Ahmad.addres)")
    }
    
    func CheckDeliveryStatus() {
        print("The order have been deliverd for : \(kaild.fristname) ")
    }
    
    
   
    
    
    static func == (lhs: PetSuppliersStoreCustomer, rhs: PetSuppliersStoreCustomer) -> Bool {
        return lhs.fristname == rhs.fristname
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(fristname)
    }
    
}


print("Welcome to our greate store Pet Supplies ! you will have a great time ! \n")




enum Curancy {
    case sar
    case us
}




struct Manager {
    var fristname : String
    var secondname : String
    var email : String
    var passward : Int
    var phonenumber : Int
    func add (product : Product) {
        print("add new products to the online store")
    }
    func updateprodect () {
        print("Update a product info")
    }
    func removeproduct () {
        print("remove product")
    }
    func BrowsePurchaseHistory () {
        print("Browse Purchase History")
    }
    func viewsales () {
        print("view the total sales revenue")
    }
    func viewMostProduct() {
        print("View the most sold products on the store")
    }
    func CheckDeliveryStatus (){
        print ("Check delivery status")
    }
    func ChangeDeliveryStatus () {
        print("Change delivery status")
    }
}

//objects for all petsuppilers in details + loop
var catFood = Product(name: "cat food", description: "solid gold", price: [.sar:58])
var dogFood = Product(name: "dog food", description: "josi", price: [.us:40])
var bridFood = Product(name: "bird food", description: "beaphar", price: [.sar:178])
var othersupplies  = Product(name: "othersupplies ", description: "zolux", price: [.sar:60])

var storeProducts = [catFood, dogFood, bridFood, othersupplies]
print("List of products :")
for product in storeProducts {
    product.PetSuppliersProduct()
}

print("")

var kaild = PetSuppliersStoreCustomer (f:"kaild" ,s:"mohammd" ,e: "plk-123@gmail.com",p: 58776 ,ph: 5678543,addres: "saudi arabia")
var mohammad = PetSuppliersStoreCustomer (f:"mohammad" ,s:"salh" ,e: "mob-123@gmail.com",p: 5877676 ,ph: 567866,addres: "oman")
var omar = PetSuppliersStoreCustomer (f:"omar" ,s:"hmmod" ,e: "muy-124@gmail.com",p: 5877675 ,ph: 567855,addres: "oman")
var Ahmad = PetSuppliersStoreCustomer (f:"Ahmad " ,s:"zamil" ,e: "miii-90@gmail.com",p: 5877675 ,ph: 567777,addres: "saudi arabia")
var saad = PetSuppliersStoreCustomer (f:"saad " ,s:"hmod" ,e: "mlkj-188@gmail.com",p: 58778 ,ph: 567854,addres: "kuwait")
var Abdallh = PetSuppliersStoreCustomer (f:"hammad" ,s:"hmod" ,e: "mee-188@gmail.com",p: 5877687 ,ph: 56788887,addres: "kuwait")

kaild.add(product: catFood)
mohammad.add(product: dogFood)
mohammad.add(product: catFood)
omar.add(product: bridFood)
Ahmad.remove(product: catFood)
Ahmad.add(product: bridFood)
saad.add(product: catFood)
Abdallh.remove(product: bridFood)
Abdallh.add(product: othersupplies)

var storecustomer = [kaild, mohammad ,omar,Ahmad,saad,Abdallh]
print("list of storecustomer :")

for customer in storecustomer {
    print(customer.fristname)
}

var customersWhoBoughtCatFood : Set = [kaild, mohammad,saad]
print("\n Customers who Bought Cat Food")
for customer in customersWhoBoughtCatFood {
    print("\(customer.fristname) bought cat food!")
}

var customersWhoBoughtBirdFood : Set = [omar,Ahmad]

print("\n Customers who Bought Bird Food")
for customer in customersWhoBoughtBirdFood {
    print("\(customer.fristname) bought bird food!")
}

var price = [58,40,178,60]
var sortedprice = price.sorted (by: {(i:Int, j:Int) -> Bool in return i > j
    
})
var salesprice = price.max(by: {$0 < $1 })
print("the max price of sales is")
print(salesprice!)
 

let status1 = PetSuppliersStoreCustomer.CheckDeliveryStatus(kaild)
status1.self()



let addressA = PetSuppliersStoreCustomer.address(Ahmad)
addressA.self()


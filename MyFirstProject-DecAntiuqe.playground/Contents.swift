import UIKit

// An Enum for Types of Users...
enum TypeOfUser {
case admin
case customer
}
// An Enum for Errors of checking the stock...
enum StockOfProducts : Error {
case availabe
case outOfStock
}
// An Enum for Types of Flowers...
enum TypeOfFlower: String {
    case Gardenias = "Gardenias"
    case Roses = "Roses"
    case babyRoses = "Baby Roses"
    case Lavender = "Lavender"
    case Lilies = "Lilies"
    case Peonies = "Peonies"
    case Snapdragon = "Snapdragon"
    case Sunflowers = "Sun Flowers"
    case Tulips = "Tulips"
    case Iris = "Iris"
    case Daisies = "Daisies"
}
//Protocol of users..
protocol Users {
     var userName : String { get }
    var typeOfUser : TypeOfUser { get }
    var passWord: String { get }
    var email: String { get }
    var phoneNum : Int { get }
}
//Protocol for Products..
protocol ProductProtocol {
    var id: Int? { get }
    var name: String? { get }
    var price: Double { get }
    var stock : Int? { get }
    var color : String { get}
}
// Struct of Admin ..
struct Admin : Users {
    var userName: String
    var typeOfUser: TypeOfUser
    var passWord: String
    var email: String
    var product : [Product]?
    var phoneNum: Int
    
    func addNewProdcut(product : Product) -> String{
        return  "your product with name:\(product.name ?? "") has been added succesfully"
    }
    func editeProdcut(product : Product) -> String{
        return "your product with name:\(product.name ?? "") has been edited price to \(product.price) succesfully "
    }
    func deleteProdcut(product : Product) -> String{
        return "your product with name:\(product.name ?? "") has been deleted succesfully "
    }
   
    func printListOfUsers(managers: [Admin], custumers:[Customer]){
        print ("List of our customers:")
        for customer in custumers {
            print("Custmer \(customer.userName)")
        }
        print ("\nList of our admins:")
        for manager in managers {
            print("Admin \(manager.userName)")
        }
    }
//    func recommenations(){
//    }
}

//Struct for Cusromers..
struct Customer : Users {
    var userName: String
    var typeOfUser: TypeOfUser
    var passWord: String
    var email: String
    var phoneNum: Int
    var shoppingCart : ShoppingCart?
    var adress : String
    
    func browsingProducts(products: [Product],customerName: String) {
        print("Now We Browsing Products for \(customerName)")
        for product in products {
            print("This is product Name:\(product.name ?? ""), The type is:\(product.typeofFlower.rawValue),And the prdouct:\(product.color)")
        }
    }
    func viewProdcutInfo(product : Product) -> String{
        
        return "Product Information : \nProduct name:\(product.name ?? ""), Has ID number \(product.id ?? 0). We have \(product.stock ?? 0) of this product, with price of \(product.price) and the color is \(product.color ). Its type is \(product.typeofFlower)."
    }
    mutating func addToShoppingCart(product : Product) {
        shoppingCart?.items?.insert(product, at: 0)
    }
//    func searchForProducts(){
//
//    }
//    func fillingAdress(){
//
//    }
//    func printReceipt(){
//
//    }
//    func sendingGift(){
//
//    }
   }

//Struct For Products..
struct Product : ProductProtocol{
    var id: Int?
    var name: String?
    var stock: Int?
    var color: String
    var price: Double
    var typeofFlower : TypeOfFlower
    var tax : Double
    
    mutating func taxCalculate(){
        tax = (price * 0.15) + price
        print("Price After tax will be \(tax)")
    }
    
    func doesProductAvailabe(stock: Int) throws -> String {
        if stock < 1 {
            throw StockOfProducts.outOfStock
        }
        guard stock < 1 else {
            throw StockOfProducts.availabe
        }
        return "Product Availabe \(stock)";
       }
    }

//Class of Shopping Cart..
class ShoppingCart {
    var color: String
    var name: String?
    var price: Double
    var stock: Int?
   var id : Int?
   var user : Customer
   var items : [Product]?
    
    var totalPrice : Double {
        var total = 0.0
        for item in items! {
            total += item.price
        }
        return total
    }
    
    init(_ name:String, _ color:String, _ price:Double, _ stock: Int, _ id: Int, _ user: Customer,_ itmes:[Product]  )
    {
        self.name = name
        self.color = color
        self.price = price
        self.stock = stock
        self.id = id
        self.user = user
        self.items = itmes
    }
}

//Struct for Tracking..
struct Traking {
    let analiys1: [Customer]
    let analiys2 : [Cheackout]

    func printCustomers() {
        
        for customer in analiys1 {
            print("UserName: \(customer.userName) ,Email: \(customer.email) ,PhoneNumber: \(customer.phoneNum) , Adress: \(customer.adress) ")
        }
    }
    
    func topSelling() {
        
        if let topSelling = analiys1.max(by: { a, b in a.shoppingCart?.totalPrice ?? 0 < b.shoppingCart?.totalPrice ?? 0 }) {
            print("\(topSelling.userName) is the top paying customer . the payment is :  \(topSelling.shoppingCart!.totalPrice)")
        }
    }
}

//Struct for checkOut...
struct Cheackout {
    let product : [Product]
    
    func procesedCheckout() {
        for product in product {
            print("This product checked out:")
            print(product.name ?? "")
        }
    }
}

//*********

//Greating ^^..
let STORE_NAME = "December Anitques"
print("*Welcome to our store  (\(STORE_NAME))  you'll have a great time!^^ \n")

//Users
let manger_1 = Admin(userName: "Ahmed", typeOfUser: .admin, passWord: "112233", email: "Ahmed@gmail.com", phoneNum: 05544332211)
var customer_1 = Customer(userName: "Dalal", typeOfUser: .customer, passWord: "11$$22!!", email:"Dalal@gmail.com", phoneNum: 05566443322, adress:" Ha'il, alFaisl street")
var customer_2 = Customer(userName: "Asma", typeOfUser:.customer, passWord: "11$$22!!", email:"Dalal@gmail.com", phoneNum: 05566443322, adress: "Ha'il, 55 Street")

//Products
var product = Product(id: 1, name: "Tulips", stock: 15, color: "Pink", price: 6, typeofFlower: .Tulips, tax: 0.15)
let product1 = Product(id: 2, name: "Gardenias", stock: 30, color: "White", price: 10.5, typeofFlower:.Gardenias, tax: 0.15)
let product2 = Product(id: 3, name: "Roses", stock: 20, color: "Red", price: 5, typeofFlower:.Roses, tax: 0.15)
let product3 = Product(id: 4, name: "babyRoses", stock: 40, color: "Colored", price: 8, typeofFlower:.babyRoses, tax: 0.15)
let product4 = Product(id: 5, name: "Sunflowers", stock: 10, color: "Yellow", price: 6, typeofFlower:.Sunflowers, tax: 0.15)
//
let products = [product,product1,product3]
customer_1.browsingProducts(products: products,customerName: customer_1.userName)

customer_1.shoppingCart = ShoppingCart("Gardenias","White", 0, 30, 2, customer_1, [product] )
customer_2.shoppingCart = ShoppingCart("Gardenias","White", 0, 30, 2, customer_2, [product] )
customer_2.addToShoppingCart(product: product)
customer_2.addToShoppingCart(product: product)
customer_2.addToShoppingCart(product: product)
customer_1.addToShoppingCart(product: product)
customer_2.addToShoppingCart(product: product3)
customer_2.addToShoppingCart(product: product3)

print("\n*We Can print a list Of our users ^^ ")
manger_1.printListOfUsers(managers: [manger_1], custumers: [customer_1, customer_2])

//Calculating the tax for tulips ..
print("\n*And here is the Tulip's price after adding the tax ^^ ")
product.taxCalculate()

print("")
print("\n*Our Amazing Managers can add any product they want ^^ ")
//Admin Adding products
let addProduct = manger_1.addNewProdcut(product: product)
print(addProduct)

print("\n*Also they can delete any product they want :( ")
//Admin Deleting products
let deleteProduct = manger_1.deleteProdcut(product:product1)
print(deleteProduct)

print("\n*Here you go, our prodcut Information ^^ ")
let viewingProduct = customer_2.viewProdcutInfo(product: product4)
print(viewingProduct)

//Shopping cart
let cart_1 = ShoppingCart("Gardenias","White", 154.5, 30, 2, customer_1, [product] )
let cart_3 = ShoppingCart("Roses", "Red", 15, 20, 3, customer_2, [product] )

print("\n*Now! check the availablity of a product ^^ ")
//Check if the product availabe or not
var stock = product2.stock
do {
    try product2.doesProductAvailabe(stock: 5)
    print("\(product2.stock!) of \(product2.name!) are availabe .")
}
catch StockOfProducts.outOfStock {
    print("Out of Stock!")
}
catch StockOfProducts.availabe {
    print("\(product2.stock!) of \(product2.name!) are availabe. You can order now!")
}
catch {
    print("An unknown error occurred: \(error)")
}

print("\n*Also, those the products that have been checkedOut ! ")
//Checkout products
let checkoutProducts = Cheackout(product: [product1,product2])
checkoutProducts.procesedCheckout()


print("\n*We can preview the costumers informations : ")
let analiys1 = Traking(analiys1: [customer_1,customer_2], analiys2: [checkoutProducts])
//printing customer names
analiys1.printCustomers()

print("")

//Comparing between 2 product prices
print("\n*And we can see who pays more ^^ ")

analiys1.topSelling()

print("")
//Sets of customer purshases...
var dalalPurchases: Set = [TypeOfFlower.Sunflowers,.Roses,.Gardenias,.Tulips,.babyRoses,.Lavender]
var asmaPurchases: Set = [TypeOfFlower.Sunflowers,.Roses,.Gardenias,.Tulips,.Daisies,.Iris]

// Admin can print all purshace for all custumers ^^..
print("Names of All Customers's Purchaces:")
for allProduct in dalalPurchases.union(asmaPurchases) {
    print(allProduct)
}
// Admin can see the similer purshaces between custumers ^^..
print("\nDalal and Asma both purchase:")
for sameProduct in asmaPurchases.intersection(dalalPurchases) {
    print(sameProduct)
}
// Admin can make recommendations for custumers ^^..
print("\nRecommendations For Asma:")
for recProduct in dalalPurchases.subtracting(asmaPurchases) {
    print(recProduct)
}

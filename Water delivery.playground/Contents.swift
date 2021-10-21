import UIKit
print ("water Delivery App")
print("Welcome to our water delivery store:^_^ ")

// This is payment Errorh for order.

enum PaymentError: Error {
    case paymentLow
    case quantityLow
}
//this is enum for product.
enum Products {
    case smallsize
    case BasicGroup
    case glassGroup
    case largSize
}
//this is enum for paymentMethod.
enum PaymentMethod {
    case applePay
    case cash
}
// This is protocol of user.
protocol User{
    var username :String? {get}
    var name:String {get}
    var lastname :String {get}
    var phoneNumber: Int {get}
    var Address : String {get}
}
//this is manager class from user.___________
class Manager :User {
    var username: String?
    var name: String
    var phoneNumber:Int
    var lastname :String
    var Address :String
    //initilize for the manager.
    init(name:String, lastname:String ,phoneNumber:Int ,Address:String) {
        self .name = name
        self.lastname = lastname
        self.phoneNumber = phoneNumber
        self.Address = Address
    }
    // This function print the descrption for the manger.
    func printDescription() {
        print("the manger name is \(name) \(lastname) , phonenumer is \(phoneNumber) and address \(Address)")
    }//call the username.
    func getUserName() -> String {
        guard username != nil else { return "No user name entred" }
        
        return username ?? "No user name entred"
    }
    
}
//this custumer struct from user.
struct Custumer : User , Hashable{
    
    
    var username: String?
    var name: String
    var lastname: String
    var phoneNumber: Int
    var Address: String
    var statusdelivery : String
    var shoppingCart : ShoppingCart = ShoppingCart(products: [])
    
    //this is genric for statusdelivery.
    static func statusdelivery<T>(a:T , b:T )->(T,T){
        return (a,b)
    }
    
    mutating func buyWater (quantity: Int, product: Product){
        shoppingCart.products.append(product)
        print("\(name) is buying \(quantity) \(product.name) ! ")
    }
    
    func removeWater (_: Product){
        print("\(name) is remove \(product.name) ! ")
        
    }
    func veiwshoppingCartProducts(){
        
        print("products in \(name) shopping cart:")
        
        for product in shoppingCart.products {
            print("\(product.name) ")
        }
        
        
        
    }
    
    
    static func == (lhs: Custumer, rhs: Custumer) -> Bool {
        return lhs.username == rhs.username
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(username)
    }
    
}
enum PackgingTypes {
    case poxes
}
enum SizeType: String {
    case ml = "ml"
    case leter = "L"
    
}
enum CurncyType: String {
    case sar = "SAR"
    case usd = "USD"
}
struct Product : Hashable {
    var name: Products
    var price:Int
    var size : Double
    var sizeType:SizeType
    var cruncy : CurncyType
    var typePackging: PackgingTypes
    var quantity :Int
    
}

// this is struct for shippingcart and use for loop .
struct ShoppingCart  {
    
    var products : [Product]
    
    func addProductToCart() throws  {
        
        
        for product in products {
            guard product.quantity < 4 else { throw PaymentError.quantityLow }
        }
        
        
        
    }
}

// this is chickout struct and for loop shoppingcart.
struct Cheackout {
    var shoppingCart : ShoppingCart
    
    func addCartToCheackout(paymentMethod: PaymentMethod) {
        print("This Products go to Cheackout...")
        for product in shoppingCart.products {
            
            print("The size of water is \(product.sizeType),the quantity is \(product.quantity),the size is \(product.size), and the prices is \(product.price) SR")
    }
        
        switch paymentMethod {
        case .applePay:
            print("Apple Pay not AV rghit now")
        case .cash:
            print("done Payment With Cash")
            print("vat is 15 %")
        }
        
    }
}
//this is product extension.
extension Product {
    func describeprduct(){
        print("name is \(name) the price is \(price) ryal and the size \(size) quaninty is \(quantity). Add products to the shipping cart")
        
    }
}
//this is manager extension
extension Manager {
    func describmanager(){
        
        print ("my name is \(name) \(lastname) and my number is \(phoneNumber) ,My address \(Address)")
    }
    
}

//
var manger = Manager(name:"Ahmed" , lastname: "Ali", phoneNumber: 8769877, Address: "hail")
manger.username = "AhmedMohmmad"


manger.printDescription()

var product = Product(name: .largSize, price: 20, size: 1.5, sizeType: .leter, cruncy: .sar, typePackging: .poxes, quantity: 10)
var product1 = Product(name: .largSize, price: 40, size: 330, sizeType: .ml, cruncy: .sar, typePackging: .poxes, quantity: 8)
var product2 = Product(name: .glassGroup, price: 40, size: 300, sizeType: .leter, cruncy: .sar, typePackging: .poxes, quantity: 8)
var product3 = Product(name: .glassGroup, price: 50, size: 330, sizeType: .ml, cruncy: .sar, typePackging: .poxes, quantity: 4)
var product4 = Product(name: .largSize, price: 80, size: 200, sizeType: .ml, cruncy: .sar, typePackging: .poxes, quantity: 11)


var shoppingCart = ShoppingCart(products: [product,product2,product1 , product4 , ])


var ahmed = Custumer( name: "Ahmed", lastname: "Hatem", phoneNumber: 485743, Address: "Sababah", statusdelivery: "not delivered")
var amjed = Custumer( name: "Amjed", lastname: "Salem", phoneNumber: 0987665, Address: "Almmlakah", statusdelivery: "deliverd")
var maha = Custumer(name: "Maha", lastname: "Abdullah", phoneNumber: 07543234, Address: "Alfajer", statusdelivery: "not delivered")
var amal = Custumer( name: "Amal", lastname: "khalid", phoneNumber: 5432245, Address: "sidyan", statusdelivery: "deliverd")
var faris = Custumer(name: "Faris", lastname:" Alfaris", phoneNumber: 09494949, Address: "Alrajhi", statusdelivery: "drliverd")
var salem = Custumer( name: "Salem", lastname: "Alsalem", phoneNumber: 49958485, Address: "Almasaif", statusdelivery: "deliverd")
var anwar = Custumer(name: "anwar", lastname: "mohammed", phoneNumber: 045678, Address: "Alrajhi", statusdelivery: "not delivered")

//this is customers who buywater_______________________
print("customers who bought from the store:")
ahmed.buyWater(quantity: 28, product: product4)
amjed.buyWater(quantity: 10, product: product2)
maha.buyWater(quantity: 11, product: product1)
amal.buyWater(quantity: 8, product: product)
faris.buyWater(quantity: 33, product: product3)
salem.buyWater(quantity: 40, product: product2)
salem.buyWater(quantity: 40, product: product4)
faris.buyWater(quantity: 30, product: product)
amjed.buyWater(quantity: 20, product: product1)



salem.veiwshoppingCartProducts()
amal.veiwshoppingCartProducts()
faris.veiwshoppingCartProducts()
amjed.veiwshoppingCartProducts()


//this is customers who removewaterproduct_____
print("customers who removed orders from the store:")
ahmed.removeWater(product1)
anwar.removeWater(product4)
//This is set for customersWhoboughtLargsizeWater
var customersWhoboughtLargsizeWater : Set = [ maha , ahmed]
print("\n customers Who bought Larg size Water")
for customer in customersWhoboughtLargsizeWater{
    print("\(customer.name) bought large size water!")
    
}//SET
var customersWhoboughtglassGroupwater: Set = [amal , faris ,amjed]
print("\n customers Who bought glass Group water")
for customer in customersWhoboughtglassGroupwater{
    print("\(customer.name)bought glass Group water!")
    
}




// use do and catch for chickout...................

let checkout = Cheackout(shoppingCart: shoppingCart)
checkout.addCartToCheackout(paymentMethod:.cash)
do {
    try shoppingCart.addProductToCart()
} catch PaymentError.quantityLow {
    print("Did you order the required number of quantity?")
    print("your quantity  is low")
}
let price = [4500 ,2500,1000,1500,2000 ,4000]
let highPrices = price.sorted { (a:Int, b:Int) -> Bool in
    return a>b
}
print("Sales for this month:")
for highPrice in highPrices {
    print(highPrice)
}


let status = Custumer.statusdelivery(a: "deliverd ", b: "onMyWay")
print(" The order status: \(status)")

let waterprices = [ "glassgroup" :555 ,"Basicgroup":200,"largsize":1112 ]
let  waterpricess = waterprices.max {$0.value < $1.value}

print("the Best seller:")
print(waterpricess?.key ?? "none")


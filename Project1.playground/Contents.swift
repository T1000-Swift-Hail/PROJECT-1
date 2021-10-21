import UIKit

// this is protcol user
protocol User {
    var userName :String {get}
    var userPassword :Int {get}
    
}

// This is enum for the customer buyer requiremnts
enum ErrorOrder: Error {
    case noSizeAV
    case outOfStouck
}
// This is the protocol from User
class Manager:User{
    var userName: String = ""
    var userPassword: Int = 0
    init (userName : String, userPassword : Int){
        self.userName = userName
        self.userPassword = userPassword
    }
}
// this is protocol from the user
struct Customer:User{
    var userName: String
    var userPassword: Int
    var FirstName: String
    var MiddleName:String?
    var LastName : String
    var address:String
    var ShoppingCart:[Product]
    
    // function to print out the coustomer product in his cart
    func buySports(){
        print("---------------------------")
        print("\(FirstName) has the following in his shopping cart : ")
        //        print("This is the all products in the shopping cart:....")
        print("---------------------------")
        for Product in ShoppingCart {
            
            
            
            print("\(Product.productname) bought for price \(Product.price) SAR")
        }
        print("---------------------------")
        
        
    }
}
// here to print out the customer full name I used otional to not print the middle name
extension Customer{
    func brandCustomer(){
        print("The Customer name is \(FirstName), middle name is \(MiddleName ?? " "), and Last name is \(LastName), " )
    }
}

// This is brands type in online shopping store

enum BrandType {
    case niki
    case addias
    case Puma
    case kswiss
}
// This enumeration for sizes type
enum SizeTypes: String {
    case xl = "XL"
    case m = "M"
    case l = "L"
    case s = "S"
    case other = "Other"
}
// This is product info
struct Product {
    
    var productname: String
    var price:Int
    var quantity : Int
    var productsize : SizeTypes
    var productcolor: String
    var Category:BrandType
    var sectionofproduct:[Int:String]
    
    func orderCustomer(sizeType:SizeTypes) throws -> String {
        
        switch sizeType {
        case .xl:
            return sizeType.rawValue
        case .m:
            return sizeType.rawValue
        case .l:
            return sizeType.rawValue
        case .s:
            return sizeType.rawValue
        case .other:
            throw ErrorOrder.noSizeAV
        }
    }
    
    func maintainCategory ()-> BrandType {
        switch Category {
        case.niki:
            print("Shoes","T-shirt","Jeans","Shorts","Jacket","Hoodies","Cap","cloves")
            return.niki
        case.addias:
            print("Shoes","T-shirt","Jeans","hats")
            return.addias
        case.Puma:
            print("Shoes","Sweatshirt","Jeackt","Wintershoes")
            return.Puma
        case.kswiss:
            print("Shoes","T-shirt","Jeans","Socks")
            return.kswiss
            
        }
    }
    func describeSports() {
        print("The product name is \(productname), the price is \(price) SAR, the quantity is \(quantity),the product size is \(productsize), the product color is \(productcolor), the sectiono f product is \(sectionofproduct)")
    }
}

func shoprequiemnts(noSizeAV:Int,outOfStouck:Int) throws->String{
    let maxProductnoSizeAV = 8
    let maxpruductoutOfStouck = 4
    if noSizeAV > maxProductnoSizeAV {
        throw ErrorOrder.noSizeAV
    }
    guard outOfStouck >= maxpruductoutOfStouck else {
        throw ErrorOrder.outOfStouck
    }
    return "the shipment is on way!"
}
class Productbrand {
    var name:String = ""
    var Productname :[Product] = []
    func describeSports(){
        for products in Productname {
            products.describeSports()
        }
    }
    
    func printThis<T>(brand:T) -> String {
        
        return "Here you are \(brand)"
    }
}
print("welcome to our store : Internationl Brands!")

print("Here is the brands that we have in store [niki, addias, Puma, and kswiss]")

// This is the prudect in shop with price and its quantity ....etc
let niki_1 = Product(productname: "shoes", price: 1120, quantity: 14, productsize: .xl, productcolor: "red", Category: .niki, sectionofproduct: [22:"NI"])

let niki_2 = Product(productname: "Jeans", price: 160, quantity: 14, productsize: .other, productcolor: "red", Category: .niki, sectionofproduct: [23:"NI"])

let niki_3 = Product(productname: "Jeans", price: 750, quantity: 14, productsize:.s, productcolor:"red" , Category: .niki, sectionofproduct: [24:"NI"])

let addias_1 = Product(productname: "shirt", price: 320, quantity: 9, productsize: .m, productcolor: "red", Category: .addias, sectionofproduct: [10 : "ED"])

let addias_2 = Product(productname: "shoes", price: 888, quantity: 9, productsize: .xl, productcolor: "blue", Category: .addias, sectionofproduct: [11 : "ED"])

let addias_3 = Product(productname: "Underwear", price: 190, quantity: 12, productsize: .m, productcolor: "White", Category: .addias, sectionofproduct: [12 : "ED"])
let Puma_1 = Product(productname: "Jeans", price: 888, quantity: 8, productsize: .l, productcolor: "black", Category: .Puma, sectionofproduct: [15 : "TU"])

let Puma_2 = Product(productname: "Cap", price: 320, quantity: 45, productsize: .s, productcolor: "Yellow", Category:.Puma, sectionofproduct: [16 : "TU"])

let Puma_3 = Product(productname: "Socks", price: 67, quantity: 23, productsize: .m, productcolor: "white", Category: .Puma, sectionofproduct: [17 : "TU"])

let kswiss_1 = Product(productname: "shirt", price: 320, quantity: 12, productsize: .xl, productcolor: "green", Category: .kswiss, sectionofproduct: [4 : "FC"])

let kswiss_2 = Product(productname: "pants", price: 888, quantity: 12, productsize: .s, productcolor: "orange", Category: .kswiss, sectionofproduct: [5 : "FC"])

let kswiss_3 = Product(productname: "swatershirt", price: 250, quantity: 16, productsize: .other, productcolor: "black", Category: .kswiss, sectionofproduct: [7 : "FC"])
print("---------------------------")

// This is customers choosen prodect for delivery

let customer1 = Customer(userName: "Fahad22", userPassword: 33445, FirstName: "fahad", MiddleName: nil, LastName: "Alshammari", address: "124 unit NO 1, Hail,Saudi Arabia", ShoppingCart:[niki_1, addias_1, Puma_1, kswiss_1])
customer1.brandCustomer()
let customer2 = Customer(userName: "alsham22", userPassword: 33445, FirstName: "Sultan", MiddleName: "Khalied", LastName: "Alanazi", address: "14 unit NO 5, Ryiadh,Saudi Arabia", ShoppingCart:[niki_2, addias_2, Puma_2, kswiss_3])
customer2.brandCustomer()
let customer3 = Customer(userName: "Sami_6", userPassword: 33445, FirstName: "Sami", MiddleName: nil, LastName: "Alotabi", address: "1657 unit NO 15, Tubak,Saudi Arabia", ShoppingCart:[niki_3, addias_3, Puma_3, kswiss_3])
customer3.brandCustomer()
//This is to print out

customer1.buySports()
customer2.buySports()
customer3.buySports()



var productbrand = Productbrand()


print()
print("This is the coustomers sizes")
let products = [niki_1,niki_2,niki_3,addias_1,addias_2,addias_3,Puma_1,Puma_2,Puma_3,kswiss_1,kswiss_2,kswiss_3]


for brand in products {
    do {
        let order = try brand.orderCustomer(sizeType: brand.productsize)
        print(order)
    } catch ErrorOrder.noSizeAV {
        print("Itmes can not be delivered due to no Size AV")
    } catch ErrorOrder.outOfStouck {
        print("Itmes can not be dlivered due to out Of Stouck")
    }
}
//Dictionery&set
let firstGroup: Set = [niki_1.price,niki_2.price,niki_3.price]
let secoundGroup: Set = [addias_1.price,addias_2.price,addias_3.price]
let thirdGroup: Set = [ Puma_1.price, Puma_2.price, Puma_3.price]
let fourthGroup: Set = [kswiss_1.price,kswiss_2.price,kswiss_3.price]


print("---------------------------")
print("Sales for the first group : ")
for sale in firstGroup {
    print("\(sale) SAR")
}

print("---------------------------")
print("Sales for Both the first group and second group : ")
for sale in firstGroup.union(secoundGroup) {
    print("\(sale) SAR")
}


print("---------------------------")
print(" The comman Sales between the second group and thrid group : ")
for sale in secoundGroup.intersection(thirdGroup) {
    print("\(sale) SAR")
}

print("---------------------------")
print(" The Sales for the second group but thrid group does not have: ")

for sale in thirdGroup.subtracting(fourthGroup) {
    print("\(sale) SAR")
}


print("---------------------------")
print("Here is the prices for all groups")
print("The prices for the first group \(firstGroup)")
print("The prices for the second group \(secoundGroup)")
print("The prices for the third group \(thirdGroup)")
print("The prices for the fourth group \(fourthGroup)")


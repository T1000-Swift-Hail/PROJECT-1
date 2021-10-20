import UIKit

//Struct for the Product
struct Product {
    let name: String
    let price: Double
    let quntity: Int
    
    init(name: String, price: Int, quntity: Int) {
        self.name = name
        self.price = Double(price)
        self.quntity = quntity
    }
}
//protocol for the user
protocol User {
    var userName: String { get }
    var firstName: String { get }
    var lastName: String { get }
    var Age:Int { get }
    var phoneNumber: String { get }
}
//class for the Patient
class Patient: User {
    var userName: String
    var firstName: String
    var lastName: String
    var Age: Int
    var phoneNumber: String
    var shoppingCart: [Product]
    init(userName: String, firstName: String, lastName: String, Age : Int, phoneNumber : String, shoppingCart: [Product]){
        self.firstName = firstName
        self.userName = userName
        self.lastName = lastName
        self.Age = Age
        self.phoneNumber = phoneNumber
        self.shoppingCart = shoppingCart
    }
    
//function for Add Products to the shopping cart .
    func addShoppingCart (product: Product){
        shoppingCart.append(product)
        print("\(firstName) Added \(product.name) to shopping cart")
    }
    
//function for List the products in my shopping cart.
    func viewShoppingCartItems(){
        print("\(firstName) Shopping cart item: ")
        for item in shoppingCart {
            print(item.name)
        }
    }

    
//function Search for Product
    func searchForProdcut(productName: String){
        if ArrayStoreProduct.contains(where: {$0.name == productName}) {
            print("This is \(productName) product found ")
        }
        else {
            print("This is Product not found")
        }
    }
}



print("Welcome to our pharmacy")
print()

//Array for product and function for print browse product
let ArrayStoreProduct: [Product] = [
    Product(name: "Syrup", price: 23, quntity: 12),
    Product(name: "Capsules", price: 12, quntity: 22),
    Product(name: "Pills", price: 35, quntity: 32),
    Product(name: "Eye drops", price: 20, quntity: 10),
    Product(name: "Bandage", price: 5, quntity: 23),]

func getAllProducts() {
    for AllProduct in ArrayStoreProduct {
        print("name \(AllProduct.name), price \(AllProduct.price.description), quntity \(AllProduct.quntity.description)")
    }
}
print("Our list of products : ")
getAllProducts() 
print()


var patient1 = Patient(userName: "Ahmad2", firstName: "Ahmad", lastName: "Khalid", Age: 23, phoneNumber: "0562849244", shoppingCart: [])
var patient2 = Patient(userName: "Fasiaal", firstName: "Faisal", lastName: "Abdullah", Age: 18, phoneNumber: "0562842365", shoppingCart: [])
var patient3 = Patient(userName: "Saleh6", firstName: "Saleh", lastName: "Bander", Age: 34, phoneNumber: "0532649244", shoppingCart: [])
var patient4 = Patient(userName: "Reem10", firstName: "Reem", lastName: "Bader", Age: 19, phoneNumber: "0562755324", shoppingCart: [])
var patient5 = Patient(userName: "Sara1", firstName: "Sara", lastName: "Nasser", Age: 29, phoneNumber: "0562744324", shoppingCart: [])


//Print functions

patient1.searchForProdcut(productName: "Syrup")
patient1.addShoppingCart(product: ArrayStoreProduct[0])
patient1.addShoppingCart(product: ArrayStoreProduct[2])
patient1.viewShoppingCartItems()
print()
patient2.addShoppingCart(product: ArrayStoreProduct[3])
patient2.viewShoppingCartItems()
print()
patient3.searchForProdcut(productName: "Tablets")
patient3.addShoppingCart(product: ArrayStoreProduct[2])
patient3.addShoppingCart(product: ArrayStoreProduct[1])
patient3.viewShoppingCartItems()
print()
patient4.searchForProdcut(productName: "Bandage")
patient4.addShoppingCart(product: ArrayStoreProduct[2])
patient4.addShoppingCart(product: ArrayStoreProduct[3])
patient4.viewShoppingCartItems()
print()
patient5.addShoppingCart(product: ArrayStoreProduct[0])
patient5.addShoppingCart(product: ArrayStoreProduct[1])
patient5.addShoppingCart(product: ArrayStoreProduct[4])
patient5.viewShoppingCartItems()
print()


//Sets: Ahmed and Faisal's purchases, and used the Union, Intersection, and Subtracting

var ahmedPurchases: Set = ["Syrup","Pills"]
var faisalPurchases: Set = ["Eye drops","Pills","Bandage"]

var purchasesUnion = ahmedPurchases.union(faisalPurchases)
print("All products purchased: ")
for purchasesUnions in purchasesUnion {
    print(purchasesUnions)
}
print()
var purchasesIntersection = ahmedPurchases.intersection(faisalPurchases)
print("All products purchased both: ")
for purchasesIntersections in purchasesIntersection {
    print(purchasesIntersections)
}
print()
var purchaSubtracting = faisalPurchases.subtracting(ahmedPurchases)
print("Products that Faisal purchased, but Ahmed did not purchased : ")
for purchaSubtractings in purchaSubtracting {
    print(purchaSubtractings)
}
print()


//Class for pharmacist

class pharmacist: User {
    var userName: String
    var firstName: String
    var lastName: String
    var Age: Int
    var phoneNumber: String
    var certificate: Bool
    
    init(userName:String, firstName:String, lastName:String, Age:Int, phoneNumber:String, certificate:Bool){
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.Age = Age
        self.phoneNumber = phoneNumber
        self.certificate = certificate
    }
    
//Function for the Pharmacist to print his description
    func printPharmacistDes() {
        print("The Username of Pharmacist is :\(userName), his name \(firstName) \(lastName),his number: \(phoneNumber), does he have a certificate? \(certificate) ")
    }
}

var pharmacist1 = pharmacist(userName: "Nasser3", firstName: "Nasser", lastName: "Mohammed", Age: 30, phoneNumber: "0562375344", certificate:true )

pharmacist1.printPharmacistDes()
print()

//Dictionaries for products and their prices, used to update the price, delete a product, and add a new product
var pharmacyProduct = ["Syrup": 23 , "Capsules": 12 , "Pills": 35 , "Eye drops": 20 , "Bandage": 5]
pharmacyProduct["Eye drops"] = 40
pharmacyProduct["Pills"] = nil
pharmacyProduct["Tablets"] = 10

print("Product in the pharmacy: ")
for (key,value) in pharmacyProduct {
    print (key,value)
}
print()

//Dictionaries of products and the number of times it has been sold, and used the Closures to print products from the top selling to least selling
var salesProduct = ["Syrup": 5 , "Capsules": 14 , "Pills": 20 , "Eye drops": 1 , "Bandage": 11]

let SortedPharmacy = salesProduct.sorted {
    return $0.value > $1.value
}

print("Pharmacy products from top selling to least selling:")
for (key , value) in SortedPharmacy {
    print (key , value)
}

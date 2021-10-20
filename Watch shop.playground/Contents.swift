import UIKit
//THIS protocol OF USER
protocol User {
    var UserName : String {get}
    var UserPassword : Int {get}
}

// THis is class Manager
class Manager : User {
    var UserName: String
    var UserPassword: Int
    init(UserName:String,UserPassword:Int){
        self.UserName=UserName
        self.UserPassword=UserPassword
    }
    
}
// THis is shoppung Error
enum shoppungError:Error{
    case PurchaseVolume
    case purchaseQuantity(Int)
}
// struct of Customer  User
struct Customer : User {
    var UserName: String
    var UserPassword: Int
    var FirstName : String
    var MiddleName : String
    var LastName : String
    var Age : Int
    var Address : String
    var shoppingCart :[Watch]
    
    
func buyWatch () {
    print("Dear Customer Welcome In WatchStore")
    print("")
    print("Now We Buying Watch")
    print("")
    for Watch in shoppingCart {
        print("The Name of watch is \(Watch.name),The Description is \(Watch.description), The Price of Watch \(Watch.price) , The Quantity of watch is \(Watch.quantity), The Category is \(Watch.category)")
        
    }
}
}

//extension of Customer

extension Customer {
    func describeCustomer () {
        print("The Customer name is \(FirstName), The middle name is \(MiddleName), The last name \(LastName) The age old \(Age), The address \(Address)")
    }
        }
// Type Watch Store department
enum TypeWatch{
    case SamsungWatch
    case RolexWatches
    case AppleWaches
    case CasioWatches
}
// struct of watch

struct Watch {
  var name : String
  var description : String
  var price : Int
  var quantity : Int
  var category : TypeWatch
    var sectionWatch : [Int:String]
    
    
  func getCategory() -> TypeWatch{
    switch category {
    case .SamsungWatch :
      print("Watch3", "Watch2")
      return .SamsungWatch
    case .RolexWatches :
      print("Rolex1" , "Rolex3")
      return .RolexWatches
    case .AppleWaches :
      print("AppleWach1", "AppleWach2", "AppleWach3" )
      return .AppleWaches
    case .CasioWatches:
        print("Casio1","Casio2" )
        return .CasioWatches
    }
  }

    static func piintNationalID <T,U> (a:T , b:U ) -> (T,U){
        return (a,b)
    }
  
    
func describeWatch() {

 print("The Watch name is \(name) , The description of watch \(description) , The price \(price) SR , The quantity is \(quantity) , The category is \(category) , THe section is \(sectionWatch) ")
}
    
    //Func to Shopping Cost
func ShoppingCost(Volume: Int, Quantity: Int) throws -> String {
    let biggestWetchesVolume = 5
    let biggestWetchQuantity = 3
    if Volume > biggestWetchesVolume {
        throw shoppungError.PurchaseVolume
    }
    guard Quantity <= biggestWetchesVolume else {
        throw shoppungError.purchaseQuantity(Quantity - biggestWetchQuantity )
    }
    print("")
    print("**********************************************")
    print("")
    print("Usen Dictionry")
    print(watch1.sectionWatch)
    print(watch2.sectionWatch)
    print(watch3.sectionWatch)
    print(watch4.sectionWatch)
    print(watch5.sectionWatch)
    print(watch6.sectionWatch)
    print(watch7.sectionWatch)
    print(watch8.sectionWatch)
    print(watch9.sectionWatch)

    print("")
    print("**********************************************")
    print("")
    return "The Shopping is Done the Cost will be: \(950) SAR"
  }
}
// Class to  Prand
class prand {
  var name : String = ""
  var WatchName : [Watch] = []
  func describwaches(product:[Watch] ) {
    for shoppp in WatchName {
      shoppp.describeWatch()
    }
  }
    func removeProduct(product:[Watch] , needtoremove : Watch) -> Int {
        for (index , watch) in product.enumerated(){
            if watch.name == needtoremove.name{
                return index
            }
        }
        return -1
    }
}
 //Production

let watch1 = Watch(name: "AppleWach3", description: "smart watch", price: 850, quantity: 7, category: .AppleWaches,sectionWatch: [4:"AP"])

let watch2 = Watch(name: "AppleWach1", description: "smart watch", price: 750, quantity: 8, category: .AppleWaches,sectionWatch: [5:"AP"])
let watch3 = Watch(name: "AppleWach1", description: "smart watch", price: 650, quantity: 8, category: .AppleWaches,sectionWatch: [3:"AP"])
    
let watch4 = Watch(name: "Watch3", description: "smart Watch", price: 750, quantity: 9, category: .SamsungWatch ,sectionWatch: [7:"SM"] )
let watch5 = Watch(name: "Watch2", description: "smart Watch", price: 450, quantity: 6, category: .SamsungWatch ,sectionWatch: [6:"SM"] )
let watch6 = Watch(name: "Casio2", description: "electroinc Watch", price: 360, quantity: 3, category: .CasioWatches , sectionWatch: [8:"CA"])
    let watch7 = Watch(name: "Casio1", description: "electroinc Watch", price: 350, quantity: 3, category: .CasioWatches , sectionWatch: [9:"CA"])
let watch8 = Watch(name: "Rolex1", description: "electroinc Watch", price: 1250, quantity: 3, category: .CasioWatches , sectionWatch: [10:"RO"])
let watch9 = Watch(name: "Rolex2", description: "electroinc Watch", price: 1200, quantity: 3, category: .CasioWatches , sectionWatch: [11:"RO"])
print("")
print("**********************************************")
print("")

//Customer Details and Shopping Watches
print("Customer Details and Shopping Watches")
print("")
    var customer1 = Customer(UserName: "fahd25", UserPassword: 3456786, FirstName: "Fahad", MiddleName: "kaled", LastName: "Fahad", Age: 30, Address: "Gadah", shoppingCart:[watch1])
customer1.describeCustomer()
customer1.buyWatch()
print("")
print("**********************************************")
print("")
var customer2 = Customer(UserName: "mahamed32", UserPassword: 3452678, FirstName: "mahamed", MiddleName: "ibreham", LastName: "Alanzy", Age: 34, Address: "alshmley", shoppingCart: [watch3])
customer2.describeCustomer()
customer2.buyWatch()
print("")
print("**********************************************")
print("")

var customer3 = Customer(UserName: "hmad32", UserPassword: 4562366, FirstName: "hmad", MiddleName: "abdalah", LastName: "altmamy", Age: 28, Address: "HAIL", shoppingCart: [watch8])
customer3.describeCustomer()
customer3.buyWatch()
print("")
print("**********************************************")
print("")


let prandes = prand()
prandes.name = "watch shoop"
var Watchshopp = [watch1,watch2,watch3,watch4,watch5,watch6,watch7,watch8,watch9]
prandes.WatchName.append(contentsOf:Watchshopp)
print(prandes.name)

//Way to Remove Watch2
let index = prandes.removeProduct(product: Watchshopp, needtoremove: watch2)
Watchshopp.remove(at: index)
prandes.describwaches(product: Watchshopp)




do {
  let cost = try watch2.ShoppingCost(Volume: 5, Quantity:3)
  print(cost)
} catch shoppungError.purchaseQuantity {
  print("ERORR! Dear Check The Quantity")
} catch shoppungError.PurchaseVolume {
  print("ERORR! Dear Check The Volume")
} catch {
  print("Unown Error: \(error)")
}

print("")
print("*******************************************")
print("")
print("The Nation ID of Customers Who Buy Watch ......")
let NationlID = Watch.piintNationalID(a: "Fahad", b: 1088766326)
print(NationlID)
let NationlID2 = Watch.piintNationalID(a: "Mahamed", b: 10837675645)
print(NationlID2)
let NationlID3 = Watch.piintNationalID(a: "Hmad", b: 10342526754)
print(NationlID3)
print("")

print("Thanks For Shopping .....")



    

    



      

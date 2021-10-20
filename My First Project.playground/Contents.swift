import Darwin

    
enum ShopLogin : String {
    case one = "customer"
    case two = "Manager"
}

protocol User {
    var name:String { get }
    var Email:String { get }
    var password: Int { get }
}

class Printer {
    var name : String
    var price : Int
    var description: String
    init(name: String, price:Int, description: String) {
        self.name = name
        self.price = price
        self.description = description
    }
}

class UserProfile : User {
    var name:String
    var Email:String
    var password: Int
    
    init(name: String, Email:String, password:Int){
        self.Email = Email
        self.name = name
        self.password = password
        
        arrPrinters.append(Printer.init(name: "epson l3150", price: 786, description: "A smart and compact design ensures a very small footprint"))
        arrPrinters.append(Printer.init(name: "HP OfficeJet Pro 9015e", price: 1150, description: "has a good value for small offices"))
        arrPrinters.append(Printer.init(name: "Brother HL-L6400DW", price: 1350, description: "fast, high-volume monochrome laser printer "))
        arrPrinters.append(Printer.init(name: "Lexmark MC2535adwe", price: 1850, description: "fast color laser all-in-one printer"))
    }
    
    var arrPrinters: Array<Printer> = []
    
    func didSelectUserData(name:String, Email:String) {
        

    }
    
    
    func buyPaper(paper : Paper){
        print("\(name) is buying \(paper.name)")
    }
    
    func buyInk(ink : Inks){
        print("\(name) is buying \(ink.name)")
    }
    
    
    func showPrinterList(){
        print("\(name) has the following printers :")
        for printer in arrPrinters{
            print("\(printer.name) , \(printer.description)")
        }
    }
    
}



class Paper : Printer {
     
    var type: String = ""
    func printDescrption() {
        print(description)
    }
}

var papertype: Paper

class Inks : Printer {
    var color: String = ""
}

let storeName = "Printers Store"
let storeDescrption = "A store for printers, inks and papers "
print(storeName)
print(storeDescrption)


let printer1 = Printer (name: " Epson EcoTank ET-7750", price:700, description: "Can handle A3/tabloid size media"  )
let printer2 = Printer (name: "Canon PIXMA TS5320", price: 1500, description: "High-capacity cartridge options")
let printer3 = Printer(name: "HP DeskJet 2220", price: 350, description: "Printer price is very inexpensive")

let ink1 = Inks(name: "espson DAISY INKS ", price: 300, description: " reliable printing without compromise.")
let ink2 = Inks(name: "HP Red Generic Inkjet ink", price: 100, description: "")
let ink3 = Inks(name: "Epson T46Y", price: 150, description: "suit A2/17-inch printing")

let paper1 = Paper(name: "Gloss coated paper", price: 50, description: "it has a high shine")
let paper2 = Paper(name: "Matt paper", price: 30, description: "perfect for reports")
let paper3 = Paper(name: "Uncoated paper", price: 60, description: "excellent for ink receptivity")

let Ahmed = UserProfile(name: "Ahmed", Email: "ahmed4352@gmail.com", password: 123456645)
let Ali = UserProfile(name: "Ali", Email: "ali03@gmail.com", password: 1223343545)
let Saad = UserProfile(name: "Saad", Email: "saadabdullah@gmail.com", password: 08392810947)
let Wafa = UserProfile(name: "Wafe", Email: "wafamahoud@gmail.com", password: 1439048535)
let Bader = UserProfile(name: "Bader", Email: "baderalamri@gmail.com", password: 14324232325)

//argument passed to call that takes no arguments//
Ahmed.buyInk(ink: ink1)
Ahmed.buyPaper(paper: paper1)
Ali.buyInk(ink: ink2)
Saad.showPrinterList()
Wafa.buyPaper(paper: paper3)
Ali.showPrinterList()
Bader.showPrinterList()



var ourCustomers = [Ali, Ahmed,Saad, Wafa, Bader]
print("LIST OF OUR CUSTOMERS :")
for customer in ourCustomers {
    print(customer.name)
}


func completeToCheckout(msg:String = "checkout to complete order"){
    
 print("checkout to complete order")
    
}
completeToCheckout(msg: "complete your oder")


//optional for getting the receipt

var getReceiptAfterCompleteOrder : String?
print(getReceiptAfterCompleteOrder ?? "default value")
87
getReceiptAfterCompleteOrder = "Complete order"

if getReceiptAfterCompleteOrder == nil {
    print("payment required")
}else{
    
    
    print("finish order")
    print(getReceiptAfterCompleteOrder!)
}

let printer = Paper(name: "Epson L3110", price: 600, description: "Compact integrated tank design")
printer.printDescrption()

//extension from struct
class Product {
    var name: String = ""
    var descrption: String = ""
    
}
extension Product {
    private struct BestProduct{
        struct GetRecommend{}
        enum MostSelling{}
    }
}
enum MostSelling{
      case recommended, bestSeller
}


//set

   var customerOrder1 = Set(["Epson", "ink T6731", "glossy paper"])
   customerOrder1.insert("ink T6736")
   customerOrder1.remove("ink T6731")

print("CustpmerOrder1:")
for customerOrder in customerOrder1 {
  print(customerOrder)
}

var password = 8
if (password < 8 ) {
    print("it is less than 8 numbers")
} else if (password >= 8) {
    print("right password")

}

struct ProductDelievery{
    let orderArrival:String
    let delieveyProblem: String
    let customer : UserProfile
    
    func doDelivery(){
        print("deliver for \(customer.name) is \(orderArrival) \(delieveyProblem)")
    }
}
//what to do to just print one delieveryStatus//

let productDelievery1 = ProductDelievery(orderArrival:  "arrived", delieveyProblem: "no problem",customer: Saad)

productDelievery1.doDelivery()
let productDelievery2 = ProductDelievery(orderArrival: "delay", delieveyProblem: "there is a problem", customer: Ali)
productDelievery2.doDelivery()



//error handling
enum adressError :Error {
    case invalidlocation
    case wrongLocation
}
func writeAdress(city:String,streetName:String) throws ->String {
    
    if city == "" {
        throw adressError.wrongLocation
    }
    return "True Location"
}

do {
    let result = try writeAdress(city: "", streetName: "Abdullah St.")
    print(result)
} catch adressError.invalidlocation {
    print("invalid Location")
} catch adressError.wrongLocation {
    print("wrong location")
}


// cumputer property

class OrderCounter {
    var totalOrdersMonthly: Int = 10 {
    willSet {
        print("About to set totalOrder to \(newValue)")
    }
    didSet {
        if totalOrdersMonthly > oldValue {
            print("Added \(oldValue) orders")
        }
    }
    }
    
}
let orderCounter = OrderCounter()
orderCounter.totalOrdersMonthly = 50



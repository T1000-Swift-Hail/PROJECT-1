import Foundation


print("We are here to serve you to request an ambulance to transport you wherever you are \n \n")
 
print("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")

protocol  ambulanceOnTheWay {
    
    
    var carAccident:String{get}
    var stadiumInjury:String{get}
    var emergency:String{get}
    var other:String{get}
    
}

enum LocationType {
    case outsideCity
    case insideCity
    
}

class carAccedent : Hashable{
    
    var name:String
    var id:Int
    var mobileNumber:Int
    var location :String
    var numberInjerd : Int
    var locationType : LocationType
    
    init(numberInjerd : Int , name:String, id:Int, mobileNumber:Int,location :String, locationType : LocationType){
        
        self.numberInjerd = numberInjerd
        self.name = name
        self.id = id
        self.mobileNumber = mobileNumber
        self.location = location
        self.locationType = locationType
        
    }
    
    func requestHelp () {
        switch locationType {
        case .insideCity :
            print("sending an helicopter")
            print("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
        case .outsideCity :
            print("sending a ambulance")
            print("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
            
        }
        
    }
    
    func requestDatainjerd (){
        print("requested data numberInjerd \(numberInjerd) name: \(name),  idCard: \(id), mobail number: \(mobileNumber), location: \(location) \n")
        
     }
    
    func requestDatadeths () {
        
        print("requested data numberInjerd: \(numberInjerd) name: \(name), idCard: \(id), mobail number: \(mobileNumber), location: \(location) \n" )
        
    }
    
    
    static func == (lhs: carAccedent, rhs: carAccedent) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        
    }
    
}


struct user {
    var id : Int
    var name : String
    var mobailNumber : Int
    var location : String
    
    
}


var faiz = user (id: 545690842, name: "faiz", mobailNumber: 0505050505, location: " hail_sababah")
var faris = user (id: 41402957, name: "faris", mobailNumber: 05333333, location: " makah")
var faisal = user (id: 50028630, name: "faisal", mobailNumber: 055555555, location: " jedah")
var fahad = user (id: 22079661, name: "fahd", mobailNumber: 0505050000, location: " hail_sharaf")
var ahmed = user (id: 22079661, name: "ahmed", mobailNumber: 0505050000, location: " hail_sharaf")
var redCrescent :carAccedent = carAccedent(numberInjerd: 2 , name: faiz.name, id:  faiz.id, mobileNumber: faiz.mobailNumber, location: faiz.location , locationType: .insideCity)
redCrescent.requestDatadeths()
redCrescent.requestHelp()
 
var redCrescent2 :carAccedent = carAccedent(numberInjerd: 4, name: faris.name , id:faris.id  , mobileNumber: faris.mobailNumber, location: faris.location, locationType: .outsideCity)
redCrescent2.requestDatadeths()
redCrescent2.requestHelp()
 
var redCrescent3 :carAccedent = carAccedent(numberInjerd: 0, name: faisal.name, id:  faisal.id, mobileNumber: faisal.mobailNumber, location: faisal.location, locationType: .outsideCity)
redCrescent3.requestDatadeths()
redCrescent3.requestHelp()
 
var redCrescent4 :carAccedent = carAccedent(numberInjerd: 1, name: fahad.name, id:  fahad.id, mobileNumber: fahad.mobailNumber, location: fahad.location, locationType: .outsideCity)
redCrescent4.requestDatadeths()
redCrescent4.requestHelp()
 
var  redCrescent5:carAccedent? = carAccedent(numberInjerd: 656 , name: ahmed.name, id:ahmed.id   , mobileNumber:  ahmed.mobailNumber, location: ahmed.location, locationType: .outsideCity)
redCrescent5?.requestDatadeths()
redCrescent5?.requestHelp()
 
 
var peopleOutside : Set<carAccedent> = [redCrescent4, redCrescent2]

var peopleInside : Set<carAccedent> = [redCrescent, redCrescent3]
 

print("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
print("pepole requeste help from outside city are : \n")

for person in peopleOutside {
    print(person.name)
    
}


print("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
print("pepole requeste help from inside city are : \n")

for person in peopleInside {
    print(person.name)
    
    
    
}

var helpRequests = [redCrescent, redCrescent2, redCrescent3, redCrescent4, redCrescent5]

print("list of people requeste help \n")
print("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")

for requester in helpRequests {
    print ("\( requester?.name ?? "") requested help in city \(requester?.location ?? "")\n")
    print("* * * * * * * * * * * * * * * * * * * * *")
    
}






















//Based on what you’ve learned until now , create a project of your choosing (impress us with your imagination) . This project must at least satisfy the following requirements :
//
//Use Optionals.
//Use conditionals.
//Use arrays.
//Use dictionaries .
//Use Sets.
//Use loops.
//Use functions that return an output .
//Use Generics .
//Use Closures.
//Use Structs.
//Use Classes with an initializer .
//Use some form of Error Handling .
//Use Protocols .
//Use extensions .
//Use a computed property .
//Example Project : An online Grocery Store :
//
//Overview : An online store that sells fruits to customers. This online store has 2 main users. The customer and the manager of the store . Each one of them should be able to do the following tasks for the store to function properly .
//
//As a customer I should be able to do the following :
//
//Browse Products .
//View the product info (summary, specs, price, quantity , etc.)
//Search for Products.
//Get recommendations for my next purchase based on my purchase history.
//Add Products to the shopping cart .
//Remove a product from the shopping cart.
//List the products in my shopping cart.
//Continue to checkout .
//Fill in my address for delivery.
//Get receipt of my purchases.
//Check delivery status .
//As a manager of the grocery store , I should be able to do the following :
//
//Add new products to the online store.
//Update a product info.
//Remove product from the online store.
//Get notified of out of stock products.
//Browse purchase history.
//View the total sales revenue.
//View the store net profits.
//View the most sold products on the store.
//Compute the tax with the product price.
//Check delivery status.
//Change delivery status .
//Usage :
//
//user
//
//To use this application , create a new user using the struct **** . Call the **** to receive a list of all the products . Call ***** to receive recommendations for your next purchase . Use ***** to add a product to the shopping cart . To list your products in shopping cart call **** . Etc.
//
//manager
//
//To use this application to manage your online store , create a new manager using the class **** . Call the **** to receive a list of all the products . Call ***** add new products and **** to update a product with the id . Use ***** to browse the sales history . Updating a delivery status is easy using the ****** . Etc.
//
//Now is the time to showcase your skills. You will have 4 days to complete the project . On Thursday, you will present to us what you have achieved.
//
//Note : the above is an example. We want you to impress us with your imaginations and grand projects .
//
//For your project. Edit this README.md file to include your own project name, overview, user stories, and usage.


 
 

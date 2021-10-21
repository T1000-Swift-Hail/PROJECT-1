import UIKit
import Darwin
import Foundation

// Consulation department ...
enum Consulation {
    case Architechture
    case CivilEngineerå
}
// The QuantityError ...
enum QuantityError : Error{
    case ordersIsRightPrice
    case orderslsLessThanPrice
}
enum ErrorUser: Error {
    case accountIsBlocked
}
// BrowseInterfacesDesign department ...
enum BrowseInterfacesDesign {
    case Villahouse
    case Studio
    case Apartment
}
//   InteriorWorkTypes department ...
enum InteriorWorkTypes {
    case Furniture
    case Painting
    case Lighting
}
// My protocol For Admin ...
protocol Admin {
    var name : String {get}
    var Email : String {get}
    var age : Int {get}
    var phonNumber : Int {get}
    var Address : String {get}
}
// The struct For Manager ...
struct Manager : Admin {
    var name: String ,Email: String , age: Int , phonNumber : Int , Address : String
    
    func AboutManager(){
        print("❖ Manager : the Responsible for administration  is : [\(name)], To Communication With hem :  E-mail : [ \(Email) ], And  PhonNumber : [ \(phonNumber)] " )
    }
}
// struct for employee "InterDesigner " in app ....
struct InteriorDesigner : Admin {
    var name: String ,Email: String , age: Int , phonNumber : Int , Address : String
    func AboutInteriorDesigner (){
        print("❖ Interior Designer : It is concerned with designing the interior and exterior spaces, adding pracical and safe creative touches, and providing the client with a providing the client with a clear picture of the final form of the  project. To Communication With hem : [\(name)],  E-mail : [ \(Email) ], And  PhonNumber : [ \(phonNumber)] ")
    }
    static func interiorDesigner<U>(creatDesign: U ,designAdvice : U ) -> [U] {
        return [creatDesign,designAdvice]
    }
}
// struct for user ...
struct User : Admin {
    var name: String ,Email: String , age: Int , phonNumber : Int , Address : String, isBlocked : Bool
    
    func FillInInformation() throws -> String {
        
        if !isBlocked {
            throw ErrorUser.accountIsBlocked
        } else {
            print("❖ My name is : \(name) , And my E-mail : \(Email) ,And my age : \(age) , I living in : \(Address)")
            return "go to home screen"
        }
    }
    func PriceOrderQuantity(price: Int) throws -> String {
        
        guard price >= 5000 else { throw QuantityError.orderslsLessThanPrice }
        return " \n Total account is : \(price) "
    }
}
// struct For Pages ..
struct Pages {
    var title : String
    var body : String
    var views : Int
    var order : Int
    var name : String
    var PassWord : String
    var comment : String
    
    // achavedd LogIn From PassWord ....
    func logIn(name : String , PassWord : String) -> Bool {
        guard self.PassWord == PassWord else { return false }
        return true
    }
    // allow for comment ....
    func Addcomment (comments : Pages){
        print ("➤ write your comment here : \(comments.comment)")
    }
    //    To check The views in pages ......
    func isPopular() -> Bool {
        return  views > 2000
    }
    //   To  Confirm the asking price. ....
    func countOfOrder() -> Bool{
        return order > 700
    }
}
class GeometricDesignModel : Hashable{

    var stylename : String
    var model : String
    var price : Int
    var classification : BrowseInterfacesDesign
    
    init(stylename : String , model : String , price : Int , classification : BrowseInterfacesDesign  ){
        self.stylename = stylename
        self.model = model
        self.price = price
        self.classification = classification
    }
//     user comperison the price between Model .....
    func comparisonModelPrice (price : Int){
        let romanianModelPrice = FirstDesign.price
        let classicModelPrice =  SecendDesign.price
        if romanianModelPrice > classicModelPrice {
            print("➤ romanian Model Price its more expensive in terms of cost than the classic Model Price ")
        }
        else {
            print ("➤ its price is reasonable compared to romanian Model Price")
        }
    }
    
    static func == (lhs: GeometricDesignModel, rhs: GeometricDesignModel) -> Bool {
        return lhs.stylename == rhs.stylename
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(stylename)
    }
}
// struct InteriorDesign
struct InteriorDesign {
    var name : String
    var classification : [InteriorWorkTypes]
    var type : String
    var number : Int
    
    func doService() {
        for designClassification in classification {
            switch designClassification {
            case .Painting :
                print("now painting the outside ..")
            case .Furniture :
                print("now doing Furniture ..")
            case .Lighting :
                print("now installing the lights !! ..")
            }
        }
    }
}
// extension .....
// some of type paints .....
extension InteriorDesign {
    func classificationofpaints (){
        print (" The name of paints is : \(name), and it`s from type : \(type) Number : \(number)")
    }
}
// The class for Expert ....
class Expert {
    var name : String
    var bio : String
    var experience : String
    var Assess : Int?
    var price : Double
    var tax :Double
    
    init(name : String , bio : String , experience : String , Assess : Int, price : Double , tax : Double ){
        self.name = name
        self.bio = bio
        self.experience = experience
        self.Assess = Assess
        self.price = price
        self.tax =  tax
    }
//     add assess for expert ...
    func AddNewAssess (){
        Assess! += 1
        
    }
//    you can inquire about Name of Expert ...
    func getName() -> String {
        return "Expert : \(name)"
    }
//    consultation and inquiry Price after tax
    func consultationPrice(){
        let taxPrice = ( price * tax) + price
        print("❖ You can get advice for a fee : \(taxPrice)")
    }
    
    func makeDesign(customer : User, payment : Double, consultationType : Consulation ) {
        //
        if payment < price*(1+tax) {
            print("payment is no enough")
        }
        else {
            print("➤ \(customer.name) is requesting a consultation of \(consultationType) ..")
            print( "➤ \(name) did your job successfuly for \(customer.name) for amount : \(Int(payment))")
        }
    }
    
}
//  The Extension from Expert .....
extension Expert {
    func describePerson(){
        
        print("❖ To communicate with : \(name) , specialty in : \(bio), \(experience), and  his rated : \(Assess ?? 0) ، and the Consultation subject to fees")
    }
}
// ⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅⑅

// Name Of app & overview about him ....
print ("→[ Home Design ] \n The Field of interior Design and  House Design Planning achieve customer satisfaction through project or in an innovative and modern way. \n With expert consulting services \n" )
// Informaition about ( Manager , Designer , Users )
print ("→ [ Informaition For Users] ")
let ManagerAct = Manager(name: "Khaild Saad", Email: "Khaild.565@DesignMang", age: 40, phonNumber: 0551559, Address: "23,FirstStreet")
// call Manager Information ....
ManagerAct.AboutManager()
print("")
let SaadDesigner = InteriorDesigner( name: "Saad Ail", Email: "Saad.Designer@Designer", age: 34, phonNumber: 053138, Address: "453,Dirct")
// call Designer Information ....
SaadDesigner.AboutInteriorDesigner()
print("")
print (" { To get a service frome the designer ....}\n")
// to get a design ......
let doingservice = InteriorDesigner.interiorDesigner(creatDesign : "(Click on the Design request section)" ,designAdvice : "(Click on the consulting request section)" )
print ("➤ If you want to get a design :\n \(doingservice[0])")
print ("➤ If you want to get a consulting :\n \(doingservice[1])")
print("")
// ............
let FirstUser = User(name: "Mohammd Naser", Email: "Mohammd1@User.com", age: 20, phonNumber: 96605593, Address: "5678,Street", isBlocked: false)
let SecandtUser = User(name: "Norah sami", Email: "NoNo34@User.com", age: 19, phonNumber: 96605056, Address: "Hail.342", isBlocked: true)
//  "ther is requird amount you must achavieded"
print(" { There is a requird amount The user must achavied }\n")
do {
    let Myorder = try FirstUser.PriceOrderQuantity(price: 5000)
    print("Your order is Acceptance: \(Myorder)")
}
catch QuantityError.ordersIsRightPrice {
    print("Your order is Acceptance!!")
}
catch QuantityError.orderslsLessThanPrice{
    print("The order is under The required amount")
}
print("")
print(" { Verify From All User , The Right To Regisster } \n")
let allUsers = [FirstUser,SecandtUser]
for allUser in allUsers {
    do {
        try allUser.FillInInformation()
    } catch ErrorUser.accountIsBlocked {
        print("➤ access is Blocked :" )
    }
}
print("")
print ("→ [ section for Informaition Pages]  \n")

var firstpages2 = Pages(title: "Home Desig ", body: "World engineering consultancy", views: 1500 , order: 500, name: "Mohammed ", PassWord : "MK565", comment: "abou my comparison...")
var firstpages = Pages(title: "Home Design", body: "World engineering consultancy", views: 1500 , order: 500, name: "Fahad ", PassWord : "YK09", comment: "a bout my Design...")


let reslut = firstpages2.logIn(name: "user", PassWord: "MK565")

print ("{ Allow To add a comment }")
firstpages.Addcomment(comments: firstpages)
firstpages2.Addcomment(comments: firstpages2)
print("")

print("❖ The number of Users's orders in [  \(firstpages2.title) ] page :\n [ \(firstpages.order) ]\n ")
// Cheek The Views In page by week ....
var viewsOfMonth = ["Firstweek" : 500 , "secandweek" : 800 , "Thirdweek" : 1400 , "Fourweek" : 1900]

// Update Value For Dictionaries .....
viewsOfMonth.updateValue(900, forKey: "secandweek")
print ("❖ { The Views For Page by Week }:")
for (key, value) in viewsOfMonth{
    
    print("➤ \(key), (\(value)) views ...")
}
print("\n")
print (" [ section for House Design Planning]  \n")



var FirstDesign = GeometricDesignModel(stylename: "Roman Style", model: "Romanian",price :13000 , classification: .Villahouse)
var SecendDesign = GeometricDesignModel(stylename: "Classic Style", model: "classic",price : 12000 , classification: .Studio)
var TherdDesign = GeometricDesignModel (stylename: "Modern Style", model: "Modern",price : 200000 , classification: .Apartment)
var FourDesign = GeometricDesignModel (stylename: "New Classic Style", model: "classic",price : 15000 , classification: .Apartment)
var FifthDesign = GeometricDesignModel (stylename: "Scandinavian Style", model: "provincial",price : 18000 , classification: .Studio)
var sixthDesign = GeometricDesignModel (stylename: "Traditional Style", model: "Modern",price : 22000 , classification: .Villahouse)
var seventhDesign = GeometricDesignModel (stylename: "Contemporary Style", model: "Modern",price : 14000 , classification: .Studio)
var eighthDesign = GeometricDesignModel (stylename: " Minimalist Style", model: "provincial",price : 20000 , classification: .Villahouse)
print("\n")
//price : Int
FirstDesign.comparisonModelPrice(price:500)
SecendDesign.comparisonModelPrice(price: 13000)


var classicStyle = GeometricDesignModel(stylename: "➤ Classic Style", model: "", price: 4898, classification: .Apartment)
var setStyleName: Set = [FirstDesign, SecendDesign, TherdDesign , FourDesign,FifthDesign ,sixthDesign ,seventhDesign,eighthDesign]
print("\n")
for style in setStyleName {
    print("➤ style is : [ \(style.stylename)] which is used in : [\(style.classification)] and for price : \(style.price)  ..SAR ")
}

print("\n")
print (" [ special section for Interior Design]  \n")

var myInteriorDesign = InteriorDesign(name: "Hous Sections", classification: [.Furniture, .Lighting] , type: "", number: 0)
var myOutsideWork = InteriorDesign(name: "Outside work", classification: [.Painting], type: "", number: 0)

myInteriorDesign.doService()
myOutsideWork.doService()

let PaintsForRoom = InteriorDesign (name: "ANTIQUE YELLOW", classification: [.Painting], type: "Jotun Earthy shades ", number: 3456)
let PaintsForInterfaces = InteriorDesign (name: "TIMELESS", classification: [.Painting], type: "Jotun Nostalgic Pastels", number: 85590)
let PaintsForGardens = InteriorDesign (name: "CITYSCAPE", classification: [.Painting], type: "Jotun Soft Neutrals ", number: 9067)
print("\n")
PaintsForRoom.classificationofpaints()
PaintsForInterfaces.classificationofpaints()
PaintsForGardens.classificationofpaints()

// get advice for a fee
print("\n")
print (" [  Section For Counseling ]  \n")

let taxsPrice = Expert(name: "", bio: "", experience: "", Assess: 7 , price: 200.0 , tax: 0.15)
taxsPrice.consultationPrice()

var architectExper = Expert(name: "Omer", bio: " architectExper Experience in designing prototypes and making modifications to them ", experience: "6 year", Assess: 7 , price: 200.0 , tax: 0.15)
var civilEngineer = Expert(name: "AbdAllh", bio: "civil Engineer Responsible for developing structural projects in accordance with international standards", experience: "12 year", Assess: 8 , price: 100.0 , tax: 0.15)
print ("\n")

architectExper.AddNewAssess()
architectExper.describePerson()
civilEngineer.describePerson()
print ("\n")
// User have consultation From Expert ....

civilEngineer.makeDesign(customer: FirstUser, payment: civilEngineer.price*1.15, consultationType: .CivilEngineerå)
architectExper.makeDesign(customer: SecandtUser, payment: architectExper.price*1.15, consultationType: .Architechture)

print ("\n")
// User can comparison From Expert ....
var ourServicesProvider = [civilEngineer, architectExper]

var ourServicesProvidersOrderedByLowest = ourServicesProvider.sorted(by: { a, b in
    return a.price < b.price
})
print("➤ Our services from lowest price to biggest >> chooose what you like :")
for servicerProvider in ourServicesProvidersOrderedByLowest {
    print("➤ \(servicerProvider.name) is charging \(servicerProvider.price) SAR for his services !")
}
architectExper.describePerson()

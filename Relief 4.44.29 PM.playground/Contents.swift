import UIKit
import Foundation
import Darwin
import CoreGraphics

let PROJECT_NAME = "Relief"
let PROJECT_DESC = "An application that serves the elderly"
print("Welcome to our application \(PROJECT_NAME)")
print(PROJECT_DESC)

//This project is based on serving the elderly who cannot find someone to support them or serve them, so this project was established for consultations, instructions and health education, as well as for ambulance in critical cases, just press Cole and the ambulance is done from the nearest hospital
enum Cities : String {
    
    case Hail
    case Riyadh
    case Abha
    case Bisha
    case Buraydah
    case Dammam
    case Diriyah
    case Dawadmi
    case Aljawf
    case Jeddah
    case Jizan
    case Jubail
    case KhamisMushayt
    case Khobar
    case Mecca
    case Medina
    case Najran
    case Sakakah
    case Taif
    case Tabuk
    case Yanbu
    
}
// Create a list of common diseases
enum PathologicalCase {
    
    case Diabetes
    case pressure
    case theHeat
    case clots
    case KidneyDialysis
    case Disability
    case ShortnessOfBreath
    case asthma
    case Suffocation
    case Spasm
    case Fever
}
// Create a list of services within the site to serve the patient in the time of emergency
enum services {
    case consultation
    case callAnAmbulance
    case HealthEducation
}
// Expected errors
enum ErrorCalling : Error {
    
    case badCall
    case errorData
    
}
// Write down the expected problems

enum TypeOfCalling {
    
    case by2g
    case by3g
    case noService
    
    
}
// I used the protocol To patient's personal information

protocol Person {
    
    var Name : String { get set}
    
    var Phone : Int { get}
    
    var Identity : Int {get}
    
    var age : Int {get}
    
    var City : Cities { get }
    
    var location : String? {get}
    
    var  bloodtype : String {get}
    
}
// Create a list of seniors by using the struct

struct OlderPeople : Person , Hashable {

    var Name: String
    
    var Phone: Int
    
    var Identity: Int
    
    var location: String?
    
    var City: Cities
    
    var age: Int
    
    var  bloodtype : String
    
    // func was used to print a sentence
    
    func login(){
        print("\(Name) has logged in , his age is \(age) from city \(City)")
    }
    
    //
    func callSOS(typeOfcall: TypeOfCalling,citys: Cities) throws -> String {
    
        print("Calling Now in city \(citys.rawValue)...")
        
        switch typeOfcall {
        case .by2g:

            print("Your Info is :\(Name),and also \(Phone) , also added \(Identity) , and put \(location ?? "no location") , and we also put \(age) , we add \(bloodtype)")
            
            print("Please White...")
            
            print("calling 997...")
            
            print("caling your relative...")
            
            print("The call is by 2g")
            
            return "=calling 997..."
        case .by3g:
            return "The call is by 2g "
        case .noService:
            throw ErrorCalling.badCall
        }
        
       // return "caling your relative..."
        
    }
    
    
}
// Create a child to serve young children who have no one to support them using the struct

struct Child : Person {
    
    
    var Name: String
    
    var Phone: Int
    
    var Identity: Int
    
    var age: Int
    
    var City: Cities
    
    var location: String?
    
    var fatherPhonenumber : String
    
    var  bloodtype : String

}
// Create a list of health status using classes
class HealthCondition {
    var Name: String
    
    var Phone: Int
    
    var Identity: Int
    
    var age: Int
    
    var City: Cities
    
    var location: String?
    
    var bloodtype: String
    
    init(Name: String ,Phone: Int ,Identity: Int ,age: Int,location: String ,City: Cities ,bloodtype: String) {
        self.Name = Name
        self.Phone = Phone
        self.Identity = Identity
        self.age = age
        self.City = City
        self.location = location
        self.bloodtype = bloodtype
    }
}
// We created sos and used it as an extension
extension String {
    var SOS: String {
        return "Calling SOS.."
    }
}
print("Ali".SOS)

// Use it for condition

let olederPepoleSOS = OlderPeople(Name: "Mohammed", Phone: 05555555, Identity: 109654432, location:"100999",City:.Hail, age : 20, bloodtype:"O")

do {
    let result = try olederPepoleSOS.callSOS(typeOfcall: .noService, citys: .Hail)
    print(result)
} catch ErrorCalling.badCall {
    print(" \(olederPepoleSOS.Name) did a Bad Call")
    
}

func speakLoud (txt : String) {
    print("Speaking loud \(txt) ....")
}
func OldPeaple<T>(Emergencycall: T,  Educationalcommunication: T) -> [T] {
return [Emergencycall, Educationalcommunication]
}

struct Patientinfo {
    var Name: String
    var Phone: Int
    var Identity: Int
    var age: Int
    var City: Cities
    var location: String?
    var fatherPhonenumber : String
    var  bloodtype : String


}


let ambulance = OldPeaple(Emergencycall:112, Educationalcommunication: 937)
print("to call emergency , please dial in : \(ambulance[0])")
print("to call Educationalcommunication , please dial in : \(ambulance[1])")

// We used the set to create a menu

var patient1 = OlderPeople(Name: "ahmed", Phone: 05432324, Identity: 1076543456, location:"alnegra", City:.Hail,age: 76, bloodtype: "O")

var patient2 = OlderPeople(Name: "hana", Phone: 349875, Identity: 767, location: "", City: .Riyadh, age: 40, bloodtype: "A")

var patient3 = OlderPeople(Name: "yahya", Phone: 349875, Identity: 767, location: "", City: .Hail, age: 76, bloodtype: "B")

var patient4 = OlderPeople(Name: "saad", Phone: 056688787, Identity: 177667886, location: "almasif", City: .Hail, age:50, bloodtype: "O-")
var patient5 = OlderPeople(Name: "hand", Phone: 0547644, Identity: 106564535, location: "aslam", City: .Jeddah, age: 80, bloodtype: "B")
var patient6 = OlderPeople(Name: "alias", Phone: 05555555, Identity: 1567786788, location: "rawaby", City: .Riyadh, age: 90, bloodtype: "O")

var patient7 = OlderPeople(Name: "Fahad", Phone: 0554367677, Identity: 21735765172, location: "aldahya", City: .Khobar, age: 45, bloodtype: "A")
var patient8 = OlderPeople(Name: "khalid", Phone: 0545656768, Identity: 2176565172, location: "alsalam", City: .Mecca, age: 66, bloodtype: "B")
var patient9 = OlderPeople(Name: "abdualah", Phone: 0537626755, Identity: 217358172, location: "brzan", City: .Tabuk, age: 70, bloodtype: "O")
var patient10 = OlderPeople(Name: "abdalgader", Phone: 0537876599, Identity: 217358172, location: "alazezyah", City: .Taif, age: 50, bloodtype: "A")


var patientsInHailOver40 : Set<OlderPeople> = [patient3 ,patient4 ,patient1,]
print("Our patiens over 40 and living Hail:")
for patient  in patientsInHailOver40 {
    print(patient.Name)
}


patient7.login()
patient3.login()
patient4.login()
try? patient6.callSOS(typeOfcall: .by3g, citys: .Khobar)
try? patient5.callSOS(typeOfcall: .by2g, citys: .Taif)
try? patient10.callSOS(typeOfcall: .noService, citys: .Hail)


var PatiensList = [patient5, patient3 ,patient1 , patient3 ,patient4,patient10 ,patient7,patient8, patient6]

print("Our Patiens Information: ")
for partienlist in PatiensList {
   
    print("\(partienlist.Name),\(partienlist.Phone),\(partienlist.bloodtype),\(partienlist.age),\(partienlist.Identity), \(partienlist.City),\(partienlist.location!)")

}

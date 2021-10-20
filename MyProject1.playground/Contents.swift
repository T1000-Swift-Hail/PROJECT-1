import UIKit


print("Welcome to our charity : Hail Charity \n ")

protocol Org {
    var name : String {get}
    var phoneNumber : Int {get}
    var contribution : Contribution {get}
    func donate()
    
    }
    
enum donateError: Error {
    case donateLow
}

enum DonationPackages : String {
    case SR500
    case SR1000
    case SR2000
}

enum Contribution {
    case SR10
    case SR20
    case SR30
    case SR40
    case SR50
    case SR60
    case SR70
    case SR80
    case SR90
    case SR100
}

class Donor : Org {
    var name: String
    
    var phoneNumber: Int
    
    var contribution: Contribution
   // let donationAmounts = [30, 20, 10, 60, 50, 40, 100, 90, 70, 80]
    
    var description : String {
        return "\(name) and his phone number is \(contribution)"
    }
    
    init(name: String, phoneNumber: Int, contribution: Contribution) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.contribution = contribution
    }
    func donate() {

        print("Thanks For Your Donate!")
        }
    
    
    
    func donateWithPacke( package : DonationPackages) {
        print("Donating \(package.rawValue)")
    }
    }
    

extension Donor {
    func receipt(payment: Int) throws -> String {
        guard(payment <= 2000) else {
            throw donateError.donateLow
        }
        return " \(name) requested a bill of \(payment) . \(name) Your Bill is Approved\n"
    }
}
    

var customer = Donor(name: "Bader", phoneNumber: 0532224576, contribution:.SR10)
do {
    let payment = try customer.receipt(payment: 1000)
    print(payment)
}

catch donateError.donateLow {
    print(" \(customer.name) There Is A Misstake with your donation ! Try Again\n")
}

catch {
    print("An unknown error occurred: \(error)")
}







struct Customer: Org, Hashable {
    var name: String
    
    var phoneNumber: Int
    
    var contribution: Contribution
    func information() {
        print("i Am \(name), my number is \(phoneNumber), and i donated with \(contribution)" )
    }
    func donate() {
        print(" \(name) Thank you For Your Donate! of \(contribution)\n")
    }
    
}
var person = Customer(name: "Abdullah", phoneNumber: 8789, contribution: .SR10)
person.donate()
var person2 = Customer(name: "Saleh", phoneNumber: 0532224576, contribution: .SR50)
person2.donate()


var person3 = Customer(name: "Sulaiman", phoneNumber: 0532224576, contribution: .SR30)
person3.donate()

var person4 = Customer(name: "Mohammed", phoneNumber: 0532224576, contribution: .SR20)
person4.donate()

var person5 = Customer(name: "Majed", phoneNumber: 0532224576, contribution: .SR100)
person5.donate()
var person6 = Customer(name: "Fahad", phoneNumber: 05647747743, contribution: .SR60)
person6.donate()
var person7 = Customer(name: "Ahmad", phoneNumber: 0573838837, contribution: .SR60)
person7.donate()
var person8 = Customer(name: "Rakan", phoneNumber: 0573728828, contribution: .SR40)
person8.donate()
var person9 = Customer(name: "Anas", phoneNumber: 0582882838, contribution: .SR100)
person9.donate()
var person10 = Customer(name: "Waled", phoneNumber: 05377388387, contribution: .SR70)
person10.donate()
print()

//var peopleDonatedSR20 : Set<Customer> = [person, person4]


//var coustmerOfHail1 = Customer(name: "Khalid", phoneNumber: 0400403043, contribution: .SR50)
//var coustmerOfHail2 = Customer(name: "Khalid", phoneNumber: 0400403043, contribution: .SR50)
//print("Union Contribution :")
var contributionA : Set = [person ,person2 , person3 , person4 , person5 ]

var contributionB : Set = [person6 ,person7 ,person8 , person9, person5]

var unionContribution = contributionA.union(contributionB)


var intersectionContribution = contributionA.intersection(contributionB)

var subtractingContribution = contributionA.subtracting(contributionB)
print("all people who made  Contributions :\n")

for commons in unionContribution {
    print("\(commons.name) did a contribution of \(commons.contribution)\n")
    
}

print("people who made the same contribution :\n")
for interset in intersectionContribution {
    print("\(interset.name) with contribution \(interset.contribution)\n")
}


//for commons in unionContribution {
//    print(commons)
//
//}
//print()
//var Contribution2A : Set = [person6.contribution,person10.contribution]
//
//var Contribution2B : Set = [person.contribution,person5.contribution]
//
//var intersectionContribution = Contribution2A.intersection(Contribution2B)
//
//for interset in intersectionContribution {
//    print(interset)
//}
//


//for people in peopleDonatedSR20 {
   // print()
//}


//
//struct CharityHail : Org , Hashable {
//    var name: String
//
//    var phoneNumber: Int
//
//    var contribution: Contribution
//    func informations() {
////        print("i Am \(name), my number is \(phoneNumber), and i donated with \(contribution)" )
//    }
//    func donate() {
//        print("Thanks For Your Donate!")
//    }
//}

   



print()

//print("Donation Amounts: ")

//let donationAmounts = [30, 20, 10, 60, 50, 40, 100, 90, 70, 80]
//func compare(i:Int, p: Int) -> Bool {
    //return i < p
//}

//let arrangement = donationAmounts.sorted(by: compare(i:p:))
//print(arrangement)




print("List of Top Donation: \n")
print()
//var d1 = "Suliman"
//var d2 = "Salem"
//var dontts = [d1,d2]
//print(dontts)
let list = ["1-Charitable Trust", "2-Insolvent", "3-Patients", ]

for lists in list {
    print(lists)
}


print("Associations Top Donation: \n")
print()

let EhsanAssociat = ["Charitable Trust": 50000000, "Insolvent": 90000000, "Patients": 30000000]
let EnsanAssociat = ["Charitable Trus":37000000, "Insolvent": 75000000, "Patients": 95000000]
print("Ehsan :")
for (key,value) in EhsanAssociat {
    print("\(key) \(value)")

}
print("Ensan :\n")
for (key,value) in EnsanAssociat {
    print("\(key) \(value)")
}
print()

let ehsanBranch: Set = ["Hail", "Khobar", "Jeddah", "Riyadh", "Qassim"]

let ensanBranch: Set = ["Rafha", "Tabuk", "Aljouf", "Riyadh", "Jeddah"]

let branches = ehsanBranch.union(ensanBranch)
let commonAssociate = ehsanBranch.intersection(ensanBranch)
let recomend = ehsanBranch.subtracting(ensanBranch)

print("All Branches for Ehsan And Ensan :\n")
for booth in branches {
    print(booth)
}
print()
print("Common Associate in branches :\n")
for common in commonAssociate {
    print(common)
}
print()
print("Suggestion for branches dos not exist :\n")
for suggest in recomend {
    print(suggest)
}
print()
print("Donations Status :")
if (EnsanAssociat.count > EnsanAssociat.count) {
    print("Ehsan Has The Highest Donations")
    
}
else if (EnsanAssociat.count > EhsanAssociat.count) {
    print("Ensan Has The Highest Donations")
}
else {
    print("Ensan Associat  &  Ehsan  They Have Same Donations")
}
//for (key,value) in donor {



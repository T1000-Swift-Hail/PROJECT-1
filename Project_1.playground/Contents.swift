
import UIKit

// Protocol user contains the following propries
protocol User{
    var firstName: String {get}
    var lastName: String {get}
    var email: String {get}
    var phoneNumber: Int{get}
}
// enum tickets_Type contains the following cases
enum Tickets_Type{
    case one_Way
    case round_Trip
    case multi_City
    case non_refundable
    case refundable
}
// enum service_Type contains the following cases
enum Service_Type{
    
    case business_Class
    case peremium_Class
    case first_class
    case economy_Class
    
}
// enum PaymentMethod contains the following cases
enum PaymentMethod{
    case visa
    case made
    case masterCard
}

// enum BookingError contains the following Case and return Error
enum BookingError: Error{
    case paymentError
    case noFlightAvariable
    case fullyBooked
}
// struct DifferentTickets contains the following proporites
struct DifferentTickets{
    var type: Tickets_Type
    var price: Int
    var paymentType: PaymentMethod
    
    var description: String{
        return "\nThis ticket is \(type), and the price is \(price) SR, and the payment way is \(paymentType)"
    }
    
}
// struct Ticket_Type, type of User has the following proporites and founcation
struct Ticket_Type: User{
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: Int
    var paymentType: PaymentMethod
    var tickets1 : [DifferentTickets]
    
    func ticketType(){
        for tickets1 in tickets1 {
            print("\n\(tickets1.type)")
        }
    }
}
// Manager class inhert from Protocol User & has the following information and funcation
class Manager: User{
    
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: Int
    var refernceId: Int
    
    
    init(firstName: String, lastName: String, email: String, phoneNumber: Int, refernceId: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.refernceId = refernceId
        
    }
    func viewPassengerInfo(){
        print("\nThe list of our consomer:")
        print("\nThe passenger name is \(firstName) \(lastName) and the email is \(email) and the phone is \(phoneNumber) and the ticket is \(refernceId)")
    }
    
}
// extension payment to print the payment method
extension Manager{
    func paymentInformation<T>(paymentMethod: T,paymentMethod1: T, paymentMethod2: T) -> (T,T,T){
        return (paymentMethod,paymentMethod1,paymentMethod2)
        
    }
}
//  struct Customer contains the following proporites and funactions that customer can do in our website
struct Customer{
    
    var leftSeats: Int
    let seats: Int
    var paymentType: PaymentMethod
    let tickets = ["Economy_Class", "Business_Class", "First_Class" , "Premium_Class"]
    
    
    
    func bookFlight1(avariableFlight: Int) throws -> String{
        guard avariableFlight > 0 else {
            throw BookingError.noFlightAvariable
        }
        
        return "\nselect your fight"
        
    }
    
    func paymentInformation(paymentType: PaymentMethod.Type) throws -> String{
        
        guard paymentType == PaymentMethod.self else{
            
            throw BookingError.paymentError
        }
        return "\nYour payment is approved."
        
    }
    
    func selectSeatsType(leftSeats: Int, seats:Int){
        print("\nThe seat type:")
        for ticket in tickets{
            print("\n \(ticket)")
        }
        
    }
    func bookeSeats(){
        if (leftSeats < seats ){
            print("\nThere is only \(leftSeats) avariable seats")}
        else{
            print("\nThere is no seats left!\n")
        }
    }
    
}

/*
 
 This section contains objects for DifferentTickets casea to print the tickets Type, and objects for Ticket_Type, Customer & manger.
 called All the functions and Handling error to get the output.

guard condation to check if paymentType is equal to visa if not will throw paymentError.

guard condation to check if avariableFlight more than 0, will display "select your flight" if not will throw noFlightAvariable error
 
*/
print("\nWelcom to our AirLine Reservation System...... ")
print("\n")

let ticket1 = DifferentTickets(type: .one_Way, price: 100,paymentType: .made)
let ticket2 = DifferentTickets(type: .round_Trip, price: 200, paymentType: .masterCard)
let ticket3 = DifferentTickets(type: .multi_City, price: 500, paymentType: .visa)
let ticket4 = DifferentTickets(type: .refundable, price: 100, paymentType: .visa)
let ticket5 = DifferentTickets(type: .non_refundable, price: 0, paymentType: .made)

print("\nThe Ticket Types Avairable In Our Websit are:")

let tic = Ticket_Type(firstName: "Hind", lastName: "Alharbi", email: "mrs.hind@yahoo.com", phoneNumber: 0542499415, paymentType:.made,tickets1: [ticket1,ticket2,ticket3,ticket4,ticket5])
tic.ticketType()

let book = Customer(leftSeats: 10, seats: 10, paymentType: .made)
let selectSeat = Customer(leftSeats: 10, seats: 150, paymentType: .masterCard)
book.selectSeatsType(leftSeats: 10, seats: 150)

let bookflight = Customer(leftSeats: 9, seats: 150, paymentType: .visa)
try? bookflight.bookFlight1(avariableFlight: 6)


let paymentType = Manager(firstName: "Hind", lastName: "Alharbi", email: "mrs.hind@yahoo.com", phoneNumber: 0542499415,refernceId: 1234567)
print("\nThe payment method:")
print(paymentType.paymentInformation(paymentMethod: "Visa", paymentMethod1: "Made", paymentMethod2: "MasterCard"))

let flight_number = Customer(leftSeats: 9, seats: 150, paymentType: .visa)

do{
    let result = try flight_number.bookFlight1(avariableFlight: 6)
    print(result)
}
catch BookingError.noFlightAvariable {
    print("\nSorry No Flight Avariable at this time!")
}

let firstUser = Customer(leftSeats: 9, seats: 150, paymentType: .visa)
do{
    let result = try firstUser.paymentInformation(paymentType: PaymentMethod.self)
    print(result)
}
catch BookingError.paymentError{
    print("\nYour payment method is not acceptable")
}
//
let metod1 = DifferentTickets(type: .one_Way, price: 100, paymentType: .made)
let metod2 = DifferentTickets(type: .round_Trip, price: 300, paymentType: .visa)
let metod3 = DifferentTickets(type: .multi_City, price: 700, paymentType: .masterCard)

print("\n\(metod1.description)")
print("\n\(metod2.description)")
print("\n\(metod3.description)")

let bookseat = Customer(leftSeats: 10, seats: 150, paymentType:.masterCard)
bookseat.bookeSeats()

let inform = Manager(firstName: "Aisha", lastName: "Alharbi", email: "mrs.hind@yahoo.com", phoneNumber: 0507668885, refernceId: 42453678)
inform.viewPassengerInfo()


var acceptablePayment: PaymentMethod?

func getPaymentMethod()-> PaymentMethod?{
    return nil
}

acceptablePayment = getPaymentMethod()

switch acceptablePayment ?? PaymentMethod.visa {
case .visa:
print("The payment method is visa.")
case .made:
print("The payment method is made.")
case .masterCard:
print("The payment method is master Card.")
}




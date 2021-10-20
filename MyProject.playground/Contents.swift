import UIKit
import Foundation


// Online Students Hostel


protocol Info {
    var name:String {get}
    var ID:Int {get}
    var Age:Int {get}
    
    func getRoom()
        
}

//Project Name
struct StudentsHostel {
   
    func hostelName <T> (name:T) -> (T) {
        return (name)
    }
    let hostelname = "Online Hail Students Hostel"
    func printName () {
        print("Welcome to \(hostelname) \nDear Student, Please fill the form to reserve a room! \n ")
    }
}

let Welcome = StudentsHostel()
Welcome.printName()

struct Room {
    var roomID: Int
    var size: String
    var availability: Availability
    var isDeleted:Bool
    

    func getisDeleted () -> Bool {
        return isDeleted
    }
    
    
    func getRoomInfo(arrayRooms: [Room]) {
        for (index, room) in arrayRooms.enumerated() {
            print("\(index) \(room.roomID)")
        }
    }
}



enum Availability: Error {
    case available
    case notAvailable
}

enum ReserveError:Error {
    case roomsOutOfCapacity
    case notAvailable
    case youAlradyTakenRoom
}

enum Citys {
    case hail
    case riyadh
    case jeddah
    case aljouf
    case dammam
    case HafrAlbatin
}

class HostelManager {
    
    var chosenRooms : Room
    var rooms: [Room]
    var name: String
    var ID: Int
    var Age: Int
    
    
    init(name:String , ID:Int , Age:Int , rooms:[Room], chosenRooms:Room) {
        self.name = name
        self.ID = ID
        self.Age = Age
        self.chosenRooms = chosenRooms
        self.rooms = rooms
        
    }
    
    static func studentsList() {
        let studentList  = ["Abdullah":20214390,"Sami":20217320,"Khalid":20216070,"Salem":20212031,"Hamad":20217274,"Ziad":20218692]
        for (key,value) in studentList {
            print(key,value)
            
        }
        
    }
    
    
}

// Here we are using extension to Handle Errors and to make sure students don't enter invalid values
extension HostelManager {
    func doReserveRooms (reserveCount: Int?, reservedRoom:Room, address: Citys) throws -> String {
      
        print("\(name) is requesting to reserve room \(reservedRoom.roomID), reserve result : \n")
        
        if reservedRoom.roomID != chosenRooms.roomID {
            throw ReserveError.youAlradyTakenRoom
        }
        
        guard (reserveCount == 1) else {
            throw ReserveError.roomsOutOfCapacity
        }
        
        if reservedRoom.availability != chosenRooms.availability {
            throw Availability.notAvailable
        }
        
        switch address {
        case .hail:
            throw ReserveError.notAvailable
        case .riyadh:
            self.rooms.insert(reservedRoom, at: 1)
            return "Your Room was Assigned Successfully\n"
        case .jeddah:
            self.rooms.insert(reservedRoom, at: 1)
            return "Your Room was Assigned Successfully\n"
        case .dammam:
            self.rooms.insert(reservedRoom, at: 1)
            return "Your Room was Assigned Successfully\n"
        case .aljouf:
            self.rooms.insert(reservedRoom, at: 1)
            return "Your Room was Assigned Successfully\n"
        case .HafrAlbatin:
            self.rooms.insert(reservedRoom, at: 1)
            return "Your Room was Assigned Successfully\n"
        }
        
    }
    
}
// Two functions for Student <get room info, get student description>
struct Student:Info {

    

    var name: String
    var ID: Int
    var Age: Int
    var reservedRooms: [Room]
    
    
    func getRoom() {
        for reservedRoom in reservedRooms {
            print("Your Room is \(reservedRoom.roomID) its size is : \(reservedRoom.size)")
        }
        
    }
    
    var StudentDescription:String {
        return "Student name: \(name), ID: \(ID), Age: \(Age) years old\n"
    }
    
    
}

let r1 = Room(roomID: 101, size: "Small 4*3", availability: .available, isDeleted: false)
let r2 = Room(roomID: 102, size: "Small 4*3", availability: .notAvailable, isDeleted: true)
let r3 = Room(roomID: 103, size: "Medium 4*6", availability: .available, isDeleted: false)
let r4 = Room(roomID: 104, size: "Medium 4*6", availability: .notAvailable, isDeleted: true)
let r5 = Room(roomID: 105, size: "Large 6*6", availability: .available, isDeleted: true)
let r6 = Room(roomID: 106, size: "Large 6*6", availability: .available, isDeleted: false)

let arrayRooms = [r1,r2,r3,r4,r5,r6]

var stud1 = HostelManager(name: "Abdullah", ID: 20214390, Age: 19, rooms: arrayRooms, chosenRooms: r1)
var stud2 = HostelManager(name: "Sami", ID: 20217320, Age: 20, rooms: arrayRooms, chosenRooms: r2 )
var stud3 = HostelManager(name: "Khalid", ID: 20216070, Age: 21, rooms: arrayRooms, chosenRooms: r3)
var stud4 = HostelManager(name: "Salem", ID: 20212031, Age: 19, rooms: arrayRooms, chosenRooms: r4)
var stud5 = HostelManager(name: "Hamad", ID: 20217274, Age: 20, rooms: arrayRooms, chosenRooms: r5)
var stud6 = HostelManager(name: "Ziad", ID: 20218692, Age: 19, rooms: arrayRooms, chosenRooms: r6)


// Here Student can fill the inputs to reserve a room, we tested all 3 possible results
do {
    let assign = try stud2.doReserveRooms(reserveCount: 1, reservedRoom: r2, address: .riyadh)
    print(assign)
}
catch ReserveError.roomsOutOfCapacity {
    print("Sorry we can't respond to your reserve\n")
}
catch ReserveError.notAvailable{
    print("You Are from Hail, Sorry can't accept your reserve\n")
}
catch ReserveError.youAlradyTakenRoom {
    print("you Already Taken Room\n")
}
catch {
    print("An unknown error occurred\n \(Error.self)")
}


do {
    let assign = try stud4.doReserveRooms(reserveCount: 1, reservedRoom: r3, address: .dammam)
    print(assign)
}
catch ReserveError.roomsOutOfCapacity {
    print("Sorry we can't respond to your reserve\n")
}
catch ReserveError.notAvailable{
    print("You Are from Hail, Sorry can't accept your reserve\n")
}
catch ReserveError.youAlradyTakenRoom {
    print("you Already Taken Room\n")
}
catch {
    print("An unknown error occurred\n \(Error.self)")
}


do {
    let assign = try stud5.doReserveRooms(reserveCount: 1, reservedRoom: r5, address: .hail)
    print(assign)
}
catch ReserveError.roomsOutOfCapacity {
    print("Sorry we can't respond to your reserve\n")
}
catch ReserveError.notAvailable{
    print("You Are from Hail, Sorry can't accept your reserve\n")
}
catch ReserveError.youAlradyTakenRoom {
    print("you Already Taken Room\n")
}
catch {
    print("An unknown error occurred\n \(Error.self)")
}



//var result = try? stud3.doReserveRooms(reserveCount: 1, reservedRoom: r3, address: .aljouf)


var room1 = Room(roomID: 101, size: "small 4*4\n", availability: .available,isDeleted: false)
var room2 = Room(roomID: 102, size: "small 4*4\n", availability: .notAvailable,isDeleted: true)
var room3 = Room(roomID: 103, size: "Medium 6*4\n", availability: .available,isDeleted: false)
var room4 = Room(roomID: 104, size: "Medium 6*4\n", availability: .notAvailable,isDeleted: true)
var room5 = Room(roomID: 105, size: "Large 6*6\n", availability: .available,isDeleted: true)
var room6 = Room(roomID: 106, size: "Large 6*6\n", availability: .available,isDeleted: false)

var student1 = Student(name: "Abdullah", ID: 20214390, Age: 19, reservedRooms: [room1])
var student2 = Student(name: "Sami", ID: 20217320, Age: 20, reservedRooms: [room2])
var student3 = Student(name: "Khalid", ID: 20216070, Age: 21, reservedRooms: [room3])
var student4 = Student(name: "Salem", ID: 20212031, Age: 19, reservedRooms: [room4])
var student5 = Student(name: "Hamad", ID: 20217274, Age: 20, reservedRooms: [room5])
var student6 = Student(name: "Ziad", ID: 20218692, Age: 19, reservedRooms: [room6])



//Commands Using by Manager :

//Here the manager can List All the Students Info(name&id)
print("List of Students in Hostel")
HostelManager.studentsList()
print()

// Adding Students Here :
var newStudent:Student = Student(name: "Faris", ID: 20213065, Age: 21, reservedRooms: [r6])
print(newStudent.StudentDescription)

print("Here we can check for room ID, for example : \n")
print(r2.roomID)

print("After Manager deletes a room he can check is it Deleted? : \n")
print(r2.isDeleted)
print()
//student2.getRoom()
//student1.StudentDescription()


//Commands can students use :
print("Student wants to see info about his room : \n")
student2.getRoom()

print("Print Student's Info : \n")
print (student3.StudentDescription)



//Comparing Ages between Two Buildings

var buildingA : Set = [student1.Age,student6.Age]
var buildingB : Set = [student5.Age,student3.Age]

var agesBetweenTwoBuilding = buildingA.union(buildingB)
var agesDiff = buildingA.subtracting(buildingB)
var agesCross = buildingA.intersection(buildingB)

print("Ages Between Two Buildings is :")

for unionages in agesBetweenTwoBuilding {
    print("\(unionages)\n")
}

print("Ages in Building A not common in Building B")

for subages in agesDiff {
    print("\(subages)")
}
print("cross Ages between Two Buildings : ")

for crossages in agesCross {
    print ("\(crossages)/n")
}


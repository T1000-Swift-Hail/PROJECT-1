import UIKit

// This is protocol of my App

protocol Person {
    var username : String {get}
    var passward : Int {get}

    func login(email : String, password:String) -> Bool
 
}

// The enum of App

enum userTypes {
    case member
    case moderator
}

// The enum of Error massages

enum massageError: Error {
    case LowTxt
    case MoreTxt
}

// The Application registration Rules and extension chat services

struct User : Person, Hashable {

    
    var email : String
    var username : String
    var passward : Int
    var userType : userTypes
    var thread : [Message]
       
    func login(email : String, password:String) -> Bool {
        print("\(username) is logged in !")
        return true
    
    }
    mutating func sendMessage (message : Message) {
        print("\(username) sent message  \(message.text)")
        thread.insert(message, at: 0)
    
    }
    static func getAllUsers(arrayOfUsers: [User]) {
        for user in arrayOfUsers {
    print("This is a \(user.username) and this is his email \(user.email)")
        }
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username  == rhs.username
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(username)

    }
}
 
extension User {
    func deleteMessage (message: Message) {
        
    }
}
    extension User {
        func SendVoise (message: Message) {
            
        }
    }
extension User {
    func SendVideo (message: Message) {
        
    }
}

// This is a services for massages

class Message {
    var users : [User]
    var text : String
    var isRead : Bool
    var sticker : String
    var voice : String
    var video : String
    
    init(users: [User], text : String, isRead : Bool, sticker:String, voice : String, video : String){
        
        self.users = users
        self.text = text
        self.isRead = isRead
        self.sticker = sticker
        self.voice = voice
        self.video = video
        
    }
}

 // The optional for users

var NowChatting : String?
NowChatting?.uppercased()
var personeChatting = NowChatting ?? "start chatting"
NowChatting = "Welcome to Nowchatting"
if let dontsend : String = NowChatting {

    print("\(dontsend)")
}

 // The dictionaries Exampel

var Theperson = ["txt":1 , "sticker":3 ]

var anotherPerson = ["txt":5 , "sticker":2 , "voice":1 ]

for ( String , Int ) in Theperson {
    print("Person Send \(String) \(Int)time")
}
for ( String , Int ) in anotherPerson {
    print("anotherPerson Send \(String) \(Int)time")

}

// The Sets Exampel for Ahmad and Sara in chatt

var Sara : Set<String> = ["massage", "voice", "sticker", "picture"]

var Ahmed : Set = ["massage", "voice", "video", "send location"]

var AhmedSend = Sara.subtracting(Ahmed)
for send in AhmedSend {
    print(send)
}

for Send in AhmedSend {
    print("see what i'm sending \(Send)")
}

// The Generics of chatt

struct Chat {
    var heightInChatt: Double = 1.5
    var weightInChatt: Double = 0
    
    
    func AppNowChatting <T,U>( a: T, b: U) -> (T , U) {
        return (a,b)
    }
    func VoiseNowChatting <T,U>( a: T, b: U) -> (T , U) {
        return (a,b)
        }
    func VideNowChatting <T,U>( a: T, b: U) -> (T , U) {
        return (a,b)
        }
    }

// The Error Handig and computed property of App

class Txt {
    var chat : Chat = Chat()
    var massage : Double {
        get {
            return (chat.weightInChatt/(chat.heightInChatt * chat.heightInChatt))
        }
    }
    func SpaceTxtMassage(count :Int ) throws -> String {
        
        if count < 10 {
            throw massageError.LowTxt
            
        }
        guard count <= 5 else { throw massageError.MoreTxt }
        return " Your txt is can not send "
        
    }
}

var myTxt = Txt()
var chat: Chat = Chat()
myTxt.chat = chat
print("My txt Massage: \(myTxt.massage)")

do {
    let txt = Txt()
    let Txt = try txt.SpaceTxtMassage(count: 6 )
    print( Txt )
} catch massageError.LowTxt {
    print("massaeg is low , you must send txt 5 massage or more")
}catch massageError.MoreTxt {
    print("massaeg is more , you must send txt 5 massage or less")
}

let chat_1 = Chat(heightInChatt: 30, weightInChatt: 40)
let FirstNowChatting = chat_1.AppNowChatting(a:"Hi", b:"welcom")
let chatViose = chat_1.VoiseNowChatting(a:"voise", b: "Hello")
let chatVide = chat_1.VideNowChatting(a:"vide", b: "Hi")

print("This now chatting in messege:\(FirstNowChatting)")

print("You can Send your voise in massage:\(chatViose)")

print("You can Send your voise in massage: \(chatVide)")

// The user can login in email and username and passward and he can member or moderator


var person = User (email: "Meemy1000@hotmail.com", username: "Meemy1000", passward: 3, userType: .member, thread: [] )

var Secondperson = User (email: "Faris2020@hotmail.com", username: "Faris2020", passward: 5 , userType: .member, thread: [] )

var Therdperson = User (email: "MOEINAmerica@hotmail.com", username: "MOEINAmerica", passward: 6 , userType:.moderator , thread: [] )

var Fordperson = User (email: "Moon7@hotmail.com", username: "Moon7", passward: 5 , userType: .member, thread: [] )

var Faifperson = User (email: "Fahadmam@hotmail.com", username: "Fahadmam", passward: 5 , userType: .member, thread: [] )

var Sixperson = User (email: "Salemsaad@hotmail.com", username: "Salemsaad", passward: 5 , userType: .member, thread: [] )

var Sevenperson = User (email: "Cool@hotmail.com", username: "Cool", passward: 3, userType: .member, thread: [] )

 // The person in massage can send text or sticker or voice or video

let message = Message(users:[] , text:"Hello", isRead:true, sticker: "send" , voice:"send", video: "send")
let message2 = Message(users:[] , text:"hii", isRead:true, sticker: "send" , voice:"send", video: "send")
let message3 = Message(users:[] , text:"how are you?", isRead:true, sticker: "send" , voice:"send", video: "send")
let message4 = Message(users:[] , text:"Iam fine , and how are you", isRead:true, sticker: "send" , voice:"send", video: "send")
let message5 = Message(users:[] , text:" Iam fine , Thanks ", isRead:true, sticker: "send" , voice:"send", video: "send")
let message6 = Message(users:[] , text:"Good Morning ", isRead:true, sticker: "send" , voice:"send", video: "send")

// The array of App in chatting

let array = [person , Secondperson , Therdperson , Fordperson , Faifperson , Sixperson , Sevenperson ]
User.getAllUsers(arrayOfUsers: array)

 // All user login in App NOW CHATTING

person.login (email: "Meemy1000@hotmail.com", password: "0000")
Secondperson.login (email: "Faris2020@hotmail.com", password: "0000")
Therdperson.login(email: "MOEINAmerica@hotmail.com" , password: "000")
Fordperson.login(email: "Moon7@hotmail.com" , password: "0000")
Faifperson.login(email: "Fahadmam@hotmail.com" , password: "0000")
Sixperson.login(email: "Salemsaad@hotmail.com" , password: "0000")

// This is Example for all project

person.sendMessage(message: message6 )

Secondperson.sendMessage(message: message )

Therdperson.sendMessage(message: message2 )

Fordperson.sendMessage(message: message3 )

Sevenperson.login(email: "Cool@hotmail.com" , password: "0000")

Faifperson.sendMessage(message: message4)

Sevenperson.sendMessage(message: message2)

Fordperson.sendMessage(message: message5)

person.deleteMessage (message: message )

Therdperson.SendVoise(message: message4)

Therdperson.SendVideo(message: message)

person.deleteMessage(message: message)

Sixperson.SendVoise(message: message)

Faifperson.SendVideo(message: message)


let chattersWhoSentVideo : Set<User> = [Therdperson, Faifperson]
let chattersWhoSentVoice : Set<User> = [Therdperson, Sixperson]
print("People who sent video && voice")

for chatter in chattersWhoSentVideo.union(chattersWhoSentVoice){
    print(chatter.username)
}

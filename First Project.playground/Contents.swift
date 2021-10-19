import UIKit

// This protocol of user
protocol User {
    var UserName : String {get}
    var UserPassword : Int {get}
}

// This is class of Manager
class Manager: User {
    
    var UserName: String
    var UserPassword: Int
    
    init(UserName:String,UserPassword:Int) {
        self.UserName = UserName
        self.UserPassword = UserPassword
    }
}
//This is Shopping Error
enum ShoppingError: Error {
    case PurchaseVolume
    case purchaseQuantity(Int)
}
//struct of Customer user
struct Customer:User {
    var UserName: String
    
    var UserPassword: Int
    
    var FirstName : String
    var MiddleName : String
    var LastName : String
    var Age : Int
    var Address : String
    var shoppingCart : [Book]
    
    
    func payBook() {
        for book in shoppingCart {
            print("The Name of book is \(book.name), The Description is \(book.description), The Price of Book \(book.price) The Quantity of Book is \(book.quantity), The Category is \(book.category)")
        }
    }
    
}
// Extension of Customer
extension Customer {
    func describeCustomer () {
        print("The Customer name is \(FirstName), The middle name is \(MiddleName), The last name \(LastName) The age old \(Age), The address \(Address)")
    }
}
// Type Bookstore department
enum TypeBookStore {
    case DramaBook
    case RomanticBook
    case HororrBook
}
//Structure of Book
struct Book {
    var name : String
    var description : String
    var price : Int
    var quantity : Int
    var category : TypeBookStore
    
    func getCategory() -> TypeBookStore {
        
        switch category {
        case .DramaBook :
            print("Hamlet", "Sadness")
            return .DramaBook
        case .RomanticBook :
            print("Romeo", "Lovers")
            return .RomanticBook
        case .HororrBook :
            print("Vampire", "Killers")
            return .HororrBook
            
        }
}
    
static func PrintNationalID<T,U>( a: T, b: U)  -> (T,U) {
    return (a,b)
    
}
func describeBooks() {
print("The Book Name is \(name), The desription of book is \(description), The price By SR \(price), The quantity is\(quantity), The category is\(category) ")
}
//Function to Shopping Cost
func ShoppingCost(Volume: Int, Quantity: Int) throws -> String {
    
    let biggestBooksVolume = 10
    
    let biggestBookQuantity = 6
    
    if Volume > biggestBooksVolume {
        throw ShoppingError.PurchaseVolume
    }
    guard Quantity <= biggestBookQuantity else { throw ShoppingError.purchaseQuantity(Quantity - biggestBookQuantity ) }
    return "The Shopping is Done the Cost will be: \(150) SAR"
    }
}
// class to story
class Story {
    var name : String = ""
    var BookName : [Book] = []
    
    //Function to Describe book
    func describeBooks(booksInlibary: [Book]){
        for library in booksInlibary {
            library.describeBooks()
        }
    }
    //Function of remove book
    func removeProduct(books: [Book],needToremove: Book) -> Int {

        for (index,book) in books.enumerated() {
            if book.name == needToremove.name {
                return index
            }
        }
        return -1
    }
}

// Production
let book = Book(name: "Hamlet", description: "Hero", price: 49, quantity: 11, category: .DramaBook)
let book_2 = Book(name: "Romeo", description: "Romantic", price: 43, quantity: 12, category: .RomanticBook)
let book_3 = Book(name: "Killers", description: "Hororr", price: 34, quantity: 22, category: .HororrBook)
let book_4 = Book(name: "Vampires", description: "Blooding", price: 52, quantity: 14, category: .HororrBook)
let book_5 = Book(name: "Lovers", description: "Romantic", price: 45, quantity: 11, category: .RomanticBook)
let book_6 = Book(name: "Sadness", description: "Tragedy", price: 32, quantity: 24, category: .DramaBook)

print(book_4.getCategory())

// Customer Details and Shopping Books
var customer1 = Customer(UserName: "Khaled32", UserPassword: 43322, FirstName: "Khaled", MiddleName: "Abdullah", LastName: "Aleid", Age: 31, Address: "Hail", shoppingCart: [book,book_2])
customer1.payBook()

let stories = Story()
stories.name = "Library"
var booksInlibary = [book, book_2, book_3, book_4, book_5, book_6]

stories.BookName.append(contentsOf: booksInlibary)

//Way  to Remove Book_6
let index = stories.removeProduct(books: booksInlibary, needToremove: book_6)
booksInlibary.remove(at: index)

stories.describeBooks(booksInlibary: booksInlibary)


do {
    
    let cost = try book.ShoppingCost(Volume: 10, Quantity:6)
    print(cost)
} catch ShoppingError.purchaseQuantity {
    print("ERORR! Dear Check The Quantity")
} catch ShoppingError.PurchaseVolume {
    print("ERORR! Dear Check The Volume")
} catch {
    print("Unown Error: \(error)")
}

let NationalID =  Book.PrintNationalID(a: "Khaled ", b: 10897676542)
print(NationalID)

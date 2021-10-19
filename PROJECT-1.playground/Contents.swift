print("Welcome to the free library.. let's read")


enum Categories {
    case Philosophy
    case kdisStories
    case history   }



struct Book : Hashable {
    
var name :String
var numberOfPages :Int
var bookReview: Int
var category : Categories

    func printDescription(name :String,numberOfPages :Int,bookReview: Int){
                          
    print("name of this book \(name) and number Of Pages\(numberOfPages)and book Review\(bookReview) ")
    }}
    
extension Book {
func describeBook(){
        
        print("name book\(name), numberOfPages\(numberOfPages), bookReview\(bookReview) ,category\(category)")
    }
}

var firstbook = Book ( name: "The Jungle Book", numberOfPages: 100, bookReview: 5 , category: .kdisStories)
var  secondbook = Book (name: "Apples Never Fall", numberOfPages: 150, bookReview: 4, category: .Philosophy)
var thirdbook = Book (name: "A People's History of the United States", numberOfPages: 300, bookReview:2 , category:.history)
var fourthbook = Book (name: "Sapiens: A Brief History of Humankind ", numberOfPages: 200, bookReview: 3, category: Categories.history)

firstbook.describeBook()
secondbook.describeBook()
thirdbook.describeBook()
fourthbook.describeBook()


var libraryBooks : [Book] = [firstbook, secondbook, thirdbook,fourthbook]
print("Books available in our library :")

for book in libraryBooks {
    print(book.name) }
print("Books ordered by number of pages")

var orderedBynum = libraryBooks.sorted(by: { book1, book2 in
    return book2.numberOfPages < book1.numberOfPages  })

for book in orderedBynum {
    print("\(book.name) : \(book.numberOfPages)")  }


print("Books ordered by Review Score")

var orderedByReview = libraryBooks.sorted(by: { book1, book2 in
    return book2.bookReview < book1.bookReview  })

for book in orderedByReview {
    print("\(book.name) score is  : \(book.bookReview)")  }


protocol Person {
    var name : String {get}
    var gender :String {get}  }
    

struct User : Person {
    var name: String
    var gender: String
    var age : Int
    var downloadlist : [Book]
    
    mutating func addBookToDownload(book : Book){
        print(" \(name) added  \(book.name) to download list")
        downloadlist.insert(book, at: 0) }
    
    mutating func removeBookToDownload(book : Book){
        print(" \(name)remove  \(book.name) to download list")
        downloadlist.insert(book, at: 0) }
    
    
    func showDownloadList(){
        for book in downloadlist {
            print("book to download \(book.name)")
        }}
    
    func searchForBook(bookName : String) -> Book? {
        
        let newBook =  libraryBooks.first(where:{ $0.name == bookName} )
        
        return newBook
    }  }
    

var mohammed = User(name: "mohammed alhethly", gender: "male", age:33 ,downloadlist: [])
mohammed.addBookToDownload(book: firstbook)
mohammed.addBookToDownload(book: thirdbook)
mohammed.showDownloadList()

if let foundBook = mohammed.searchForBook(bookName: "The Jungle Book") {
    print("Book \(foundBook.name) is found!")
    mohammed.addBookToDownload(book: foundBook)
} else {
    print("Not found...")
}

var amal = User(name: "amal alhrbi", gender: "famel", age:36 ,downloadlist: [])
amal.addBookToDownload(book: fourthbook)
amal.addBookToDownload(book: firstbook)
amal.showDownloadList()

var fahad = User(name: "fahad alkaik", gender:"male", age: 26, downloadlist: [])
fahad.addBookToDownload(book: secondbook)
fahad.addBookToDownload(book: firstbook)
fahad.addBookToDownload(book: fourthbook)
fahad.removeBookToDownload(book: secondbook)
fahad.showDownloadList()
 
var userAges = ["mohammed alhethly" :33,"amal alhrbi":36,"fahad alkaik":26]
for (key,valu) in userAges{
    print("user Age \(key)\(valu)")   }

class Manger {

    
    
    func showDownloadList(){
        
        
        
    var amalDownloadbook : Set <Book> = []
        for book in amal.downloadlist {
            amalDownloadbook.insert(book)
        }
        
    
        var fahadDownloadbook : Set <Book> = []
            for book in fahad.downloadlist {
                fahadDownloadbook.insert(book)
            }
        
        
        var mohammedDownloadboo : Set <Book> = []
            for book in mohammed.downloadlist {
                mohammedDownloadboo.insert(book)
            }
        
        
let allDownloadbook = amalDownloadbook.union(fahadDownloadbook)
print("All Books donwloaded by mohammed & Fahad")
for Download in allDownloadbook {
    print("Downloaded books \(Download.name)")
}
    }}

var manager = Manger()
manager.showDownloadList()


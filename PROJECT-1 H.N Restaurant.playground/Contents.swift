import UIKit

print("(wellcom to H.N Resturant)")

struct Product : Hashable{
    
    var name : String
    var price : Int
    func DescribeProduct (name : String , price : Int) {
        print(name , price )
    }
    
     
    func searchForProduct(productName: String) {
        if productName == name {
            print(name)
        } else {
            ("Sorry .. this product is not available")
        }
        
    }
}
class PrintProduct {
    var name : String = ""
    var meals : [Product] = []
    func DescribeProduct() {
        for Product in meals {
            Product.DescribeProduct(name : Product.name , price: Product.price)
        }
    }
}

var product1 = Product(name: "sushi", price: 45)
var product2 = Product(name: "cold appetizers", price: 20)
var product3 = Product(name: "hot appetizers", price: 20)
var product4 = Product(name: "BBQ", price: 170)
var product5 = Product(name: "Shrimp" , price: 134 )
var product6 = Product(name: "fish fallet", price: 170)
var product7 = Product(name: "rice", price: 55 )
var product8 = Product(name: "salad", price: 15 )
product5.searchForProduct(productName: "")
print()

let OurProducts = PrintProduct()
OurProducts.name = "* List of meals and prices in H.N restaurant : "
OurProducts.meals.append(contentsOf:[product1 , product2 , product3 , product4 , product5 , product6 , product7 , product8])
print(OurProducts.name)
OurProducts.DescribeProduct()


protocol User {
    var name : String { get }
    var orderProducts : [Product] { get }
    var RequestDate : String { get }
    var PhoneNumber : String { get }
}


//Customer
struct Customer : User {
    var name : String
    var orderProducts : [Product]
    var RequestDate : String
    var PhoneNumber : String
    var shoppingCart : [Product]
    
    func completeOrder() {
        if orderProducts.contains(product1) {
            print("Congratulations, you got 50% off.")
                }
        
        else {
            print("Thanks for ordering")
        }
    }
    
    mutating func addToShoppingCart( food : Product) {
           shoppingCart.insert(food, at: 0)
   }
    mutating func removeToShoppingCart( food : Product) {
           shoppingCart.remove(at: 0)
   }
    
    func viewShoppingCartItems (){
        print("\(name) shopping cart item :")
        for item in shoppingCart {
            print(item.name)
        }
    }

}

extension Customer {
    func describeOrder(products: [Product],custemer:Customer) {
        print("- He is : \(custemer.name) ")
        for product in products {
             print("His order \(product.name)")
        }
        print("He set the date of receipt at \(custemer.RequestDate). His phonenumber is \(custemer.PhoneNumber)")
    }
}


// First customer object
let productsCustomer1 = [product2 , product1 ]
let productsCustomer2 = [product4 , product5 ]
let productsCustomer3 = [product1]
let productsCustomer4 = [product2 , product3 , product5]
let productsCustomer5 = [product4 , product2 , product3 ]

var customer1 = Customer(name: "Mohamad", orderProducts:productsCustomer1, RequestDate: "12-11-2021 8:00pm", PhoneNumber: "0566555555", shoppingCart: [])
var customer2 = Customer(name: "Sarah", orderProducts:  productsCustomer2, RequestDate: "4-12-2021 9:30pm", PhoneNumber: "0566666667", shoppingCart: [])
var customer3 = Customer(name: "Saud", orderProducts: productsCustomer3, RequestDate: "6-12-2021 9:00pm", PhoneNumber: "0566745555", shoppingCart: [])
var customer4 = Customer(name: "Norah", orderProducts: productsCustomer4, RequestDate: "5-12-2021 10:30pm", PhoneNumber: "0556666666", shoppingCart: [])
var customer5 = Customer(name: "Asma", orderProducts: productsCustomer3, RequestDate: "12-12-2021 5:39pm", PhoneNumber: "0555554435", shoppingCart: [])



print()
print()
//Customer1
// Customer1 Adding to Cart
customer1.addToShoppingCart(food: product1)
customer1.addToShoppingCart(food: product2)
customer1.addToShoppingCart(food: product3)
// Customer1 Remove from Cart
customer1.removeToShoppingCart(food: product5)
//viewShoppingCart Customer1
customer1.viewShoppingCartItems()
customer1.describeOrder(products: [product1,product2], custemer: customer1)
customer1.completeOrder()
print()
//Customer2
// Customer2 Adding to Cart
customer2.addToShoppingCart(food: product5)
customer2.addToShoppingCart(food: product4)
//viewShoppingCart Customer2
customer2.viewShoppingCartItems()
customer2.describeOrder(products: productsCustomer2, custemer: customer2)
customer2.completeOrder()
print()
//Customer3
// Customer3 Adding to Cart
customer3.addToShoppingCart(food: product1)
customer3.addToShoppingCart(food: product2)
// Customer1 Remove from Cart
customer3.removeToShoppingCart(food: product2)
//viewShoppingCart Customer3
customer3.viewShoppingCartItems()
customer3.describeOrder(products: productsCustomer3, custemer: customer3)
customer3.completeOrder()
print()
//Customer4
// Customer4 Adding to Cart
customer4.addToShoppingCart(food: product2)
customer4.addToShoppingCart(food: product5)
customer4.addToShoppingCart(food: product3)
customer4.addToShoppingCart(food: product4)
// Customer4 Remove from Cart
customer4.removeToShoppingCart(food: product2)
//viewShoppingCart Customer4
customer4.viewShoppingCartItems()
customer4.describeOrder(products: productsCustomer4, custemer: customer4)
customer4.completeOrder()
print()
//Customer5
// Customer5 Adding to Cart
customer5.addToShoppingCart(food: product2)
customer5.addToShoppingCart(food: product3)
customer5.addToShoppingCart(food: product4)
//viewShoppingCart Customer5
customer5.viewShoppingCartItems()
customer5.describeOrder(products: productsCustomer5, custemer: customer5)
customer5.completeOrder()
print()
print()


//MANEGAR
class Manager {
    var name : String
    var userName : String
    var phoneNumber : String
    
    init(name : String , userName : String , phoneNumber : String){
        self.name = name
        self.userName = userName
        self.phoneNumber = phoneNumber
    }
    func printManager(){
            print("Restaurant manager: her name \(name) and her userName \(userName) .. her phoneNumber \(phoneNumber) ")
        }
    
    
    //print//
    var expense:Float = 1000
    var balance:Float = 4000
    //vat//
    let vat = 0.015

    var revenue:Float  {
        
    return  balance - expense
    }

    var netProfits:Float  {
        
    return  revenue - expense / revenue
        

    }
}

var restaurantManagerInfo = Manager(name: "HUDA", userName: "HNSA_5", phoneNumber: "0537612535")
restaurantManagerInfo.printManager()
print()

print("total sales revenue in the restaurant")
print(restaurantManagerInfo.revenue)

print()
print("Net profit in the restaurant")
print(restaurantManagerInfo.netProfits)


 

print()

//Net profit
//the sales
var RestaurantProducts = [
"sushi" : 75 ,
"coldAppetizers" : 20 ,
"hotHppetizers" : 20 ,
"BBQ" : 160 ,
"Shrimp" : 88 ,
"salmon" : 95 ,
"fish fillets" : 120
]
RestaurantProducts ["hotHppetizers"] = nil
RestaurantProducts["sushi"] = 67
print("* sales list in H.N.Resturant:")
for (key , value) in RestaurantProducts {
    print(key , value)
}


var salesHistory = [
    "sushi" : 800 ,
    "coldAppetizers" : 768 ,
    "hotHppetizers" : 455 ,
    "BBQ" : 1276 ,
]
print()
var TopSalesRevenue = salesHistory.sorted {$0.value > $1.value }
print ("* List of the highest sales in H.N.Resturant:")
for (key , value) in TopSalesRevenue {
    print(key , value)
}

print()
//Branch products
var MealsRestauranrBranchOne : Set<Product> = [product1 , product2 , product3 , product4 , product5 , product8]
var MealsRestauranrBranchTwo : Set<Product> = [product3 , product5 , product6 , product7 , product2 ]

var Meals = MealsRestauranrBranchOne.union(MealsRestauranrBranchTwo)
print ("* all the meals are common in both of the Branches :")
print("these are the names and prices:")
for all in Meals{
    print(all.name,all.price)
}
print()
var Meals2 = MealsRestauranrBranchOne.intersection(MealsRestauranrBranchTwo)
print("* these are the names and prices meals are common an branch1 and 2 : ")
print("these are the names and prices:")
for shared in Meals2 {
    print(shared.name , shared.price)
}
print()
var Difference = MealsRestauranrBranchTwo.subtracting(MealsRestauranrBranchOne)
print("* these are the names and prices meals are only available in branch two :")
print("these are the names and prices:")
for DifferenceMeals in Difference {
    print(DifferenceMeals.name , DifferenceMeals.price)
}


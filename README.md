# PROJECT-1


## Based on what you’ve learned until now , create a project of your choosing (impress us with your imagination) . This project must at least satisfy the following requirements :

- Use Optionals.
- Use arrays.
- Use dictionaries .
- Use Sets.
- Use functions that return an output . 
- Use Generics .
- Use Closures.
- Use Structs.
- Use Classes with an initializer .
- Use some form of Error Handling .
- Use Protocols . 
- Use extensions . 
- Use a computed property . 


##  Project Name :   December Antique Store :

#### Overview : An online store that sells flowers to customers. This online store has 2 main users. The customer and the manager of the store . Each one of them should be able to do the following tasks for the store to function properly . 
  
  #### As a manager of the Flower store , I should be able to do the following :
- Add new products to the online store.
- Update a product info. 
- Remove product from the online store.
- Get notified of out of stock products. 
- Browse purchase history.
- View the total sales revenue.  
- View the most sold products on the store. 
- Compute the tax with the product price.
- Change delivery status .


#### As a customer I should be able to do the following :
- Browse Products . 
- View the product info (summary, specs, price, quantity , etc.)
- Search for Products.#
- Get recommendations for my next purchase based on my purchase history.
- Add Products to the shopping cart.
- Remove a product from the shopping cart.
- List the products in my shopping cart. 
- Fill in my address for delivery.
- Get receipt of my purchases.
- Check delivery status . 
- can buy for himself and buy for another person.


#### Usage :

##### user
   To use this application , create a new user using the struct Users. Call the  browsingProducts() to receive a list of all the products. Also we can calculate the product's price after adding the tax using taxCalculate() function ,And check if the product available or out of stock using this method doesProductAvailabe(). then when it availabe use addToShoppingCart() to add a product to the shopping cart. after that call procesedCheckout() to checkout. Call dalalPurchases.subtracting(asmaPurchases) to receive recommendations for your next purchase .

##### manager 
To use this application to manage your online store , create a new manager using the struct Admin . Call the addNewProdcut(), editeProdcut() and deleteProdcut() to make changes in product list. Use printListOfUsers() to print a list of All Users.  calling this topSelling() to see who pays more. 



- Protocl for Users have those vars:
userName : String
typeOfUser : String
passWord: String
email: String
phoneNo. : Int
\\city : String

struct shoppingCart {
   var id : Int
   var User : Customer
   var items : [Product]
}



- Struct for Manager have those properites:
funcs:
Add new product
update the product
remove product
print history of purchase
print total sales
print most selling products


- Struct for Customer have those properites:
shoppingCart : ShoppingCart
funcs:
browse products
view products Info
search for products
add and remove and list from shopping cart
fill adress
get receipt
ordering for another person as a gift



- Protocol for Product:
  var id: Int 
  var name: String 
  var price: Double 
  stock : Int 
  
- enum for availability of product.
- dic for products

 

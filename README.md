# PROJECT-1


## Based on what you’ve learned until now , create a project of your choosing (impress us with your imagination) . This __project must at least satisfy the following requirements :

- Use Optionals.
- Use arrays .
- Use Sets.
- Use functions that return an output . 
- Use Generics .
- Use Closures.
- Use Structs.
- Use Classes with an initializer .
- Use some form of Error Handling .
- Use Dectionary
- Use Protocols . 
- Use extensions . 
- Use a computed property . 

## Example Project :  An online [Bookstore Store] :

#### Overview : An online book store that sells books to customers. This online store has 2 main users. The customer and the manager of the store . Each one of them should be able to do the following tasks for the store to function properly . 

#### As a customer I should be able to do the following :
- Browse  Books . 
- View the book info (summary, specs, price, quantity , etc.)
- Search for books.
- Get recommendations for my next purchase based on my purchase history.
- Add Books to the shopping cart .
- Remove a book from the shopping cart.
- List the Book in my shopping cart. 
- Fill in my address for delivery.
- Get receipt of my purchases.
- Check delivery status . 

#### As a manager of the book store , I should be able to do the following :
- Add new books to the online store.
- Update a book info. 
- Remove book from the online store.
- Get notified of out of stock books. 
- Browse purchase history.
- View the total sales revenue.  
- View the store net profits. 
- View the most sold products on the store. 
- Compute the tax with the book price.
- Check delivery status.
- Change delivery status .


#### Usage :

##### Customer user
first:
we use protocol [User] of [Customer:User]
give us [Username,Passowrd]
To use this application ,we create a new user using the struct [Customer] of user . and we Call the func of [PayBook] to receive a book what he was pay and we for loop : for [book] in [shoppingCart]. and we do structure of [Customer] and give us func of [describeCustomer] . and we use enum [TypeBookStore] store under that case department of [DramaBook,RomanticBook,HrorrBook] then we use [struct] Book to give us details of book [namebook, description, price, quantity,category, sectionlibrary] the section of library we using Dectionary[sectionLibliry] . switch [category] and give us case and this case print kinds of books in department.  static func of customers[PrintNationalID] then we using func [ShoppingCost]give volume and quantity. Etc. 

##### manager user
first:
we use protocol [User] of [ManagerUser]
give us [UserName,Password]. 
Manager can remove any prodoct he want by
func [removeProduct] and [index].
Thank you

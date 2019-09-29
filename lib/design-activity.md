- SHOPPING CART PROMPTS - 
What classes does each implementation include? Are the lists the same?
Implementation A:CartEntry, ShoppingCart, Order
Implementation B:CartEntry, ShoppingCart, Order 
Yes the lists are the same. 

Write down a sentence to describe each class.
CartEntry: keeps track of unit price and quantity
ShoppingCart: keeps track of the entries in the cart
Order: the class Order includes Sales Tax 

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
CartEntry parameters unitprice and quantity relate to price. 
ShoppingCart entries relate to price. 
Order sales_tax multipies by subtotal and this is total_price

What data does each class store? How (if at all) does this differ between the two implementations?
CartEntry: stores the quantity and unit price
ShoppingCart: stores entries which is a list of instances of CartEntry
Order: creates a new instance of ShoppingCart and calculates total price (with tax) for that instance of ShoppingCart.
No difference between the two implementations. 

What methods does each class have? How (if at all) does this differ between the two implementations?
A: total_price on ShoppingCart and on Order
B: price on ShoppingCart

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
A:retained in Order 
B:delegates price calculation to ShoppingCart and calculates the final total + tax 

Does total_price directly manipulate the instance variables of other classes?
Manipulates @cart, which is found in class Order

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
Implementation B is easier to modify. 
CartEntry will adjust the price based on quantity.

Which implementation better adheres to the single responsibility principle?
Implementation B

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
Implementation B

- HOTEL PROMPTS - 

Class Daterange stores check in and check out, raising an exception if the date selection is invalid.
In Reservation class, cost is calculated using the difference between check out and check in. Instead, it should be done using an new method in DateRange (nights_booked).  

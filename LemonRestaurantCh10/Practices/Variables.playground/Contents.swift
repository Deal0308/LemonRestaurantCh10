import UIKit

// variables var
// constants-> let

var restaurantName = "Little Lemon"
print("Welcome to \(restaurantName)")

restaurantName = "Little Lemon Bistro"
print("Now we are called \(restaurantName)")

// constants cannot change
let city = "Chicago"
// city = New Yotk error cannot assigna value to constant

print("Our \(restaurantName) is located in  \(city)")


// String
var specialDish = "Pasta Alfredo"

//Intergers
var availableTables = 3
//DOubles
var dishPrice = 9.56
// Boolean
var isOpen = true

var numberOfTables: Int = 10
print("\(restaurantName), has \(numberOfTables) tables, owned by Mario")

var anotherDish: String = "Pizza"
var tableCount: Int = 10
var price: Double = 10
var openStatus: Bool = true
print("We serve \(anotherDish), have \(tableCount) tables, the price is $\(price), and we are currently open: \(openStatus).")

//math operations
var pastaPrice = 10.50
var saladPrice = 6.25
var total = pastaPrice + saladPrice

var tip = total * 0.15
var finalPrice = total + tip

print("Subtotal: $\(total)")
print("Tip (15%): $\(tip)")
print("Final Price: $\(finalPrice)")

//Text("\(total,specifier:"%.1f")")
print(String(format:"%.1f",total))

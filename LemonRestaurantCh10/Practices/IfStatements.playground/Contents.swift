import UIKit

var greeting = "Hello, playground"
// if - else-if - else
/*
 syntax
 if codition1 {is true}else if condistion2 {
 this block runs if condition 1 is false and condition2 is true }else}
 this blick runs if none of the qbove cons are true
 
 expam[le 1
 */

var guests: Int = 7
let capacity: Int = 10

if guests > capacity {
    print("Over Capacity!")
}else{ print("We can seat this party!")
    
}


//--- example 2 ----
let rating = 3.2

if rating >= 4.5  {
    print("Excellent")
}else if rating >= 3.5{
    print("Good")
}else{
    print("Needs Improvement")
}

// -----example 3 Bool operators

let isOpen = true
let hasOutdoorSeating = true

if isOpen && hasOutdoorSeating {
    print("Open with outdoor seating")
}else if isOpen && !hasOutdoorSeating{
    print("Open indoor only.")
}else{
    print("Closed")
}

// example 4 comparing strings

let userName = "mike"
if userName == "jdoe"{
    print("Welcome , jdoe!")
}else{
    print("Unknown user")
}

// Example 5 Ternary

let price = 12.0
let label = price > 10.0 ? "Premium" : "Regular"
print(label)


// mini challenge 1
// if we have groups larger than 8 ; the clients need to call the manager.
//if the group has children , offer the kids menu
// no children and less than 8 display standard seating.

var group = 7
var hasChildren = true

if group > 8 && hasChildren {
    print("Please call the manager for large group seating and we will provide a kids menu.")
} else if group > 8 && !hasChildren {
    print("Please call the manager for large group seating.")
} else if group <= 8 && hasChildren {
    print("We can seat your group and provide a kids menu.")
} else {
    print("Standard seating is available.")
}

// mini challege 2
// decide if a user is VIP, and another if not


// VIP customer
let isVIP:Bool = true

if isVIP {
    print("Welcome back, VIP customer! You receive priority seating and special offers.")
} else {
    print("Welcome to Little Lemon! Thank you for dining with us.")
}



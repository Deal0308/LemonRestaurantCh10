import UIKit

// functions
// syntax' func funtionName(param1:Type,param2:Type) -> ReturnType {
//body of the function
// logic goes here

//return value }


// Example 1

func printWelcome(){
    print("Hello cohort #10")

}

printWelcome()

//example 2 - with 1 paramete

func greet(person:String) -> String{
    let greetings = " Hello " + person + "!"
    return greetings
    
}
let greetingMessage = greet(person: "Sam")
print(greetingMessage)

// Example 3 with 2 parameters
func add(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

let result = add(number1: 255, number2: 664)
print("The addition between 255 + 664 = \(result)")

// Example 4 with unnamed parameters
func multiply(_ x: Int, _ y: Int) -> Int {
    return x * y
}

print(multiply(3, 5))

// Mini Challenge
/* MiniChallenge

 1.  Define a function called welcomeStudent.

 2.  The function should take one parameter: name of type String.

 3.  The function should return a String.

 4.  Inside the function, build a message like: "Welcome, [name]! Ready to learn Swift?".

 5.  Call the function with a sample name and print the result.

*/
func welcomeStudent(name: String) -> String {
    return "Welcome, \(name)! Ready to learn Swift?"
}

let studentMessage = welcomeStudent(name: "Michael")
print(studentMessage)


// Mini Challenge 2

func deliveryStatus(minutes: Int) -> String {
    
    if minutes == 0 {
        return "Your order is ready!"
    } else if minutes <= 15 {
        return "Almost there — ready in \(minutes) minutes."
    } else if minutes <= 45 {
        return "On its way — ready in \(minutes) minutes."
    } else {
        return "Running late. Estimated time: \(minutes) minutes."
    }
}

print(deliveryStatus(minutes: 0))
print(deliveryStatus(minutes: 10))
print(deliveryStatus(minutes: 30))
print(deliveryStatus(minutes: 60))


// Challenge 3

func serviceFee(total: Double) -> Double {
    
    if total < 20 {
        return 0
    } else if total < 50 {
        return total * 0.10
    } else if total < 100 {
        return total * 0.15
    } else {
        return total * 0.20
    }
}

func finalBill(total: Double) -> String {
    
    let fee = serviceFee(total: total)
    let finalTotal = total + fee
    
    return "Bill: $\(String(format: "%.2f", total)) + fee: $\(String(format: "%.2f", fee)) = $\(String(format: "%.2f", finalTotal))"
}

print(finalBill(total: 15.0))
print(finalBill(total: 35.0))
print(finalBill(total: 75.0))
print(finalBill(total: 120.0))

// Challenge 4

func assignSection(guests: Int) -> String {
    
    if guests >= 1 && guests <= 2 {
        return "Bar Seating"
    } else if guests >= 3 && guests <= 4 {
        return "Standard Seating"
    } else if guests >= 5 && guests <= 8 {
        return "Large Table"
    } else if guests >= 9 && guests <= 10 {
        return "Private Room"
    } else {
        return "Invalid Guest Count"
    }
}

func reservationSummary(name: String, guests: Int) -> String {
    
    let section = assignSection(guests: guests)
    
    return "Reservation for \(name) - \(guests) guests - \(section)"
}

print(reservationSummary(name: "Michael", guests: 2))
print(reservationSummary(name: "Michael", guests: 5))
print(reservationSummary(name: "Michael", guests: 9))
print(reservationSummary(name: "Michael", guests: 12))

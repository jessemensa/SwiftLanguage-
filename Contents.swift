

// Swift Programming Language

// Simple Swift Tour
print("Hello World")

// constants vs variables => let(constant) & var(variables)
var age = 28
let legalName = "Jesse Amoako Mensah"

// being explicit
var randomDouble: Double = 100.0
let constNumber: Float = 4

// Converting Values
let sentence = "Jesse Mensah is "
let fullSentence = sentence + String(age)
print(fullSentence)

// another way to include numbers in string statements
let anotherFullSentence = "Jesse Mensah is \(age)"

// Control-Flows
// For loops
// 1. Create a list of values
// 2. Create a variable that holds a value
// 3. create a loop that runs through all those values inside the list and
// if value is less than 50
// add a value to the variable in 2.
// else add a diff value to variable in 2.
// print variable in 2.
var theList = [1, 2, 3, 4]
var finalValue = 0
for numb in theList {
    if numb <= 50 {
        finalValue += 10
    } else {
        finalValue += 5
    }
}
print(finalValue)


// While Loops
// condition
var favNumber = 2 // this is a condition
while favNumber < 100 {
    favNumber *= 2
}
print(favNumber)

// repeat while loop => run a block of code first before checking the condition
repeat {
    favNumber *= 2
} while favNumber < 100
print(favNumber)


// Missing Values => optionals
// represent optionals using ?
var stringOptional: String? = "Ten"
// extract value from the optional
if let theValue = stringOptional {
    print(theValue)
}

// Functions => block of code that accepts values performs computations and spits out a value
func salaryCalculate(perHour: Int, hoursPerDay: Int, numberOfWorkingDays: Int) -> String {
    return "Employee earns \(perHour * hoursPerDay * numberOfWorkingDays * 4) per month"
}
var salaryPerMonth = salaryCalculate(perHour: 10, hoursPerDay: 10, numberOfWorkingDays: 4)
print(salaryPerMonth)

// Functions can be nested inside other functions
func returnTen() -> Int {
    var y = 5 // condition
    func addFive() { y += 5 }
    addFive()
    return y
}
returnTen()

// Function can return another function as its value
func incrementByOne() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var incrementBy = incrementByOne()
incrementBy(9)

// function can take another function as an argument
// list of numbers and return true if a number is less than 10
func anyNumberLessThanTen(list: [Int], function: (Int) -> Bool) -> Bool {
    // for loop runs through iteems in the list
    for items in list {
        if function(items) {
            return true
        }
    }
    return false
}
func funcLessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 5, 200, 100]
anyNumberLessThanTen(list: numbers, function: funcLessThanTen)


// Classes => has properties and methods
class Babys {
    enum gender: String {
        case male
        case female
    }
    var numberOfArms = 2
    func babysJob() -> String {
        return "Always Crying"
    }
}

var africanBaby = Babys()
africanBaby.numberOfArms = 2
var job = africanBaby.babysJob()
print(job)

// Adding an initialiser to classes
class Baby {
    enum gender: String {
        case male
        case female
    }
    var numberOfArms = 2
    var color: String
    
    init (color: String) {
        self.color = color
    }
    
    func babyDescription() -> String {
        return "A baby has \(numberOfArms) arms"
    }
}

// Inheriting Classes => subclasses
class AfricanBaby: Baby {
    var weight: Double
    
    init(weight: Double, color: String) {
        self.weight = weight
        super.init(color: color)
        numberOfArms = 4
    }
    
    func calculateWeight() -> Double {
        return weight
    }
    
    override func babyDescription() -> String {
        return "An African baby has \(numberOfArms) arms and normally weighs \(weight) kg"
    }
}
let babyAfrican = AfricanBaby(weight: 30.0, color: "brown")
babyAfrican.babyDescription()
print(babyAfrican.babyDescription())


// Getters and Setters
class WhiteBaby: Baby {
    var weight: Double = 0.0
    
    init(weight: Double, color: String) {
        self.weight = weight
        super.init(color: color)
        numberOfArms = 3
    }
    
    var babyWeight: Double {
        get {
            return weight
        }
        set {
            weight = weight * 10
        }
    }
    
    override func babyDescription() -> String {
        return "A White baby has \(numberOfArms) and normally weighs \(weight) kg"
    }
}

var babyWestern = WhiteBaby(weight: 3.0, color: "White")
print(babyWestern.babyWeight)

// Structures => also has methods and initialisers like classes
struct Currency {
    var currencyname: String = "Cedi"
    
    func simpleDescription() -> String {
        return "Ghana currency is the \(currencyname)"
    }
}

var cedi = Currency(currencyname: "Cedi")
cedi.simpleDescription()


// Enumerations
enum Positions: Int {
    case keeper = 1
    case defender
    case midfielder
    case forward
    
    func description() -> String {
        switch self {
        case .keeper:
            return "keeper"
        case .defender:
            return "defender"
        case .midfielder:
            return "midfielder"
        case .forward:
            return "forward"
        default: 
            return String(self.rawValue)
        
        }
    }
}
let keeper = Positions.keeper
let keeperRawValue = keeper.rawValue


// Protocols
// declaring protocols
protocol Example {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations and structs can adopt protocols
class FirstExample: Example {
    var simpleDescription: String = "This is first example adopting protocol"
    var anotherProperty: Int = 12345
    func adjust() {
        simpleDescription += " for the first time"
    }
}
var firstexample = FirstExample()
firstexample.adjust()
let theDescription = firstexample.simpleDescription

struct SecondExample: Example {
    var simpleDescription: String = "This is second example adopting protocol"
    mutating func adjust() {
        simpleDescription += " for the second time"
    }
}
var secondexample = SecondExample()
secondexample.adjust()
let secondExampleDescription = secondexample.simpleDescription

// Error Handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// throwing an error inside a function
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// use do-catch to handle errors
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}


// Data Structures and Algorithms in Swift
// Swift Standard Library => framework that contains core components of the swift language.

// Primary Data Structures
// 1. Array, elements in an array are ordered.
var family = ["Jasmine", "Lucy", "Jessica"]

// Array performance, how does array fare when data in it grows
family.append("Vida")
print(family)
family.insert("Jesse", at: 0)


// 2. Dictionaries
var scores: [String: Int] = ["Jesse": 20, "Jessica": 30, "Jasmine": 33]
// adding a new entry
scores["Vida"] = 40


// Complexity
// Time Complexity

// Constant time algorithm
func checkFirst(names: [String]) {
    if let first = names.first {
        print(first)
    } else {
        print("no names")
    }
}

















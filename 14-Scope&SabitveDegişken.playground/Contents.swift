import UIKit

var ad = "EEE"

// Scope : { }
// if, for, class, struct

// Global Scope
var age = 24

func printMyAge() {
    print("My age is \(ad)")
}

print(age)
printMyAge()

func printBottleCount() {
    // şişe sayısını ekrana yazdırır.
    let bootleCount = 120
    print(bootleCount)
}

printBottleCount()
// print(bootleCount) Bu sabite ulaşamazsınız.

func printTenNames() {
    // 10 isim yazdırır.
    var name = "Can"
    
    for index in 1...10 {
        print("\(index): \(name)")
    }
    
    // print(index) index yalnızca for içerisinden ulaşılabilen bir sabittir.
    print(name)
}

printTenNames()

// ------------------------------------------------------------
// Variable Shadowing

func printComplexScope() {
    let points = 100
    print(points)
    
    for index in 1...3 {
        let points = 200
        print("Loop \(index): \(points + index)")  // buradaki 'points -> en yakındaki points'i alır yani "200" ü alacaktır.
    }
    
    print(points)  // Buradaki 'points' fonksiyonda ilk tanımlananı alır. Yani "100"
}

printComplexScope()

var name: String? = "Nadin"

// If-let ve guard-let kullanımlarında shadowing tercih edin. Kafa karışıklığının önüne geçin.

if let name = name {
    
}

// ------------------------------------------------------------
// Shadowing and Initializers

struct Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = Person(name: "Lavinya", age: 2)

print(person.name)
print(person.age)




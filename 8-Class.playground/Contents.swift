import UIKit

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sayHello() {
        print("Hello, my name is \(name)")
    }
}

// Nesne Oluşturmak
let person1 = Person(name: "Lavinya")
print(person1.name)
person1.sayHello()


// Inheritance (Kalıtım) SADECE CLASS TA VAR SCRUTC TA YOKTUR.
// Canlı -> Memeliler -> İnsan -> Çalışan -> Yaz Müh. -> IOS Geliştirici

// BASE CLASS Oluşturmak

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {  //Computed Property
        return "Araç saatte \(currentSpeed) km hızla hareket ediyor."
    }
    
    func makeNoise() {
        // Herhangi bir aracın ne tür bir sese sahip olduğunu bilemediğimiz için
        // bu fonksiyonun içini boş bırakıyoruz.
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

// SUBCLASS Oluşturmak
// class SomeSubclass: SomeSuperClass {
//
// }

class Bicycle: Vehicle {
    var hasBasket = false // Bisikletin ön sepeti var mı yok mu ?
    
}
let bicycle1 = Bicycle()
bicycle1.hasBasket = true
bicycle1.currentSpeed = 12
print("Bicycle: \(bicycle1.description)")

//Çoklu kişinin binebileceği bisiklet türü
class Tandem: Bicycle {
    var currentNumberOfPassangers = 0
}
let tandem1 = Tandem()
tandem1.hasBasket = true
tandem1.currentNumberOfPassangers = 2
tandem1.currentSpeed = 7
print("Tandem: \(tandem1.description)")


// Override Methods and Properties
// Method ve özelliklerin yeniden yazılması

class Train: Vehicle {
    var vagon = 5
    
    override func makeNoise() {
        print("Choo Choo")
    }
    
    override var description: String {
        return "Araç, \(vagon) vagonla saatte \(currentSpeed) km hızla hareket ediyor."
    }
}

let train1 = Train()
train1.currentSpeed = 25
train1.makeNoise()
print("Tren: \(train1.description)")


class Car: Vehicle {
    var gear = 1
    
    override var description: String {
        return super.description + " ve vitesi \(gear)"
    }
}

let car1 = Car()
car1.currentSpeed = 60
car1.gear = 3
print("Car: \(car1.description)")

// Ovverride: Initializer

class Insan {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Ogrenci: Insan {
    var enSevdigiDers: String
    
    init(name: String, enSevdigiDers: String) {
        self.enSevdigiDers = enSevdigiDers
        super.init(name: name)
    }
}

let ogrenci1 = Ogrenci(name: "Emrah", enSevdigiDers: "Matematik")
ogrenci1.name
ogrenci1.enSevdigiDers

// Class ve Referans Edilebilme
var ogrenci2 = Ogrenci(name: "Süleyman", enSevdigiDers: "Edebiyat")
var ogrenci3 = ogrenci2

ogrenci3.name = "Deneme"

// Struct'lardan farklı olarak, objenin kendisini değil, memory'deki referansı kopyalanır.
// Bir objedeki değişim, diğerine de etki eder.
print(ogrenci2.name)


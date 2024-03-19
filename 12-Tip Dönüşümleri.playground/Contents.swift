import UIKit

// Tipler Arası Dönüşüm  - Type Casting
// func getClientPet() ->  Cat, Dog, Bird => Animal
// let pet = getClientAnimal() Bird, Cat, Dog

/*
 func walk(dog: Dog) {
 
 }
 
 func cleanLitterBox(cat: Cat){
 
 }
 
 func cleanCage(bird: Bird) {
 
 }
 */

/*
 let pets = allClientPets() // Tüm evcil hayvanları getirir
 
 for pet in pets {
    let dog = pet as! Dog -> Tercih edilmemeli. Ya pet, Dog türünden değilse
 }
 
 for pet in pets {
    if let dog = pet as? Dog {
        walk(dog: dog)
    }else if let cat = pet as? Cat {
        cleanLitterBox(cat: cat)
    }else if let bird = pet as? Bird {
        cleanCage(bird: bird)
    }
 }
 
 as! -> Force Cast, eğer alt sınıf üst sınıftan türemiyora sonuç nil olur ve uygulama çöker.
 
 */

class Animal { }
class Cat: Animal { }
class Dog: Animal { }
class Bird: Animal { }

// Eğer bir Array'de birden farklı veri tipi aynı anda kullanılabiliyorsa o Array'in veri tipi ne?
// [String], [Int], [Bool] -> Hayır,

// -----------------------------------------------------------
// 'ANY' Anahtar Kelimesi
// Any -> Her tür veri tipi olabilir demek...

var array: [Any] = [5, "Can", 4.78, Dog()]

// Array'ın sıfırıncı elemanını bir Int olarak kullanabiliyor muyum?
if let firstItem = array[0] as? Int {
    // Array'ın sıfırıncı elemanı bir Int türündendir ve değeri 'firstItem' a atanmıştır.
    print(firstItem)
}
if let firstItem = array[1] as? String {
    print(firstItem)
}
if let firstItem = array[2] as? Double {
    print(firstItem)
}
if let firstItem = array[3] as? Dog {
    print(firstItem)
}

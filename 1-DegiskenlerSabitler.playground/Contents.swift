import UIKit

// Bilgi Türleri
// "Merhaba"
// 12
// 3.14
// true | false

let name = "Emirhan"

print(name)

// name = "Eren"

var height = 170

print(height)

height = 185

print(height)

// Camel case
let defaultScore = 100
var playerOneScore = defaultScore
var playerTwoScore = defaultScore

print(playerOneScore)
print(playerTwoScore)

playerOneScore = 200
print(playerOneScore)


// isimlendirme

let sonuc = 15
let toplamaSonucu = 24

// Kurallar
// 1 - Matematiksel sembol içeremez
// 2 - Boşluk kullanamazsınız
// 3 - İsimlendirmeler sayı ile başlayamaz

struct Insan {
    let firstName: String
    let lastName: String
    
    func sayHello() {
        print("Merhaba")
    }
}

// Veri Tipi
// String   --> ""
// Double   --> 12.21
// Int      --> 213
// Bool     --> True,False

let city = "Istanbul"
let sayi1 = 12
let isiklarAcikMi = true


let insan1 = Insan(firstName: "Emirhan", lastName: "Erdoğan")
let insan2 = Insan(firstName: "Alican", lastName: "Tarım")


var playerName = "Berkin"

var ondalikliSayi = 2.56
var tamSayi = 21



// İkisi aynı şekilde tanımlanıyor.
let uzunCirkinSayi = 100000000000
let uzunGuzelSayi = 1_000_000_000

// Başlangıç değerleri olmadığında
// Tam sayı vermek istediğinizde ama Double olarak tanımlamak istersek
let cityName: String = "San Francisco"
let pi: Double = 3.14

let number: Double = 3

let ad: String

ad = "Sergen"

// var x  --> Olmaz.



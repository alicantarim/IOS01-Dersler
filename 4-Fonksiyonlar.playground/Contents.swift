import UIKit

// fonksiyon değer dönüyorsa dönüş tipini belirtmek için -> ve dönüş tipi belirtilir.
// func fonksiyonAdı(Parametre vermek gerekirse buraya gelecek) -> (Int, Double, String, Bool, vs..)

// makeBreakfast(food: ["eggs", "orange juice"])

// PARAMETRESİZ VE DÖNÜŞSÜZ FONKSİYONLAR

func displayPi() {
    print("3.14")
}

func sayMyName() {
    print("Alican")
}
// Fonksiyonu çağırmak, çalıştırmak
displayPi()
sayMyName()

// -----------------------------------------------------------------------------------------
// PARAMETRELİ DÖNÜŞSÜZ FONKSİYONLAR

func triple(value: Int) {
    let result = value * 3
    print(result)
}
// Fonksiyonu çağırmak, çalıştırmak  Calling a function
triple(value: 5)
 

// ÇOKLU PARAMETRELİ DÖNÜŞSÜZ
func multiply(firstNumber: Int, secondNumber: Int) {
    let result = firstNumber * secondNumber
    print(result)
}

func introduceYourself(firstName: String, lastName: String, height: Double) {
    let fullName = firstName + " " + lastName
    let text = "Merhaba ben " + fullName + " ve boyum " + String(height)
    print(text)
    print("Merhaba ben, \(firstName + " " + lastName) ve boyum \(height)") // Bunu kullanırsak text ve fullName tanımlamamıza gerek kalmaz.
}


multiply(firstNumber: 12, secondNumber: 4)
introduceYourself(firstName: "Lavinya", lastName: "Tarım", height: 1.85)

// -----------------------------------------------------------------------------------------
// Argument Labels
func sayHello(firstName: String) {
    let text = "Merhaba, " + firstName
    print(text)
}

sayHello(firstName: "Lavinya")


func sayHello(to firstName: String) {
    let text = "Merhaba, " + firstName
    print(text)
}

sayHello(to: "Kübra")


func sayHello(to person: String, and anotherPerson: String){
    let text = "Merhaba, " + person + " ve " + anotherPerson
    print(text)
}

sayHello(to: "Alican", and: "Can")


func sayHello(_ person: String, _ anotherPerson: String) {
    let text = "Merhaba, " + person + " ve " + anotherPerson
    print(text)
}

sayHello("Test", "Test1")


// -----------------------------------------------------------------------------------------
// Varsayılan Parametre Değerleri

func display(teamName: String, score: Int = 0) {
    let text = teamName + ": " + String(score)
    print(text)
}

//display(teamName: "Fenerbahçe")
display(teamName: "FB", score: 1)
display(teamName: "GS")


// -----------------------------------------------------------------------------------------
// PARAMETRELİ VE DÖNÜŞLÜ FONKSİYONLAR  ************************

func carpma(firstNumber: Int, secondNumber: Int) -> Int {
    let result  = firstNumber * secondNumber
    return result
}

let sonuc = 4 * 5
let sonuc2 = carpma(firstNumber: 5, secondNumber: 4)
// carpma(firstNumber: 5, secondNumber: 4) = 20 olur.

let resultText = "Çarpma işleminin sonucu: " + String(sonuc2)
print(resultText)

// Eğer Çarpma işleminin sonucuna bir daha ihtiyacım olmayacaksa
// Bir değişkenin içinde tutmaya ihtiyacım olmayacaksa print e yazabiliriz.
print(carpma(firstNumber: 23, secondNumber: 12))

let result1 = carpma(firstNumber: 3, secondNumber: 5)
let result2 = carpma(firstNumber: result1, secondNumber: 3)
let reuslt3 = carpma(firstNumber: 7, secondNumber: result2)


 

import UIKit
//-----------------------------FONKSİYONLAR-----------------------------

func sayMyName() {
    print("Alican")
}
sayMyName()

// PARAMETRELİ VE DÖNÜŞSÜZ FONKSİYONLAR
func carpim(value1: Int, value2: Int) {
    let result = value1 * value2
    print(result)
    print("Çarpma Sonucu : \(value1 * value2) dir.")
}
carpim(value1: 5, value2: 12)


// VARSAYILAN PARAMETRE DEĞERLERİ
func display(teamName: String, score: Int = 0) {
    print("\(teamName): \(score)")
}
display(teamName: "Fenerbahçe")


// PARAMETRELİ VE DÖNÜŞLÜ FONKSİYONLAR
// Değeri döndürmek için return kullanılır.
func carpma(firstNumber: Int, secondNumber: Int) -> Int {
    let result = firstNumber * secondNumber
    return result
}

//sonuc ve sonuc2 aynı
let sonuc = 4 * 5
let sonuc2 = carpma(firstNumber: 4, secondNumber: 5)

let resultText = "Çarpma işleminin sonucu: " + String(sonuc2)
print(resultText)

print(carpma(firstNumber: 23, secondNumber: 7))

let result1 = carpma(firstNumber: 3, secondNumber: 5)
let result2 = carpma(firstNumber: result1, secondNumber: 2)
let result3 = carpma(firstNumber: 5, secondNumber: result2)


//-----------------------------STRINGLER-----------------------------

let merhabaDunya = "Kodlama dünyasında \"Merhaba Dünya\" çok kez kullanılır."
print(merhabaDunya)

// " yapmak için -> \"
// ' yapmak için -> \'
// Tab yapmak için -> \t

var myString = ""  //Boş String
// Stringlerin boş olduğunu anlamak
myString.isEmpty

// Interpolation
// Stringleri '+' sembolü ile birbiri arkasına ekleyebilirsiniz.
let string1 = "hello"
let string2 = ", World"
let finalString = string1 + string2

var karsilamaMetni = ""
karsilamaMetni += "Merhaba "
karsilamaMetni += "Ben Lavinya"

let name = "Lavinya"
let age = 2
print("Merhaba, ben \(name) ve \(age) yaşındayım.")

// String Eşitliği
// "a"  == "b" -> false
// "Ocak" == "ocak" -> false

let month = "Ocak"
let anotherMonth = "ocak"
let lowercaseMonth = "ocak"

if month == anotherMonth {
    print("Aylar eşit.")
}

if month != lowercaseMonth {
    print("Eşit değiller.")
}

let isim = "Nadin"
if isim.lowercased() == "NaDiN".lowercased() {
    print("Her iki isim de aynı")
}

// Prefix & Suffix Fonksiyonu
let kliseMetin = "Hello, World!"
kliseMetin.hasPrefix("Hello") // Prefix cümlenin başına denir. hasprefix true veya false döndürür.
kliseMetin.hasPrefix("hello")
kliseMetin.hasSuffix("World") // Suffix cümlenin sonuna bakar.
print(kliseMetin.hasPrefix("Hello"))

// CONTAINS FONKSİYONU - içerisinde istediğin formatta bir metin
let tanitmaMetni = "Merhaba Berk, benim adım Emirhan"

if tanitmaMetni.contains("benim adım") {
    print("kişi kendisini tanıtmış")
}

// String -> Karakterler dizisi
let password = "123456"
let count = password.count
if count < 8 {
    print("Şifreniz en az 8 karakter içermeli")
}


//-----------------------------STRUCT-----------------------------

struct Car {
    var make: String
    var model: String
    var year: Int
    var topSpeed: Int
    
    func startEngine() {
        print("Üreticisi: \(make), modeli \(model), yılı: \(year) ve max hız: \(topSpeed) km olan araç çalıştırıldı.")
    }
    
    func drive() {
        print("Üreticisi: \(make), modeli \(model), yılı: \(year) ve max hız: \(topSpeed) km olan araç hareket halinde.")
    }
    
    func park() {
        print("Üreticisi: \(make), modeli \(model), yılı: \(year) ve max hız: \(topSpeed) km olan araç park edildi.")
    }
}

let car1 = Car(make: "VW", model: "2000", year: 2008, topSpeed: 150)
let car2 = Car(make: "Skoda", model: "Fabia", year: 2000, topSpeed: 180)

car1.startEngine()
car1.drive()
car2.park()

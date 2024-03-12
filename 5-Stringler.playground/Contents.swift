import UIKit

let deneme = "Merhaba"
var denem1 = "Hello"


// Birden fazla satırdan oluşan bir string tanımlamak isterseniz """ ifadesini kullanabilirsiniz.
let dialog = """
Soru: Bu benim sorum!
Cevap: Bu da call center cevabı.
"""
print(dialog)

let merhabaDunya = "Kodlama dünyasında \"Merhaba Dünya\" çok kez kullanılır."
print(merhabaDunya)

// " yapmak için -> \"
// ' yapmak için -> \'
// Tab yapmak için -> \t

var myString = ""  //Boş String

// Stringlerin boş olduğunu anlamak
myString.isEmpty

// Tek elemandan oluşan bir String sabitini türünü belirterek Character olarak tanımlayabilirsiniz.
let a = "a" //String
let b: Character = "b" //Character

// Interpolation
// Stringleri '+' sembolü ile birbiri arkasına ekleyebilirsiniz.
let string1 = "hello"
let string2 = ", World"
let finalString = string1 + string2

var karsilamaMetni = ""
karsilamaMetni += "Merhaba "
karsilamaMetni += "Ben Lavinya"

let name = "Emirhan"
let age = 24

print("Merhaba, ben \(name) ve \(age) yaşındayım.")


// 4 x 5 = 20
let number1 = 20
let number2 = 4
let result = number1 * number2
print("\(number1) X \(number2) = \(result)")
print("\(number1) X \(number2) = \(number1 * number2)")



// -------------------------------------------------------------------------
// String Eşitliği

// "a"  == "b" -> false
// Ocak ocak

let month = "Ocak"
let anotherMonth = "ocak"
let lowercaseMonth = "ocak"

// Stringleri if yapıları içerisinde kıyasalayabilirsiniz.
if month == anotherMonth {
    print("Aylar eşit.")
}

// Stringler karakterlere duyarlı şekilde kıyaslanırlar.
if month != lowercaseMonth {
    print("Eşit değiller.")
}

// 'lowercased' özelliği ile tanımlanan String içerisindeki tüm karakterler, küçük karakterlere dönüştürülebilir.
let isim = "Nadin"
if isim.lowercased() == "NaDiN".lowercased() {
    print("Her iki isim de aynı")
}



// Prefix & Suffix Fonksiyonu  -- case sensitive çalıır.
let kliseMetin = "Hello, World!"
kliseMetin.hasPrefix("Hello") // Prefix cümlenin başına bakar. hasprefix true veya false döndürür.
kliseMetin.hasPrefix("hello")
kliseMetin.hasSuffix("World") // Suffix cümlenin sonuna bakar.
print(kliseMetin.hasPrefix("Hello"))



// Contains Fonksiyonu
// Bir stringin, içerisinde herhangi bir karakter dizisini bulundurup bulundurmadığı, .contains() özelliği kullanılarak kontrol edilebilir.
let tanitmaMetni = "Merhaba Berk, benim adım Emirhan"

if tanitmaMetni.contains("benim adım") {
    print("kişi kendisini tanıtmış")
}


// String -> Karakterler dizisi
let sehir = "Istanbul"
let count = sehir.count // 8



// Stringlerin uzunluğu '.count' özelliği ile bulunabilir.
let password = "123456"
if password.count < 8 {
    print("Şifreniz en az 8 karakter içermeli")
}


// String metnini değiştirmek için aşağıdaki fonksiyonları da kullanabilirsiniz.
// index(before: )
// insert(_:, at:)
// remove(at: )


// Unicode
// Emojiler string olarak tanımlanabilir. Aynı zamanda, değişken ve sabit tanımlamada da kullanılabilir.
let appleEmoji = "🍎"
appleEmoji.count


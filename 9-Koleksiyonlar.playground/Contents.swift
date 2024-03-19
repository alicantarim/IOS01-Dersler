import UIKit

// ARRAY
// Aynı türden verileri bir arada tutan yapılardır.

// Array Gösterimi
// []

// Array Tanımlaması

var names: [String] = ["Can", "Eren", "Baran", "Elfin"]
var names2 = ["name1", "name2"]
var numbers = [1, 56, -2, 24]
var bools = [true, false, false]

// xyz elemanı bu dizide var mı?
if numbers.contains(24) {
    print("Bu dizide 24 sayısı bulunuyor.")
}
names.contains("Can")

// let ile tanımlanan bir diziye eleman eklenemez veya çıkartılamaz.

// Array Tipleri
var takipciler: [String] // Elemanı olmayan bir Array
var myArray: Array<Int> = [] // Sık kullanılmaz. Karşılaşırsanız korkmayın.

// TERCİH EDİLEN BOŞ ARRAY KULLANIMI ******
var ages = [Int]()

// Array'ler ile Çalışmak
var sifirlar = [Int](repeating: 0, count: 100)

// Bir Array'de kaç adet eleman var ?
let nameCount = names.count
let agesCount = ages.count

// Sıfır elemanlı bir Array nasıl anlaşılır.
//Yöntem 1: count == 0
// Yöntem 2: isEmpty

if ages.isEmpty {
    print("Ages dizisinde hiç eleman bulunmuyor.")
}

// Array'lerde Index
// Index ile Array'in Elemanlarına Ulaşmak

var meyveler = ["Armut", "Elma", "Çilek", "Muz"]
let ilkMeyve = meyveler[3]
// DİKKAT: Index ile bir elemana ulaşırken, index'in array.count -1 'den büyük olmadığından emin olmalısınız:
// Index ile Array'deki Elemana Değer Atamak
meyveler[1] = "Ananas"
print(meyveler)

// Array'e Yeni Elemanlar Eklemek (Append)
// Yöntem 1: += iki array ardı ardına eklenebilir. (Çoklu eleman eklerken kullanılır.)
// Yöntem 2: array.append(element: )

meyveler.append("Böğürtlen")
meyveler += ["Karpuz", "Kavun"]

print(meyveler)

// İstenilen bir Index'e Eleman Eklemek
// Eklediğiniz eleman bulunduğu index'teki eski elemanı bir sağa kaydır.
var heights = [12.56, 34.37, 56.89]
heights.insert(0.45, at: 0)
heights.insert(1.43, at: 1)

// Array'den Eleman Silmek
// Yöntem: remove(at: index)

var appleUrunleri = ["iPhone", "iPad", "iMac"]
let cikartilanEleman = appleUrunleri.remove(at: 0)
// analyticsService.log(cikartilanEleman)

print("Çıkartılan Eleman: \(cikartilanEleman)")
print(appleUrunleri)

// Sonuncu Elemanı Silmek
// array.count -1 alternatifi
appleUrunleri.removeLast()
print(appleUrunleri)

// Tüm Elemanları Silmek
appleUrunleri.removeAll()

// Birden çok dizinin bir araya gelerek oluşturduğu diziler
let number1 = [1, 3, 5, 7, 9]
let number2 = [2, 4, 6, 8 ,10]
let allNumbers = number1 + number2

// Çok Boyutlu Diziler

/*
 X O X -> Array1
 O O X -> Array2
 X X 0 -> Array3
 */

let array1 = ["X", "O", "X"]
let array2 = ["O", "O", "X"]
let array3 = ["X", "X", "O"]

let gameBoard = [array1,array2, array3]

gameBoard[0]
gameBoard[1]
gameBoard[2]

// İki boyutlu bir Array'in elemanlarına ulaşmak
// İlki Satır numara İkincisi Sütun numarası
gameBoard[0][0]
gameBoard[0][1]
gameBoard[1][0]
gameBoard[1][2]

// ----------------------------------------------------------
// Dictionary

// Dictioanry Gösterimi
// [key1: value1, key2: value2, key3: value3]
// NOT: Her key, özel olmalıdır. Yani tekrar edemez. (TC Kimlik Numarası gibi)

// Dictionary Tanımlaması
var scores = ["Beşiktaş": 89, "Galatasaray": 88, "Fenerbahçe": 87]

//Boş Dictionary Tanımlaması
var myDictionary = [String : Int]()  // ****
var myDictionary2 = Dictionary<String, Int>()
var myDictionary3: [String : Int] = [:]

// Elemanların Değerini Güncellemek
// DİKKAT: Case Sensitive
// NOT: Olmayan bir key ile güncelleme yapmaya çalışırsanız, yeni bir key-value ikilisi eklenir.
scores["Galatasaray"] = 90

// Değer güncellerken eski değerine ulaşmak
let fenerbahceninEskiDegeri = scores.updateValue(91, forKey: "Fenerbahçe")
print(scores)





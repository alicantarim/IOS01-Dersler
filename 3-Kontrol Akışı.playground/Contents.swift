import UIKit

// Mantıksal Operatörler
// == -> Eşit mi ?
// != -> Eşit Değil mi ?
// >  -> Büyük mü?
// >= -> Büyük veya Eşit mi?
// <  -> Küçük mü ?
// <= -> Küçük veya Eşit mi?
// && -> AND(ve)
// || -> OR(veya)
// !  -> Değil, Tersi

// If Yapıları
let kaynamaNoktasi = 45

if kaynamaNoktasi >= 10 {
    //Eğer doğru ise burası çalışır.
    print("Su Kaynıyor")
}

print("Burası devam ediyor...")

//If-Else
if kaynamaNoktasi >= 100 {
    print("Su kaynıyor")
}
else {
    print("Su kaynamıyor.")
}

let isiklarAcikMi = true
// Dakika cinsinden
let acikKalmaSuresi = 12

// Işıklar açıksa ve açık kalma süresi 5 dakinanın üzerindeyse...

// && (AND) -> true ve true = true (Tek yolu)
// && (AND) -> true ve false = false

// Bool değerin true olduğunu kontrol etmek için == true yazmaya gerek yok. (Sadece True kontrolünde !)
// isiklarAcikMi && acikKalmaSuresi >5 gibi
if isiklarAcikMi == true && acikKalmaSuresi > 5 {
    print("Işıkları kapat")
}
else {
    print("Işıklar 5 dakikadan kısa bir süredir açık veya isiklar kapalı.")
}

// If-ElseIf
var yarisiBitirmeSirasi = 1

if yarisiBitirmeSirasi == 1 {
    print("Birinci Bitirdin.")
}
else if yarisiBitirmeSirasi == 2 {
    print("İkinci Bitirdin.")
}
else {
    print("ilk ikiye giremediniz")
}

//Boolean Değerler
let number = 1000
let isSmallNumber = number < 10


let hizLimiti = 120
let benimHizim = 89
let sinirAsma = benimHizim > hizLimiti

var karYagiyorMu = false

if !karYagiyorMu {
    print("Kar yağmıyor.")
}

// And ile Aralık Tanımlamak
let sicaklik = 23

// Sıcaklık, 20 dereceden büyük eşit mi ve 25 dereceden küçük eşit mi ?
// [20, 25]
if sicaklik >= 20 && sicaklik <= 25 {
    print("Sıcaklık güzel")
}
else if sicaklik < 20 {
    print("Hava soğuk")
}else {
    print("Hava çok sıcak")
}

// Telefon kullanabilmen için ya şarjı olmalı ya da prize takılı olmalı
// || true, true -> true
// || true, false -> true
// || false, true -> true
// || false, false -> false

var telefonSarjdaMi = true
var bataryaGücüVarMi = false

if telefonSarjdaMi || bataryaGücüVarMi {
    print("Tel kullanbilirsin")
}
else {
    print("Kullanamazsın")
}


// -----------------------------------------
// Switch Yapıları

let tekerlekSayisi = 5

switch tekerlekSayisi {
case 1:
    print("Tek teker")
case 2:
    print("İki Teker")
case 3:
    print("Üç teker")
default:
    print("Bilinmiyor")
}

let karakter = "z"

switch karakter {
case "a", "e", "i", "ö", "ü": // ||
    print("Karakter sesli")
default:
    print("Karakter sessiz")
}


let mesafe = 120

// Aralık Tanımlamak
// x...y -> x dahil ve y dahil
// x--<y -> x dahil ama y dahil değil

switch mesafe {
case 0...10:
    print("Yürü")
case 11...30:
    print("bisiklet mesafesi")
case 31...100:
    print("Araba mesafesi")
default:
    print("Mesafe uzak")
}

//Ternary Operator
var largest: Int

let a = 15
let b = 5

if a > b {
    largest = a
}else {
    largest = b
}

// a büyüktür b ise a yı alır yoksa b yi alır. Yukarıdaki ile birebir aynı
// Sadece If ve else de çalışır. Yalnız bir şey true veya false ise

// a > b ?  Soru işareti buradaki koşulun true mu olduğunu kontrol eder.
// Eğer True ise ? den sonraki yazacağımız şey 'a' largest'ın değeri olur.
// True değilse : (else) o zaman b yi largest'a atar.
largest = a > b ? a : b

a == b ? print("Eşit") : print("Eşit değil")


let secim = 1
let sayi1 = 12
let sayi2 = 3

switch secim {
case 1:
    print("Toplama Sonucu: \(sayi1 + sayi2)")
case 2:
    print("Çıkarma Sonucu: \(sayi1 - sayi2)")
case 3:
    print("Bölme Sonucu: \(sayi1 / sayi2)")
case 4:
    print("Çarpma Sonucu: \(sayi1 * sayi2)")
default:
    print("1 ile 4 arasında seçim yapınız")
}

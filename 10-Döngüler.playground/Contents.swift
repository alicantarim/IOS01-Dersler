import UIKit

// Koşula bağlı döngüler kaç kere yapılacağını bilmiyorsak - WHILE
// Koşula bağlı olmayan döngüler kaç kez çalışacağını bildiğimiz - FOR

// For Döngüleri (for-in)
// Kapalı Aralık ...
//Açık Aralık: ..<

for index in 1...5 {
    print("Sayı: \(index)")
}

// Döngüde kaçıncı elemanda olduğunuzu bimek istemiyorsanız.
for _ in 1...3 {
    print("Merhaba")
}


let names = ["Name 1", "Name 2", "Name 3"]

// names dizisindeki tüm elemanlar için çalışacak
// Her çalıştığında 'name' parametresinin değeri o anki elemana eşit olacak.
// Bu tür döngüler, kaç kez çalışacağını array'in eleman sayısında kendi hesaplar
for name in names {
    print("Merhaba \(name)")
}

// EK BİLGİ: Stringler de aaslında bir koleksiyondur.
"merhaba" // ["m", "e", "r", "h", "a", "b", "a"]

for harf in "merhaba" {
    print("Harf: \(harf)")
}

// Bir Array üstünde çalışan for döngüsünde hem elemanların index,
// hem de kendi değerlerine aynı anda ulaşmak isterseniz.
// array.enumerated() -> [(index, değer)]

for (index, harf) in "Emirhan".enumerated() {
    print("\(index). harf: \(harf)")
}

// For-in Döngüleri ve Dictionary'ler
let araclar = ["bisiklet": 3, "scooter": 2, "araba": 1]

for (aracIsmi, sayisi) in araclar {
    print("\(aracIsmi): \(sayisi) adet var.")
}

// NOT: Dictionary'ler ASLA sıralı değildir.


// ---------------------------------------------------------------------------
// WHILE DÖNGÜLERİ - Koşullu Döngüler (Su dolana kadar basmaya devam et. Işık kapanana kadar dinlemeye devam et.

var numberOfLives = 3

/*
 while numberOfLives > 0 {
    hamleniYap()
    canSayısınıGüncelle()
 }
 */

var stillAlive = true

while stillAlive {
    // Hayatta ise çalışacak..
    numberOfLives -= 1
    
    if numberOfLives == 0 {
        stillAlive = false
    }
}

// Bazen döngü tamamlanmadan bitirmek istersiniz...
// Yöntem: break

for index in -3...3 {
    print(index)
    
    if index == 0 {
        break // index 0 olduğu zaman döngü kırılır. Artık index değeri de artmaz.
    }
}


var deger0 = 1

while deger0 < 5 {
    if deger0 == 3 {
        break
    }
    print("Sonuç: \(deger0)")
    deger0 += 1
}

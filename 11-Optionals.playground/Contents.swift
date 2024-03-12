import UIKit

// Optionals
// ?!

// Gözle görünür, ama içi boş olan kutu
var name: String = ""

// Gözle görünmüyor henüz, ama birgün olacağı biliniyor.
var age: Int? // Memory'de yaşamıyor, ama birgün yaşayabilir. Yaşamayadabilir.

// Nil -
// Değer olmayışı = nil olma durumu
var test: String? = nil  // Memory de hiç bir yeri yok ve henüz kullanılamaz. Initialize edilmemiş anlamına gelir.

// ? -> Bir değer olabilir(String, Int, Bool etc.) veya olmayabilir(nil).


// Örnek

struct Book {
    var name: String  // nil olamaz
    var publicationYear: Int? // nil olabilir.
}

let book1 = Book(name: "Book1", publicationYear: 1997)
let book2 = Book(name: "Book2", publicationYear: 1998)
let book3 = Book(name: "Book3", publicationYear: 1999)

// Henüz yayınlanmamış bir kitap?
// Bu yanlış. Neden? Kitap 0 yılında yayınlanmış ve 2023 yaşında gibi duruyor.
let yayinlanmamisKitap = Book(name: "Book 4", publicationYear: 0)

// nil -> Değerin olmayışı
let yayinlanmamisKitap2 = Book(name: "Book 5", publicationYear: nil)


// Optioanl Olanların Tipini Belirtmek
var serverResponseCode = 404   // Değeri nil olamayan bir tanımlama
// var serverResponseCode2 = nil   // Bir değişkenin tipini belirtmeden değerini 'nil' belirleyemezsiniz.
var serverResponseCode3: Int? = 404  // Şu anki değer 404, ama ileride 'nil' olabilir.
var serverResponseCode4: Int? = nil  // Şu anki değeri 'nil' ama ileride bir tam sayı olabilir.

// ------------------------------------------------------------------------------------------------------
// Optional Olan Değerler ile Çalışmak

// Bir değerin 'nil' olup olmadığını nasıl kontrol edersiniz? (If)

var publicationYear: Int? = 2010

if publicationYear != nil {
    // Değeri 'nil' değilse...
    // ! -> force-unwrap operator 'nil' olabilecek değerleri zorunlu çıkartır.
    // 'nil' değilmiş gibi kullanmak için sonuna '!' eklenir. DİKKAT: O an değeri nil ise uygulamanız çökecek
    // Bu yüzden değerinin nil olmadığından önce emin olmalısınız.
    let actualYear = publicationYear!
    print(actualYear)
}

// print(publicationYear!)  // 49. satırdaki değeri nil yaptığımız anda burada kodumuz patlayacaktır.

// If-Let
if let actualYear = publicationYear {
    // 'publicationYear' nil değilse onun değerini '!' ile unwrap eder ve 'actualYear' olarak sunar.
    print(actualYear)
}

if let bookYear = book3.publicationYear {
    print("Book3 pub year: \(bookYear)")
}

// If-Let-Else
if let year = book2.publicationYear {
    print("Book2's publication year is \(year)")
}else {
    // book2.publicationYear = nil ise... burası çalışır.
}


// ------------------------------------------------------------------------------------------------------
// Fonksiyonlar & Optionals
let string = "1234a"
let possibleNumber = Int(string) // Optional bir sonuç verir.
// Neden ? Çünkü her yazı bir tam sayı ifade etmeyebilir.
// Örnk: "123" -> Tam sayı olabilirken, "abc" -> tam sayıya dönüşemez. Bu durumda sonuç 'nil' olur.

// Fonksiyon Örneği

func printFullName(firstName: String, middleName: String?, lastName: String) {
    // MiddleName önce if let ile kontrol edilmeli, sonra kullanılmalı.
}

// Bir websitesinin içeriğinin metin olarak döndürür. (websitesi varsa...)
func textFromURL(url: URL) -> String? {
    return nil
}

// ------------------------------------------------------------------------------------------------------
// Failable Initializers (Initialize edilemeyen objeler...)
// 12 den küçük veya 36 dan büyük girilirse 'montsOld' a c1 sonucu 'nil' olacak
struct Cocuk {
    var name: String
    var monthsOld: Int
    
    init?(name: String, monthsOld: Int) {
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        }else {
            self.name = name
            self.monthsOld = monthsOld
        }
    }
    
}
let c1 = Cocuk(name: "Ad 1", monthsOld: 45)
let c2 = Cocuk(name: "Ad 1", monthsOld: 30)

if let cocuk2 = c2 {
    // cocuk1 = c1 yazarsak Buraya girmez. Neden? c1 -> 'nil'
    print(cocuk2.monthsOld)
}

// ------------------------------------------------------------------------------------------------------
// Optional Chaining
// xyz?.abc?.123

struct Person {
    var age: Int
    var residence: Residence?
}

struct Residence {
    var address: Address?
}

struct Address {
    var buildingNumber: String
    var stretName: String
    var apartmentNumber: String?
}

let person = Person(age: 24, residence: nil)


// Pek hoş değil.
if let residence = person.residence {
    if let address = residence.address {
        if let apartmentNumber = address.apartmentNumber {
            print("Kişi \(apartmentNumber) numaralı apartmanda yaşıyor.")
        }
    }else {
        print("test")
    }
}

// Optional Chaining
if let apartmentNumber = person.residence?.address?.apartmentNumber {
    // Zincirin kırılmaması için tüm optional değerlerden geçilmesi gerekiyor.
    print("Kişi \(apartmentNumber) numaralı apartmanda yaşıyor.")
}else {
    print("test")
}



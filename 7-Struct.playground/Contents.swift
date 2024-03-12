import UIKit

// Veri Tipleri
// String, Double, Int, Bool ,

// Ürün
    // - var adı: String
    // - var stok: Int
    // - var fiyat: Double

// Kendi veri tiplerimizi Struct'lar yardımı ile oluşturabiliriz.

// Bir Struct'ta Neler var?
// 1- Değişkenler ve Sabitler (Property)
// 2- Initializers
// 3- Fonksiyonlar (Method)
// 4- enum'lar, başka Struct'lar (opsiyonel)

struct User {
    var firstName: String
    var lastName: String
    var weight: Double
    var age: Int
    var isLoggedIn: Bool
}

let user1 = User(firstName: "Emirhan", lastName: "Erdogan", weight: 85.4, age: 25, isLoggedIn: true)



struct Insan {
    let ad: String
    let soyad: String
    
    func merhabaDe() {
        print("Merhaba! Benim adım \(ad) soyadım \(soyad)")
    }
    
}

let insan1 = Insan(ad: "Lavinya", soyad: "Tarım")
let insan2 = Insan(ad: "Kübra", soyad: "Tarım")

insan1.merhabaDe()
insan2.merhabaDe()
print((insan1.ad + " " + insan1.soyad))


// ÖRNEK 3
struct Price {
    
    // MARK: - Types
    enum Currency: String {
        case dollar = "$"
        case turkishLira = "₺"
        case euro = "€"
    }
    
    // MARK: - Properties
    var value: Double
    var currency: Currency
    
    // MARK: - Methods
    /// Para biriminin sembolu ve miktarını bir araya getirir. $ + 13.56  = $13.56
    func priceTag() -> String {
        return currency.rawValue + String(value)
    }
}

// "Price" veri tipini kullanarak bir nesne oluşturmak;
let macBookPrice = Price(value: 5999.0, currency: .turkishLira)
let macBookPrice2 = Price(value: 8000.0, currency: .dollar)

// "Price" modelinde tanımlı bir fonksiyonun kullanımı;
print(macBookPrice.priceTag())
print(macBookPrice2.priceTag())


//----------------------------------------------------------
// NESNELER

struct Car {
    
    // MARK: - Properties
    var make: String
    var model: String
    var year: Int
    var topSpeed: Int
    
    // MARK: - Methods
    func startEngine() {
        print("Üreticisi: \(make), modeli: \(model), yılı: \(year) ve maksimum hızı: \(topSpeed) olan araç çalıştırıldı.")
    }
    
    func drive() {
        print("Üreticisi: \(make), modeli: \(model), yılı: \(year) ve maksimum hızı: \(topSpeed) olan araç hareket halinde.")
    }
    
    func park() {
        print("Üreticisi: \(make), modeli: \(model), yılı: \(year) ve maksimum hızı: \(topSpeed) olan araç park edildi.")

    }
    
}

// "Car" veri tipinden nesnelerin oluşturulması;
let car1 = Car(make: "Honda", model: "Civic", year: 2010, topSpeed: 160)  //Initialize etme
let car2 = Car(make: "Ford", model: "Mustang", year: 2020, topSpeed: 280)

// Fonksiyonların kullanımı;
car1.startEngine()
car1.drive()
car2.park()


//----------------------------------------------------------
// Initializers  3.0 | Kullanım
// Parametreli bir fonksiyon ve compiler tarafından oluşturulur.
// Herhangi bir veri tipinden (Int, String, Car...) nesneler oluşturmek için kullanılan bir çeşit fonksiyondur.


// Kullanım 1: .init()
var string = String.init() // Varsayılan başlangıç değeri: ""
var integer = Int.init() // Varsayılan başlangıç değeri: 0
var bool = Bool.init() // Varsayılan başlangıç değeri: false

// Kısa Yöntem
// Kullanım 2: ()
var string2 = String()
var integer2 = Int()
var bool2 = Bool()


//----------------------------------------------------------
// Initializers 3.1 | Özel Veri Tiplerinde Kullanım
// Bir Struct oluştururken içerisine özellikler(property) tanımlarız. Kendi özel veri tipinizi oluşturmanız ile Memberwise
// adı verilen ve tanımladığınız tüm özellikleri içeren bir Initializer oluşturulur.

struct MapLocation {
    
    var latitude: Double
    var longitute: Double
}

// Memberwise Initializer kullanımı
let myLocation = MapLocation(latitude: 2.865, longitute: 32.691)

//----------------------------------------------------------
// Initializers 3.2 | Varsayılan Değerler
// Struct'ınızda bulunan özellikler, bir başlangıç değerine sahip olabilirler.
// Başlangıç değerine sahip olan özellikler, Memberwise Initializer'da yer almayabilir.

// ÖRNEK: Kilometre sayacı
struct Odometer {
    var count: Int = 0  //var count: Int = 0 aynı veya var count = Int()
    
    func odaBilgi () {
        print("Sıcaklık: \"\(count)\" derecedir.")
    }
}
// count = 0, Odometer(count: 0)
let odometer1 = Odometer()
print(odometer1.count)

odometer1.odaBilgi()

// Memberwise Initializers
// Swift tarafından tüm özelliklerin içerildiği initializers'lardır.
let odometer2 = Odometer(count: 12)
print(odometer2.count)


// NOT: Varsayılan değerler, her durumda tercih edilmemelidir.
// Örneğin bir insan nesnesi oluşturmak isterseniz, ad veya soyad bilgilerinin başlangıç değerine sahip olmamaları gerekir.
struct Person {
    var name: String = ""
}
//Hatalı bir varsayılan değer kullanımı. Bu, adı "" olan bir insan oluşturmaya neden olabilir.
let person1 = Person()


//----------------------------------------------------------
// Initializers 3.3 | Özelleştirilmiş Initializer Kavramı | Custom Initializers
// Bir Struct'ın Memberwise Initializer'ı olabileceği gibi, ihtiyaç halinde kendi Initializer'ınızı da oluşturabilirsiniz.


struct Temperature {
    var celcius: Double
    
    init(celcius: Double) {
        self.celcius = celcius
    }
    
    init(fahrenheit: Double) {
        celcius = (fahrenheit - 32) / 1.8
    }
    
    init(kelvin: Double) {
        celcius = kelvin - 273.15
    }
}

// Celcius Initializer'ının kullanımı
let temperature1 = Temperature(celcius: 32)

// Problem: Sıcaklık bilgisini verecek kişi, fahrenheit türünden anlıyor.
let fahrenheit = 98.4 // Kullanıcı girdisi
let celciusValue = (fahrenheit - 32) / 1.8  // Bilginin tür dönüşümü
let temperature2 = Temperature(celcius: celciusValue)


// Custom Init Kullanımı
let currentTemperature = Temperature(fahrenheit: 87)
let boiling = Temperature(celcius: 100)
let freezing = Temperature(kelvin: 273.15)

print(currentTemperature.celcius)
print(boiling.celcius)
print(freezing.celcius)


//----------------------------------------------------------
// Instance Methods (Nesne Methodları)

struct Size {
    var width: Double
    var height: Double
    
    // Fonksiyon struct 'ın içinde olduğu için parametreleri width height ı biliyor.
    func area() -> Double {
        return width * height
    }
}

let size1 = Size(width: 10.5, height: 3.2)

//size1 nesnenin üzerinde area fonksiyonunu çalıştırır.
let area1 = size1.area()


// Kendi icerisindeki bir degiskene mudahale etmesini isteyen bir fonk yaziyorsak bunun mutating func olmasi gerekiyor.
struct KilometreSayaci {
    var deger: Int = 0 //Varsayılan değer
    
    mutating func artır() {
        deger += 1    //Struct içerisindeki bir fonksiyon yine o struct içerisindeki bir değerde değişkende değişiklik yapıyorsa mutating kelimesini koymalısın.
    }
    
    mutating func artır(miktar: Int) {
        deger += miktar
    }
    
    mutating func reset() {
        deger = 0
    }
}

var sayac = KilometreSayaci() // deger = 0
sayac.artır() // 'deger' özelliği 1 arttı.
sayac.artır(miktar: 15) // 'deger' özelliği 15 arttı.

print(sayac.deger)
sayac.reset()
print(sayac.deger)



//----------------------------------------------------------
// Computed Propertie (Hesaplanan Özellikler)    *** ÖNEMLİ
//
// Read Only


//struct Sicaklik {
//    var celcius: Double
//    var fahrenheit: Double
//    var kelvin: Double
//
//    init(celcius: Double) {
//        self.celcius = celcius
//        fahrenheit = celcius * 1.8 + 32
//        kelvin = celcius + 273.15
//    }
//
//    init(fahrenheit: Double) {
//        self.fahrenheit = fahrenheit
//        celcius = (fahrenheit - 32) / 1.8
//        kelvin = fahrenheit + 273.15
//    }
//
//    init(kelvin: Double) {
//        self.kelvin = kelvin
//        celcius = kelvin - 273.15
//        fahrenheit = kelvin * 1.8 + 32
//    }
//}
 
//let sicaklik1 = Sicaklık(celcius: 0, fahrenheit: 30, kelvin: 273.15)
//let sicaklik1 = Sicaklik(celcius: 22)
//let sicaklik2 = Sicaklik(fahrenheit: 221)
//let sicaklik3 = Sicaklik(kelvin: 155)




struct Sicaklik {
    var celcius: Double

    var fahrenheit: Double {
        return celcius * 1.8 + 32
    }

    var kelvin: Double {
        return celcius + 273.15
    }
}

var sicaklik1 = Sicaklik(celcius: 25)

print(sicaklik1.fahrenheit)
print(sicaklik1.kelvin)

sicaklik1.celcius = 32

print(sicaklik1.fahrenheit)
print(sicaklik1.kelvin)


// --------------------------------------------------
// PROPERTY OBSERVERS   -> Property = Değişken
// Bir değişkendeki değişimi anında haber verir.
// Celcius a bir değer eşitlerken o anda bir mat. hesaplama yapmasını istiyoruz. Celc 20 ye eşitlediğinizde otomatik Fahr. ve Kelvin e de değer atasın istiyorsunuz Bu noktada Celc ne zaman bir değere atandığını bilmek zorundasınız.
// Struct içerisinde tanımlanan property'ler, Property Observer adındaki kod blokları
// sayesinde değerleri değişmek üzereyken ve(veya) değiştikten sonra takip edilebilirler.

// İki çeşit observer vardır. Bunlar;
// 1 - WillSet: Bir property'nin değeri değişmek üzereyken çalışır. Var olan değer henüz değişmeden yeni değeri öğrenmek için kullanılır.
// 2 - DidSet: Bir property'nin değeri değiştikten hemen sonra çalışır. Bir önceki değere ulaşılabilir.

struct AdimSayar {
    
    var adimSayisi: Int = 0 {
        willSet {
            // newValue -> Yeni gelecek olan değeri ifade eder..
            print("adimSayisi, birazdan \(newValue) olacak.")
        }
        didSet {
            // Burası didSet için ayrılan kod bloğu
            // oldValue -> Yeni değer gelmeden önceki değer.
            if adimSayisi > oldValue {
                // Yeni değer öncekinden büyük anlamına gelir.
                // Bir diğer deyişle adım atılmış yani ileri yönde hareket edilmiştir.
                print("\(adimSayisi - oldValue) adım atıldı")
            }
        }
    }
}

var adimSayar1 = AdimSayar()
adimSayar1.adimSayisi = 3
adimSayar1.adimSayisi = 140


// Instance -> Obje
// Type - > Veri Tipi (Struct)

// Type Methods and Properties
// static

struct OndalikliSayi {
    static var pi: Double = 3.14
}

//let piSayisi = OndalikliSayi(pi: 3.14)
//piSayisi.pi

OndalikliSayi.pi  // static var değeri direk okuyabiliriz.

// Fonksiyonlar da 'static' olabilir.
let enKucukSayi = Double.minimum(12, 34.5)
let enBuyukSayi = Double.maximum(34.56, 36.12)

let abc: Double = 122
let xyz = 61.2

let enBuyukSayi1 = Double.maximum(abc, xyz)
let enKucukSayi2 = Double.minimum(abc, xyz)


var someSize = Size(width: 250, height: 1000)
var anotherSize = someSize

someSize.width = 32

print(someSize.width)
print(anotherSize.width)



// DENEME COMMIT ISLEMİ

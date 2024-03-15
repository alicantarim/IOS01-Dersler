import UIKit

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sayHello() {
        print("Hello, my name is \(name)")
    }
}

// Nesne Oluşturmak
let person1 = Person(name: "Lavinya")
print(person1.name)
person1.sayHello()


// **************************************************************
// Inheritance (Kalıtım) SADECE CLASS TA VAR SCRUTC TA YOKTUR.
// Canlı -> Memeliler -> İnsan -> Çalışan -> Yaz Müh. -> IOS Geliştirici

// BASE CLASS Oluşturmak
class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {  //Computed Property
        return "Araç saatte \(currentSpeed) km hızla hareket ediyor."
    }
    
    func makeNoise() {
        // Herhangi bir aracın ne tür bir sese sahip olduğunu bilemediğimiz için
        // bu fonksiyonun içini boş bırakıyoruz.
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")


// SUBCLASS Oluşturmak
// class SomeSubclass: SomeSuperClass {
//
// }

class Bicycle: Vehicle {
    var hasBasket = false // Bisikletin ön sepeti var mı yok mu ?
    
}
let bicycle1 = Bicycle()
bicycle1.hasBasket = true
bicycle1.currentSpeed = 12
print("Bicycle: \(bicycle1.description)")


//Çoklu kişinin binebileceği bisiklet türü
class Tandem: Bicycle {
    var currentNumberOfPassangers = 0
}

let tandem1 = Tandem()
tandem1.hasBasket = true
tandem1.currentNumberOfPassangers = 2
tandem1.currentSpeed = 7
print("Tandem: \(tandem1.description)")



// ************
// Override Methods and Properties
// Method ve özelliklerin yeniden yazılması

class Train: Vehicle {
    var vagon = 5
    
    override func makeNoise() {
        print("Choo Choo")
    }
    
    override var description: String {
        return "Araç, \(vagon) vagonla saatte \(currentSpeed) km hızla hareket ediyor."
    }
}

let train1 = Train()
train1.currentSpeed = 25
train1.makeNoise()
print("Tren: \(train1.description)")


class Car: Vehicle {
    var gear = 1
    
    override var description: String {
        return super.description + " ve vitesi \(gear)"
    }
}

let car1 = Car()
car1.currentSpeed = 60
car1.gear = 3
print("Car: \(car1.description)")


// **************************************************************
// Ovverride: Initializer
class Insan {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Ogrenci: Insan {
    var enSevdigiDers: String
    
    init(name: String, enSevdigiDers: String) {
        self.enSevdigiDers = enSevdigiDers
        super.init(name: name)
    }
}

let ogrenci1 = Ogrenci(name: "Emrah", enSevdigiDers: "Matematik")
ogrenci1.name
ogrenci1.enSevdigiDers

// Class ve Referans Edilebilme
var ogrenci2 = Ogrenci(name: "Süleyman", enSevdigiDers: "Edebiyat")
var ogrenci3 = ogrenci2

ogrenci3.name = "Deneme"

// Struct'lardan farklı olarak, objenin kendisini değil, memory'deki referansı kopyalanır.
// Bir objedeki değişim, diğerine de etki eder.
print(ogrenci2.name)



class Coffee {
    
    var size: String!
    var type: String!
    var isDecaffeinated: Bool!
}

class Camera {
    
    var model: String!
    var lens: String!
    var memory: Int!
}

// Obje Oluşturmak
let myCoffee = Coffee()
myCoffee.size = "Medium"
myCoffee.isDecaffeinated = true
myCoffee.type = "Brezilya"

let sonyCamera = Camera()
sonyCamera.memory = 128
sonyCamera.lens = "f3.5"
sonyCamera.model = "Sony"

print(myCoffee.type!)


// Bir object, initiliaze fonksiyonu çağırıldıktan sonra mutlaka tüm depolanan değerlerine değer atanmış olması gerekir.
class InstagramPost {
    
    // MARK: - Properties
    var content: String
    var location: String
    var likeCount: Int
    
    // MARK: - Life Cycle
    init(content: String, location: String, likeCount: Int) {
        self.content = content
        self.location = location
        self.likeCount = likeCount
    }
    
    init() {
        // Tüm değişkenlerin değerlerini atıyoruz...
        content = ""
        location = ""
        likeCount = 0
    }
}

// Default Initializer
//let post1 = InstagramPost()
//post1.content = "Elma varsa ben varım!"
//post1.likeCount = 12
//post1.location = "BAU"

// Custom Initializer
let post2 = InstagramPost(content: "Elma varsa ben varım!", location: "BAU", likeCount: 12)

print(post2.content)

// ---------// ---------// ---------// ---------// ---------
// İç-İçe "Class" Kullanımı
class Scholar {
    
    // MARK: - Properties
    var firstName: String
    var lastName: String
    
    // MARK: - Life Cycle
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    // MARK: - Functions
    func fullName() -> String {
        return firstName + " " + lastName
    }
}

class School {
    
    // MARK: - Properties
    var name: String
    var location: String
    var scholars: [Scholar]

    // MARK: - Life Cycle
    init(name: String, location: String, scholars: [Scholar]) {
        self.name = name
        self.location = location
        self.scholars = scholars
    }
    
    // MARK: - Functions
    func printAllStudentNames() {
        print("Students of \(name):")
        
        for scholar in scholars {
            print(scholar.fullName())
        }
    }
}

print("\n")

let scholar1 = Scholar(firstName: "Emirhan", lastName: "Erdoğan")
let scholar2 = Scholar(firstName: "Râna", lastName: "Altıparmak")

let bau = School(name: "BAU", location: "Beşiktaş", scholars: [scholar1, scholar2])

bau.printAllStudentNames()

// ---------// ---------// ---------// ---------// ---------
// Class'larda Inheritance

enum Currency: String {
    case dollar = "$"
    case turkishLira = "₺"
}

class Price {

    var value: Double
    var currency: Currency
    
    init(value: Double, currency: Currency) {
        self.value = value
        self.currency = currency
    }
    
    func text() -> String {
        return "\(currency.rawValue)\(value)"
    }
}

class Product {
    var name: String
    var description: String
    var price: Price
    
    init(name: String, description: String, price: Price) {
        self.name = name
        self.description = description
        self.price = price
    }
}

class Mac: Product {
    var model: String
    var memory: Int
    var processor: String
    
    init(name: String, description: String, price: Price, model: String, memory: Int, processor: String) {
        self.model = model
        self.memory = memory
        self.processor = processor
        super.init(name: name, description: description, price: price)
    }
}

enum FlowerType {
    case rose
    case clove
    case magnolia
    case daisy
}

class Flower: Product {
    var type: FlowerType
    var numberOfBouquet: Int
    
    init(name: String, description: String, price: Price, type: FlowerType, numberOfBouquet: Int) {
        self.type = type
        self.numberOfBouquet = numberOfBouquet
        super.init(name: name, description: description, price: price)
//        super.init(name: name, description: description, price: price)
    }
}

let macPrice = Price(value: 10999, currency: .turkishLira)
let iMac = Mac(name: "Mac", description: "Açıklama", price: macPrice, model: "iMac", memory: 128, processor: "Intel i5")

let flowerPrice = Price(value: 10.0, currency: .dollar)
let daisy = Flower(name: "Papatya", description: "Bu bir çiçek", price: flowerPrice, type: .daisy, numberOfBouquet: 3)

// let isimler: [String] = ["sas", "sada", 1]
// let macs: [Mac] = [iMac, ""]
// let cicekler: [Cicek] = [papatya, true]
let products: [Product] = [iMac, daisy]

for product in products {
    print("Urun adı: \(product.name), Acıklama: \(product.description), fiyat: \(product.price.text())")
}

// ---------// ---------// ---------// ---------// ---------
// Class'larda Polymorphism

class LivingThing {
    
    func makeSound() {
        // ...
    }
}

class Cat: LivingThing {
    
    override func makeSound() {
        print("Meoow")
    }
}

class Dog: LivingThing {
    
    override func makeSound() {
        print("Haw haw")
    }
}

let cat = Cat()
let dog = Dog()

cat.makeSound()
dog.makeSound()

// Basit bir Class'ın Tanımlanması
class Account {
    
    // Class'ın Özellikleri
    var firstName: String!
    var lastName: String!
    var username: String!
    var age: Int!
    var password: String!
}

// Basit bir Class'dan Obje Oluşturmak
var myAccount = Account()

// Oluşturuluan objenin içeriisndeki değişkenler henüz doldurulmadı.
// İhtiyacınız olan bilgileri bu objeye ekleyin;
myAccount.firstName = "Emirhan"
myAccount.lastName = "Erdoğan"
myAccount.username = "emiroks"

// Bir objenin içerisindeki her değişkeni doldurmak zorunda değilsiniz.

// Oluşturulan bir objenin kullanılması (özelliklerine ulaşmak)
let fullName = myAccount.firstName + " " + myAccount.lastName

// Class'ların içerisindeki değişken türleri sizin önceden tanımladıklarınız da olabilir, örn: ShapeType adındaki bir enum.

enum ShapeType {
    case square
    case triangle
}

enum Color: String {
    case blue = "Mavi", green = "Yeşil", red = "Kırmızı"
}

class Card {
    
    enum Brand {
        case mercedes
        case bmw
        case ford
        case tesla
    }
    
    // Modelimizin Özellikleri
    var brand: Brand!
    var model: String!
    var year: Int!
    var workhorse: Int!
}

// private kelimesi bir değişkenin veya fonksiyonun,
// dışarıdan ulaşılamamasını sağlıyoruz.

class Shape {
    
    enum ShapeType {
        case triangle
        case square
    }
    
    // Modelimizin Özellikleri
    var type: ShapeType!
    var size: Int!
    
    // Modelimizin Fonksiyonları
    private func drawSquare() {
        for _ in 0..<size {
            for _ in 0..<size {
                print("* ", terminator: "")
            }
            print("")
        }
    }
    
    private func drawTriangle() {
        for i in 0..<size {
            for _ in 0..<i + 1 {
                print("* ", terminator: "")
            }
            print("")
        }
    }
    
    func draw() {
        switch type! {
        case .square:
            drawSquare()
            
        case .triangle:
            drawTriangle()
        }
    }
}

// -------------------------------------------------------------------------------
// Custom Initializers

// Bir Class'tan obje oluşturulması işlemine 'initialize' denir. Bu işlemi gerçekleştiren fonksiyonlara ise 'initializer'

let account1 = Account()
// Bu örnekte () kısmı Apple tarafından otomatik olarak tanımlanır ve içi boş bir initializer'dır.

// Kendi initializer'larınızı yaratarak bir objenin oluşturulma esnasında içerisindeki değişkenleri doldurabilirsiniz.

// Bir Class içerisine birden fazla initializer tanımlayabilirsiniz.

class Computer {
    
    // Özellikler
    var cpu: String
    var gpu: String
    var memory: Int
    var storage: Int
    
    // Initalizer 1
    init(cpu: String, gpu: String, memory: Int, storage: Int) {
        self.cpu = cpu
        self.gpu = gpu
        self.memory = memory
        self.storage = storage
    }
    
    // Initalizer 2
    init(cpu: String, gpu: String) {
        self.cpu = cpu
        self.gpu = gpu
        memory = 0
        storage = 0
    }
}

// Custom Init'i Olan bir Class'tan Obje Oluşturmak
let myComputer = Computer(cpu: "Intel Core i7", gpu: "AMD Radeon Pro 565X", memory: 16, storage: 512)

let cpu = myComputer.cpu
let gpu = myComputer.gpu
let memory = myComputer.memory
let storage = myComputer.storage

let computer2 = Computer(cpu: "xyz", gpu: "abc")

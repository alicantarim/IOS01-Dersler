import UIKit

// Kurallar dizisini tanimlar - Prosedurun kurallar dizisini tanimlar ve bir isin nasil yapilmasi gerektigini belirtir.
// Bilgisayarlar birbirleriyle iletisim kurarken farkli dillerde konusuyor. Gunun sonunda hepsi birbiriyle iletisim kurmasi gerekiyor.

// Protokol
// Bir dizi fonksiyon ve degiskenlerden olusan bir sablondur.

// Swift'te var olan bazi Protokoller;
// CustomStringConvertable
// Equatable
// Comparable
// Codable


// CustomStringConvertable

let string = "Hello World"
print(string)

let number = 42
print(number)

let boolean = false
print(boolean)


struct Ayakkabi {
    var color: String
    var size: Int
}

let ayakkabi1 = Ayakkabi(color: "Siyah", size: 41)
print(ayakkabi1)


// 'Description' adinda bir read-only property ekler.
struct Shoe: CustomStringConvertible {
    var color: String
    var size: Int
    var hasLaces: Bool
    
    var description: String {
        let doesOrDoesNot = hasLaces ? "does" : "does not"
        let text = "The shoe is \(color), size \(size), and \(doesOrDoesNot)"
        return text
        //return "Color : \(color), Size: \(size)"
    }
}

let shoe1 = Shoe(color: "Siyah", size: 41, hasLaces: true)
shoe1.description
print(shoe1.description)


// -------------------------------------------------------------
// Equatable -> Nesnelerin Bilgi kiyaslamasi yapmaya imkan sagliyor.

struct Employee: Equatable {
    var firstName: String
    var lastName: String
    var jobTittle: String
    var phoneNumber: String
    
    static func == (lhs: Employee, rhs: Employee) -> Bool{
        // Iki Employee objesinin birbirine olan esitligini hangi kosullarda saglanacagini belirtiyoruz.
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

struct Company {
    var name: String
    var employees: [Employee]
}

// Uygulamaya giris yapmis olan kisi
let currentEmployee = Employee(firstName: "Lavinya", lastName: "Tarim", jobTittle: "Tech Avangelist", phoneNumber: "")

// Ustune tiklanarak secilen kisi
let selectedEmployee = Employee(firstName: "Berkin", lastName: "Ceylan", jobTittle: "Content Director", phoneNumber: "")

// Iki kisiyi kiyaslamaliyiz ve eger birbirlerine esitse, kisi kendi bilgilerini duzenleyebilmeli.
// Eger esit degilse duzenleme ozelligi kapanmali

if currentEmployee == selectedEmployee  {
    print("Profil duzenlenebilir.")
}else {
    print("Profil duzenlenemez.")
}


// -------------------------------------------------------------
// Comparable -> Iki Nesne arasinda Bilgi Siralamasi


struct Employee2: Equatable, Comparable{
    
    // MARK: Functions
    var firstName: String
    var lastName: String
    var jobTittle: String
    var phoneNumber: String
    
    // MARK: Properties
    static func == (lhs: Employee2, rhs: Employee2) -> Bool{
        // Iki Employee objesinin birbirine olan esitligini hangi kosullarda saglanacagini belirtiyoruz.
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
    
    
    static func < (lhs: Employee2, rhs: Employee2) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}

let employee1 = Employee2(firstName: "fname1", lastName: "fname1", jobTittle: "title1", phoneNumber: "phone1")
let employee2 = Employee2(firstName: "fname2", lastName: "fname2", jobTittle: "title2", phoneNumber: "phone2")
let employee3 = Employee2(firstName: "fname3", lastName: "fname3", jobTittle: "title3", phoneNumber: "phone3")
let employee4 = Employee2(firstName: "fname4", lastName: "fname4", jobTittle: "title4", phoneNumber: "phone4")
let employee5 = Employee2(firstName: "fname5", lastName: "fname5", jobTittle: "title5", phoneNumber: "phone5")

let employees = [employee2, employee1, employee4, employee5, employee3]

// sorted(by: )
// Arrayler uzerinde calisan bir siralama fonksiyonu. < isareti verdigimiz icin soyadini kucukten buyuge gore siralayacaktir.
let sortedEmployess = employees.sorted(by: <)

for employeee in employees {
    print(employeee)
}
print("-------")
for employee in sortedEmployess {
    print(employee)
}


// -------------------------------------------------------------
// Codable -> Bilginin 'Dictionary' formuna gecirilmesi (key-value ikilileri)


struct Employee3: Equatable, Comparable, Codable{
    
    // MARK: Functions
    var firstName: String
    var lastName: String
    var jobTittle: String
    var phoneNumber: String
    
    // MARK: Properties
    static func == (lhs: Employee3, rhs: Employee3) -> Bool{
        // Iki Employee objesinin birbirine olan esitligini hangi kosullarda saglanacagini belirtiyoruz.
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
    
    
    static func < (lhs: Employee3, rhs: Employee3) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}

let bestEmployee = Employee3(firstName: "Ben", lastName: "Atkins", jobTittle: "Front Desk", phoneNumber: "")

// Codable protokolunu destekleyen bir veri modelinden 'Dictionary' formunda veri olusturabilmek icin,
// JSONEncoder adini verdigimiz bir Class kullanilir.

let encoder = JSONEncoder()

let jsonData = try! encoder.encode(bestEmployee) // Disk'e yazilabilecek formata gecirme
let jsonString = String(data: jsonData, encoding: .utf8)
print(jsonString)


// -------------------------------------------------------------
// PROTOKOL OLUSTURMA

// Bir degiskenin degerini veya fonksiyonun ne yaptigini Protokoller belirtmez. Yalnizca isim ve tur belirtirler.
protocol FullyNamed {
    var fullName: String { get }  // get -> Yanlizca degeri okunabilir { get set } -> Degeri hem okunabilir hem yazilabilir.
    
    func sayFullName()
}

// : kullanimi her zaman inheritance (SuperClass) anlamina gelmeyebilir.
struct Person: FullyNamed {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) + \(lastName)"
    }
    
    func sayFullName() {
        print(fullName)
    }
    
}


// Design Pattern: Delegation

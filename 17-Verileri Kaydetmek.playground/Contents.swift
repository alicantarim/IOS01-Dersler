import UIKit

/*
 MVC = Farklı rolleri farklı sınıflara bölebilmek. View, Controller ve Modellere bölebilmek.
 Tüm datanın çok daha iyi bir şekilde yönetilebilmesini sağlamak. Aralarındaki iletişimi kuvvetli hale getirmek.
 
 */

// encodable -> Bir şeyi data formuna (1-0) sokmak. Bir şeyi encode ederken onun ne türden bir şeye encode edildiğini
// bilmek zorundayız. Elimizdeki modeli json, Plist vs formatına encode edebilirsiniz. decode edildiğinde (paket açıldığında)
// json, Plist vs gelecektir.
// decodable -> 1-0 oluşan datadan tekrar swift modeline dönüşmek


// MODEL: NOT UYGULAMASI

// Codable protokolü, hem Encodable hem de Decodable anlamına gelir.

// NOT: Codable protokolünü destekleyen modelinizde bulunan tüm değişken ve veri
// tiplerinizin de Codable protokolünü desteklemesi gerekir.
struct Note: Codable {
    var title: String
    var text: String
    var timestamp: Date  // Ne zaman oluşturulduğu bilgisi. UTC formatında ISO86 formatında encode ediliyor.
}
// Bir 'Note' nesnesi oluşturmak.
// Date() -> O anı verir.
let newNote = Note(title: "Alışverişte Alınacaklar Listesi", text: "Yoğurt, çay ve süt almayı unutma", timestamp: Date())


// MARK: - ENCODING
// Bir 'Note' nesnesinin 'plist' (propertyList) formatına encode edilmesi
// Elinizdeki bir nesneyi, hafızaya kaydetmek istiyorsanız onu Data formuna encode etmek zorundasınız.
// Encode dosya formatlarına örnek: JSON, Plist, MP3, MP4...

// PropertyListEncoder, Encodable protokolünü destekleyen herhangi bir nesneyi Data formuna encode eder.
let propertyListEncoder = PropertyListEncoder()

// Bu fonksiyon bir "throwingFunction". Dolayısıyla çalışma esnasında Error fırlatabilir.
// Bu tür fonksiyonlarda da catch bloğu içerisinde try kelimesi ile kullanılmalıdır.

// Yöntem 1: Fonksiyon çalıştığı esnada karşılaşılan hataları yakalamak isterseniz.
do {
    let encodedNote = try propertyListEncoder.encode(newNote)
}catch {
    // Size error adında bir değişken verir.
    // Bu error, do bloğu içerisinde çalışan kodları meydana gelen hataları belirtir.
    print(error)
}

// Yönetem 2: Hatanın bir önemi yok, yalnızca nil olmadığı durumu arıyorsanız.
if let encodedNote = try?  propertyListEncoder.encode(newNote) {
    print("ENCODING")
    print(encodedNote)
}


// MARK: - DECODING
if let encodedNote = try?  propertyListEncoder.encode(newNote) {
    let propertyListDecoder = PropertyListDecoder()
    
    // type: Hangi tür modele decode edilmesini istiyorsunuz?
    // from: Hangi datayı kullanarak bu işlem yapılacak
    // .self: Sınıfın tipini (type) ını belirtiyoruz.
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
        print("DECODING")
        print(decodedNote)
    }
}

// Sendboxing -> Bir programa yalnızca kendi kaynaklarına erişim izni vermek konsepti.
// Her program için yeni bir klasör oluşturulması ve programın yalnızca o klasöre izni vermek.
// Diğer dosyalara erişim için kullanıcıdan izin alması gerekiyor.


// MARK: - FILEMANAGER ile DOCUMENTs DIRECTORY KULLANIMI - VERİYİ KAYDETMEK

// Her uygulamanın kendi Document Directory'si vardır.
// Uygulamalar, yalnızca kendi klasörlerine veri yazabilir veya okuyabilir.
// Uygulamanın dilinde bir veriye ulaşmak istendiğinde bu durum mutlaka kullanıcıya bir alert ile bildirilir.

// urls: Klasör uzantısı Local veya Remote olabilir. Örn Local:Users\Alican\Desktop\....
// for: Siz hangi klasörü arıyorsunuz. .documentDirectory dosyaları kaydetmek için kullandığımız klasör
// .documentDirectory nin url lerini arıyor.

// Bir projenin birden fazla document directory'si olabilir. Fakat varsayılan olarak yalnızca 1 tane oluşturulur.
// Bu nedenle 'documentDirectory' bir array'dir ve biz ilk elemanına erişmek isteriz. (.first)
let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
// print(documentDirectory)

// 'documentDirectory' size bir klasör verir.
// Bu klasör içerisinde yeni bir dosya uzantısı oluşturmanız gerekiyor.

// ../Documents/notes.plist
// 'appendingPathExtension' notes dosyasına uzantı verir.
let singleNotesURL = documentDirectory.appendingPathComponent("singleNote").appendingPathExtension("plist")

print(singleNotesURL)


// MARK: - ENCODE EDİLMİŞ DATA'NIN FILEMANAGER ile OLUŞTURULMUŞ URL'e KAYIT EDİLMESİ

if let encodedNote = try?  propertyListEncoder.encode(newNote) {
    // Data'nın, belirtilen bir URL'e yazılmasını sağlar.
    // NOT: noFileProtection: Var olan dosyanın üzerine yazılmasını engellemez.
    print("WRITING FILE")
    try? encodedNote.write(to: singleNotesURL, options: .noFileProtection)
    
}


// MARK: - VERİYİ OKUMAK

// Data'nın özel bir init'i vardır;
// Data(contentsOf: ) -> parametre olarak vereceğiniz URL'de bulunan datayı kullanarak initialize edilmesi sağlanır.
let propertyListDecoder = PropertyListDecoder()

// Adım 1: Dosyayı data formatında okumak.
if let retrievedNoteData = try? Data(contentsOf: singleNotesURL) {
    print(retrievedNoteData)
    
    // Adım 2: propertyListDecoder kullanarak data'dan Note objesi oluşturmak.
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
        print("RETRIEVING NOT FILE")
        print(decodedNote)
    }
}


// MARK: - ARRAY TÜRÜNDEN VERİ KAYDETMEK (BİRDEN ÇOK NOT KAYDETMEK)

let note1 = Note(title: "Bahçe İşleri", text: "Çiçekleri sulamayı unutma", timestamp: Date())
let note2 = Note(title: "Ventence", text: "Yeni haberler yayına girecek.", timestamp: Date())

let notes = [note1, note2]

let notesURL = documentDirectory.appendingPathComponent("notes").appendingPathExtension("plist")

if let encodedNotes = try? propertyListEncoder.encode(notes) {
    try? encodedNotes.write(to: notesURL, options: .noFileProtection)
}


// MARK: - ARRAY TÜRÜNDE VERİ OKUMAK
if let notesData = try? Data(contentsOf: notesURL) {
    if let decodedNotes = try? propertyListDecoder.decode([Note].self, from: notesData) {
        print("RETRIEVING NOTES")
        for note in decodedNotes {
            print(note)
        }
    }
}

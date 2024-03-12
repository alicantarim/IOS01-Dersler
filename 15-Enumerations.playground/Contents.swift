import UIKit

// Statik sayida ve belli opsiyonlarin gruplanmis haline diyoruz.
// Birbiriyle iliskili ve sabit sayida olan opsiyon gruplarina enum diyoruz.

// Pusula da 4 tane yon var. Enum icin kurallara uyuyor/
// 1- Degismiyor
// 2- Isimleri sabit
// 3- Birbirleriyle iliskililer

// Enum olusturmak
// NOT1: Enum isimleri Struct'larda oldugu gibi buyuk harf ile baslar.
// NOT2: Case isimleri kucuk harf ile baslar.
// NOT3: Olusturulan bir enum objesine sonradan yeni Case'ler eklenemez.
// Sabit isimlerde ve sayidadir.

enum Yon {
    case kuzey
    case guney
    case dogu
    case bati
}

/*
 enum Yon {
    case kuzey, guney, dogu, bati
 }
 */

// Enum Kullanimi
var suankiYon = Yon.kuzey
let eskiYon: Yon = .guney

suankiYon = .dogu

// -------------------------------------------------------
// Kontrol Mekanizmalari ile Enum Kullanimi

switch suankiYon {
case .kuzey:
    print("Kuzey yonunde ilerliyorsunuz")
case .guney:
    print("Guney yonunde ilerliyorsunuz")
case .dogu:
    print("Dogu yonunde ilerliyorsunuz")
case .bati:
    print("Bati yonunde ilerliyorsunuz")
}

//  Enum Kullanimi ile Tip Guvenligi

struct Movie {
    var name: String
    var releaseYear: Int
    var genre: String
}

let movie1 = Movie(name: "Parazit", releaseYear: 2019, genre: "drama")
// Problem: Genre, bir standarda sahip degil. Drama, drama, dram, rama
// Genre bir enum olmali.

enum Kategori {
    case aksiyon
    case drama
    case belgesel
    // vb...
}

struct Film {
    var ad: String
    var cikisYili: Int
    var kategori: Kategori
}

let film1 = Film(ad: "Parazit", cikisYili: 2019, kategori: .drama)


// Enum'lar cogunlukla birseyin tipini ifade etmek icin tercih edilir.

enum KoltukTipi {
    case camKenari
    case orta
    case koridor
}

enum Cinsiyet {
    case erkek
    case kadin
    case belirtilmemis
}

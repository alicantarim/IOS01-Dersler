import UIKit

/*
func dogumGunuMuziginiCal() {
    if dogumGunuBugunMu {
        if !davetliListesi.isEmpty {
            if pastaUzerindekiMumHazirMi {
                Dogum gunu müziğini çalma zamanı...
            }
        }
    }
    
// Guard bir fonksiyonu bir işlemi sonlandırır.
    func dogumGunuMuziginiCal() {
        guard dogumGunuBugunMu else {              //Dogum günü bugün ise code  19. satırdandevam eder. Değilse guard a girer.
            Bugün kimsenin doğum günü değil.
            return
        }
        
        guard !davetliListesi.isEmpty else {
            Kimse partide değil
            return
        }
        
        guard pastaUzerindekiMumHazırMı else {
            Mumlar hazır değil.
            return
        }
        
        print("Doğum günün kutlu olsun")
    }
    
*/


/*
func divide(_ number: Double, by divisor: Double) {
    if divisor != 0 {
        let result = number / divisor
        print(result)
    }
}
*/

func divide(_ number: Double, by divisor: Double) {
    guard divisor != 0 else {
        print("0 ile bölünemez")
        return
    }
    let result = number / divisor
    print(result)
}

divide(15, by: 0)

// Guard with Optionals

struct Book {
    var title: String
    var price: Double
    var pages: Int
}

// Kütüphaneye kitap eklemek için kullanılıyor.
/*
func processBook(title: String?, price: Double?, pages: Int?) {
    if let thetitle = title, let theprice = price, let thepages = pages {
        let book = Book(title: title, price: price, pages: pages)
    }
}
*/

func processBook(title: String?, price: Double?, pages: Int?) {
    guard let theTitle = title, let thePrice = price, let thePages = pages else { return }
    
    let book = Book(title: theTitle, price: thePrice, pages: thePages)
}

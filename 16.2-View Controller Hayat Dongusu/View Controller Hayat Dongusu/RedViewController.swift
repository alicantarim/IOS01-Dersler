//
//  ViewController.swift
//  View Controller Hayat Dongusu
//
//  Created by Alican TARIM on 11.06.2023.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Hem Super clastaki kodlar hemde kendi kodlarinizi calistirmak istiyorsaniz
        // superclass'in tanimli versiyonunuda calistirmalisiniz. Bu sebepten super.viewDidLoad() eklemeliyiz.
        
        // Her sayfa icin yalnizca bir kez calisir.
        // Sayfaniz memory'ye yuklendikten hemen sonra calisir.
        // Arayuz elemanlarinin ve degiskenlerin kullanima artik hazir oldugunu belirtir.
        
        // Yeni arayuz elemanlarini programatik olarak olusturarak view hiyerarsisine ekleyebileceginiz fonksiyon.
        
        // Arayuz elemanlarinin ozelliklerini guncellemek icin uygun bir fonksyion
        print("RedViewController - View Did Load")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ViewDidLoad fonksiyonundan hemen sonra calisan fonksiyondur.
        // Sayfa her ekrana gelmek uzere oldugu zaman calisir.
        
        // Kullanim Ornegi:
        // Kullanicinin konumunu guncelleyen bir sayfa ise,
        // her acildiginda kullanicinin o anki konumunu gunceller.
        print("RedViewController - View Will Appear")

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // ViewWillAppear'dan hemen sonra calisan fonksiyondur.
        // Sayfa her ekrana geldikten sonra calisir.
        
        // Kullanim Ornegi:
        // Sayfa ekrana geldikten bir sure sonra ekranda bildirim gostermek isterseniz
        // ViewDidAppear dogru fonksiyondur.
        
        // Animasyon ile calisiyorsaniz animasyonlar bu fonksiyon ile baslatilmalidir.
        // Uzun bir network request varsa bu fonksiyon sonrasinda baslatilir.
        print("RedViewController - View Did Appear")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Sayfa ekrandan gitmek uzere oldugu zaman calisir.
        // Orn: NavigationController'da yeni bir sayfaya push edilecegi zaman.
        print("RedViewController - View Will Disappear")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // ViewWillDissapear fonksiyonundan sonra tektiklenir.
        // Bir ViewController'in hayat dongusunde calisan son fonksiyondur.
        // Sayfa, ekrandan tamamen gittigi zaman calisir.
        
        // Kullanim Ornegi:
        // Calmakta olan bir muzigin veya oynatikmakta olan bir videonun,
        // yeni bir sayfaya gecildikten sonra durdurulmasi istenirse
        // bu fonksiyon oldukca uygun bir zamandir.
        print("RedViewController - View Did Disappear")

    }

}


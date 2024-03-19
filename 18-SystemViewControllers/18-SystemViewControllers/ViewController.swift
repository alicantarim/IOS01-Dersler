//
//  ViewController.swift
//  18-SystemViewControllers
//
//  Created by Alican TARIM on 15.03.2024.
//

import UIKit
import SafariServices
// Kendi uygulamamızdan mail atabilmemizi sağlıyor.
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    // MARK: - UI Elements
    @IBOutlet var imageView: UIImageView!
    
    
    // MARK: - Properties
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Bu fonksiyon UIImagePicker trafından bir fotoğraf seçildiğinde veya çekildiğinde çalışır.
        
        // info: Bir Dictionary'dir ve seçilen veya çekilen medyanın kendisini ve hakkında detaylı bilgi verir.
        
        // Dictionary içerisinden, kullanıcının seçtiği görsele ulaşılır.
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        // Seçilen görseli imageView'a aktarmak.
        imageView.image = selectedImage
        
        // Bir viewController'ın ekrandan gitmesi için kullanılan fonksiyon: dismiss
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Actions
    @IBAction func shareButtonTapped (_ button: UIButton) {
        // Ekranda bulunan imageView'da bir görsel olduğundan emin oluyorsun.
        guard let image = imageView.image else { return }
        
        // Adım 1: ActivityController nesnesi oluşturmak.
        // activityItems: Paylaşılacak olan nesneler. (String, image, Int, URL vs..)
        // applicationActivities: Paylaşılacak olan nesnelerin hangi platformlarda paylaşılmasına
        // izin verileceği. Örn: (twitter,Messages,Email)  nil -> default'u gelir.
        
        // Bulunduğunuz Controller'da yeni bir Controller göstermek için kullanılır.
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped (_ button: UIButton) {
        if let url = URL(string: "https://apple.com") {
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        }
    }
    
    @IBAction func photosButtonTapped (_ button: UIButton) {
        let imagePickerController = UIImagePickerController()
        
        // ImagePickerController'ın yöneticisi olan sınıfın bu ViewController olduğunu belirtir.
        // Belirtmezseniz Delegate fonksiyonları çalışmayacaktır.
        imagePickerController.delegate = self
        
        
        
        // actionSheet: Ekranın altından gelen sayfa görünümü
        // alert: Ekranın ortasında beliren pop-up
        
        // Adım 1: AlertController oluşturmak
        let alertController = UIAlertController(title: "Görsel Kaynağı Seçin", message: nil, preferredStyle: .actionSheet)
        
        // Adım 2: Aksiyonları oluşturmak
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let cameraAction = UIAlertAction(title: "Kamera", style: .default) { action in
            // Kamera aksiyonu tetiklendiğinde bu kod bloğu çalışır.
            
            // Controller'ın nasıl açılacağını belirtir.
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        let photoLibrary = UIAlertAction(title: "Fotoğraf Galerisi", style: .default) { action in
            // Kamera aksiyonu tetiklendiğinde bu kod bloğu çalışır.
            
            // Controller'ın nasıl açılacağını belirtir.
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        // Adım 3: Oluşturulan aksiyonlar UIAlertController'a eklenir.
        // addAction fonksiyonu yeni bir action eklememizi sağlıyor.
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibrary)
        
        // Adım 4: Controller'ın ekranda gösterilmesi.
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func emailButtonTapped (_ button: UIButton) {
        // Öncelikle mail atılabilir bir ortamda olduğundan emin olmalıyız.
        // Örn: Simülatörler mail atamaz. Bu durumda uygulamanızın çökmemesi için bu kontrolü yapmalısınız.
        guard MFMailComposeViewController.canSendMail() else { return }
        
        // Adım 1: Controller oluşturmak.
        let mailComposer = MFMailComposeViewController()
        mailComposer.delegate = self
        
        // Mail alıcılarını ayarlayabilirsiniz.
        mailComposer.setToRecipients(["alicantarim@hotmail.com"])
        
        // Mail'in subject'ini ayarlayabilirisiniz.
        mailComposer.setSubject("Ekibinize dahil olmak istiyorum.")
        
        // Mail içeriğinide belirtebilirsiniz.
        mailComposer.setMessageBody("Merhaba ben Alican", isHTML: false)
        
        // Adım 2: Oluşturulan ViewController'ın ekranda gösterilmesi.
        present(mailComposer, animated: true, completion: nil)
        
    }


}


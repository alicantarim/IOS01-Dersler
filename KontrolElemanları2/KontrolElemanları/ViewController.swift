//
//  ViewController.swift
//  KontrolElemanları
//
//  Created by Alican TARIM on 6.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toogle: UISwitch!
    @IBOutlet var slider: UISlider!
    @IBOutlet var label1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = "Slider Value"
    }

    @IBAction func buttonTapped(_ button: UIButton) {
        print("Button was tapped!")
        
        if toogle.isOn {
            print("Switch is on!")
        }else {
            print("Switch is off!")
        }
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on!")
        }else {
            print("The switch is off!")
        }
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        print(slider.value)
        label1.text = String(slider.value)  //slider value float döndürdüğü için String'e çeviriyoruz.
    }
    
    @IBAction func keyboardReturnKeyTapped(_ textField: UITextField) {
        if let text = textField.text {
            print(text)
        }
    }
    
    @IBAction func textChangec(_ textField: UITextField) {
        if let text = textField.text {
            print(text)
        }
    }
    
    //TapGestureRecognizer -> Kullanıcının hangi noktaya dokunduğu bilgisinide verir. location fonksiyonu ile
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        // view -> Kullanıcının parmağını hangi view içerisinde arayayım diyor. Biz view içerisinde aradığımız için view veriyoruz. Eğer kullanıcının parmak hareketini butonun içinde veya slider da arıyor olsaydın buton veya slider verecektik.
        let touch = sender.location(in: view)
        view.endEditing(true) // Ekranda olan açık klavyeyi kapatmak için kullandığımız fonksiyon **ÖNEMLİ BİR BİLGİ
        print(touch)
    }

}


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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

}


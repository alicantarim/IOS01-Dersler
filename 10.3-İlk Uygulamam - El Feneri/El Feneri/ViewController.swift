//
//  ViewController.swift
//  El Feneri
//
//  Created by Alican TARIM on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //IB OUTLET ve DEĞİŞKENLER BURAYA YAZILIR.
    // IB OUTLERLER BUTONA HER AN ULAŞMAMIZI SAĞLAR.
    // MARK: - UI Element
    @IBOutlet var lightButton: UIButton!
    
    // MARK: - Properties
    var lightOn = true
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    //IB ACTION ve FONKSİYONLAR BURAYA YAZILIR.
    //IB ACTIONLAR SADECE BUTONA TIKLANDIĞINDA ÇALIŞIR.
    // MARK: - Actions
    @IBAction func buttonTapped(_ button: UIButton) {
        lightOn.toggle()  // Butonu tıkladın, true ise false, false ise true yapar.
        // lightOn = !=lightOn aynı şey.
        
        updateUI()
        
    }
    
    // MARK: - Functions
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black //Aşağıda if tek satır olduğu için bu şekilde kısalttık.
        
        /*
        if lightOn {
            //Işık açık olmalı
            view.backgroundColor = .white
            //lightButton.setTitle("Off", for: .normal)
        }else {
            // Işık kapalı olmalı
            view.backgroundColor = .black
            //lightButton.setTitle("On", for: .normal)
        }
        */
    }
    
}


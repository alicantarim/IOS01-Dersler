//
//  ViewController.swift
//  InterfaceBuilderTemelleri
//
//  Created by Alican TARIM on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let labelFrame = CGRect(x: 160, y: 400, width: 100, height: 20)
        let label = UILabel(frame: labelFrame)
        
        label.text = "Merhaba"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .blue
        
        view.addSubview(label)
    }
    
    @IBAction func buttonTapped(_ button: UIButton) {
        print("The button was tapped.")
    }

}


//
//  InputViewController.swift
//  Segue ve Navigation Controller
//
//  Created by Alican TARIM on 9.06.2023.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var seguerSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue.identifier -> Segue icin TC kimlik no
        // segue.destination -> Gidilecek sayfa
        segue.destination.navigationItem.title = textField.text
    }
    
    @IBAction func buttonTapped(_ button: UIButton) {
        if seguerSwitch.isOn {
            performSegue(withIdentifier: "goNext", sender: nil)
        }
    }


}

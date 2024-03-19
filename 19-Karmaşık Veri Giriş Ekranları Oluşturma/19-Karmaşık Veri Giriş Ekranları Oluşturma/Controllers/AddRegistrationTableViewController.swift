//
//  AddRegistrationTableViewController.swift
//  19-Karmaşık Veri Giriş Ekranları Oluşturma
//
//  Created by Alican TARIM on 19.03.2024.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    //MARK: - UI Elements
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    
    //MARK: - Properties

    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Functions

    
    //MARK: - Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem) {
        
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailTextField.text!
        
        print("Done Tapped")
        print("firstName: \(firstName)")
        print("lastName: \(lastName)")
        print("email: \(email)")
    }

}

//
//  OrangeViewController.swift
//  TabBarController
//
//  Created by Alican TARIM on 11.06.2023.
//

import UIKit

class OrangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.badgeValue = "5"
        tabBarItem.badgeColor = .systemIndigo

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

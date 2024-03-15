//
//  RedViewController.swift
//  TabBarController
//
//  Created by Alican TARIM on 11.06.2023.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Programatik olarak tabBarItem'larin badge degerleri degistirilebilir.
        tabBarItem.badgeValue = "2"
        tabBarItem.badgeColor = .systemIndigo
        // Badge'in gorunmemesini istiyorsaniz degerini 'nil' olarak atamalisiniz.
        //tabBarItem.badgeValue = nil
        
    }
    


}

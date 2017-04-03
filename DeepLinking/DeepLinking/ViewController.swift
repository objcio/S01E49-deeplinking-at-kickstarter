//
//  ViewController.swift
//  DeepLinking
//
//  Created by Florian Kugler on 03-04-2017.
//  Copyright © 2017 objc.io. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    enum Tab: Int {
        case tab1 = 0
        case tab2 = 1
    }
    
    func showTab(_ tab: Tab) {
        selectedIndex = tab.rawValue
    }
    
    @IBAction func showModal(sender: Any) {
        let modal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Modal")
        present(modal, animated: true, completion: nil)
    }
    
    @IBAction func returnFromModal(segue: UIStoryboardSegue) {
    
    }
    
}


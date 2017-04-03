//
//  ViewController.swift
//  TriggerDeepLink
//
//  Created by Florian Kugler on 03-04-2017.
//  Copyright © 2017 objc.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tab1(_ sender: Any) {
        UIApplication.shared.open(URL(string: "io.objc.deeplinking://tab1")!)
    }

    @IBAction func tab2(_ sender: Any) {
        UIApplication.shared.open(URL(string: "io.objc.deeplinking://tab2")!)
    }

    @IBAction func modal(_ sender: Any) {
        UIApplication.shared.open(URL(string: "io.objc.deeplinking://modal")!)
    }
}


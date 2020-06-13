//
//  ViewController.swift
//  PandaFarmCompanion
//
//  Created by Chris on 13/06/2020.
//  Copyright © 2020 Chris78. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wifiButton: UIButton!
    @IBOutlet weak var settingsTextField: UITextField!
    @IBAction func wifiAction(_ sender: Any) {
        openSettings("WIFI")
    }
    @IBAction func testAction(_ sender: Any) {
        openSettings("\(settingsTextField.text!)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func openSettings(_ pref: String) {
        if #available(iOS 13, *) {
            UIApplication.shared.open(URL(string: "App-prefs:\(pref)")!)
        } else {
            UIApplication.shared.open(URL(string: "App-prefs:root:\(pref)")!)
        }
    }
}


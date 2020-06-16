//
//  ViewController.swift
//  PandaFarmCompanion
//
//  Created by Chris on 13/06/2020.
//  Copyright © 2020 Chris78. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var wifiButton: UIButton!
    @IBOutlet weak var settingsTextField: UITextField!
    @IBAction func wifiAction(_ sender: Any) {
        openSettings("WIFI")
    }
    @IBAction func generalSettingsAction(_ sender: Any) {
        openSettings("General")
    }
    @IBAction func testAction(_ sender: Any) {
        openSettings("\(settingsTextField.text!)")
    }
    @IBOutlet weak var browserTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingsTextField.delegate = self
        browserTextField.delegate = self
    }

    func openSettings(_ pref: String) {
        if #available(iOS 13, *) {
            UIApplication.shared.open(URL(string: "App-prefs:\(pref)")!)
        } else {
            UIApplication.shared.open(URL(string: "App-prefs:root=\(pref)")!)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case settingsTextField:
            openSettings(textField.text ?? "")
        case browserTextField:
            if let url = URL(string: textField.text ?? "") {
                UIApplication.shared.open(url)
            }
        default:
            break
        }

        return true
    }
}


//
//  ViewController.swift
//  Horoscope-Lab
//
//  Created by Liana Norman on 9/24/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Oulets
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOutlet.delegate = self
    }
    
    // MARK: Actions
    @IBAction func datePicker(_ sender: UIDatePicker) {
    }
    
   
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let name = textField.text {
            welcomeLabel.text = "Welcome \(name)!"
            textField.text = ""
        }
        return true
    }
}

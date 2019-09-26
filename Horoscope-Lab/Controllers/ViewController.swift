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
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var signLabel: UILabel!
    
    // MARK: Properties
    var picker = ArraySigns.signs
    
    var userName: String = "" {
        didSet {
            UserDefaultsWrapper.standard.store(userName: userName)
        }
    }
    var userSign: String = "" {
        didSet {
            UserDefaultsWrapper.standard.store(userSign: userSign)
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOutlet.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // MARK: Actions
    @IBAction func buttonPressed(_ sender: Any) {
        let userHoroscopeVC = storyboard?.instantiateViewController(withIdentifier: "UserHoroscopeVC") as! UsersHoroscopeViewController
       userHoroscopeVC.sign = signLabel.text!
        navigationController?.pushViewController(userHoroscopeVC, animated: true)
    }
    
    // MARK: Controller Navigation
    
    
    
}

// MARK: Extensions
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let name = textField.text {
            welcomeLabel.text = "Welcome \(name)!"
            textField.text = ""
        }
        return true
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.count
    }
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        signLabel.text = picker[row]
        UserDefaultsWrapper.standard.store(userSign: picker[row])
    }
}

//
//  UsersHoroscopeViewController.swift
//  Horoscope-Lab
//
//  Created by Liana Norman on 9/25/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class UsersHoroscopeViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var birthdayDateLabel: UILabel!
    @IBOutlet weak var astroSignLabel: UILabel!
    @IBOutlet weak var horoscopeLabel: UITextView!
    
    // MARK: Properties
    var sign = ""
    var userHoroscope: Horoscope! {
        didSet {
            astroSignLabel.text = userHoroscope.sunsign
            horoscopeLabel.text = userHoroscope.horoscope
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: Private Methods
    func setupViews() {
        HoroscopeAPIManager.shared.getHoroscope(astroSign: UserDefaultsWrapper.standard.getUserSign()!) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let horoscopeFromOnline):
                self.userHoroscope = horoscopeFromOnline
            }
        }
    }
    
}

//
//  bioViewController.swift
//  HomeWorkProject_2.4
//
//  Created by Максим on 17.07.2021.
//

import UIKit

class BioViewController: UIViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    
    // MARK: Public Properties
    
    var user: User!
    
    // MARK: Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = user.person.firstName + " " + user.person.lastName
        firstNameLabel.text = user.person.firstName
        lastNameLabel.text = user.person.lastName
        sexLabel.text = user.person.sex.rawValue
        ageLabel.text = String(user.person.age)
        currentCityLabel.text = user.person.currentCity
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutMeViewController =
                segue.destination as? AboutMeViewController else { return }
        aboutMeViewController.user = user
    }
    
}

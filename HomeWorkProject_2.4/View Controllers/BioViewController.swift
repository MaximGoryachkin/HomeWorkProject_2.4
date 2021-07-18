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
    
    var person: Person?
    
    // MARK: Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let person = person else { return }
        
        navigationItem.title = person.firstName + " " + person.lastName
        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
        sexLabel.text = person.sex.rawValue
        ageLabel.text = String(person.age)
        currentCityLabel.text = person.currentCity
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutMeViewController =
                segue.destination as? AboutMeViewController else { return }
        aboutMeViewController.person = person
    }
    
}

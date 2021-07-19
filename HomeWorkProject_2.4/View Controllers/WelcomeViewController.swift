//
//  WelcomeViewController.swift
//  HomeWorkProject_2.4
//
//  Created by Максим on 16.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: IB Outlets

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var outButton: UIButton!
    
    // MARK: Public properties
    
    var user: User!
    
    // MARK: Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome,\n \(user.person.firstName + " " + user.person.lastName)!"
        emojiLabel.text = user.person.sex.rawValue
    }

}

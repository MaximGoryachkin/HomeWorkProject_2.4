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
    
    var label: String?
    var emoji: String?
    
    // MARK: Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let label = label, let emoji = emoji else { return }
        welcomeLabel.text = "Welcome,\n \(label)!"
        emojiLabel.text = emoji
    }

}

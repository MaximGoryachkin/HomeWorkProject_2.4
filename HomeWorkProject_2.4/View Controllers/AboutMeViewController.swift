//
//  AboutMeViewController.swift
//  HomeWorkProject_2.4
//
//  Created by Максим on 17.07.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet var photo: UIImageView!
    
    // MARK: Public properties
    
    var user: User!
    
    // MARK: Private properties
    
    private var hobbys: [String] = []
    
    // MARK: Override methods

    override func viewDidLoad() {
        super.viewDidLoad()

        createArray()
        fillingInfo()
        getLogo()
    }
    
    // MARK: Private methods
    
    private func createArray() {
        guard let user = user else { return }
        
        for hobby in user.person.hobby {
            hobbys.append(hobby.rawValue)
        }
    }
    
    private func fillingInfo() {
        guard let user = user else { return }
        
        infoLabel.text = """
            My name is \(user.person.firstName) \(user.person.lastName). I'm \(user.person.age) years old. Now I live in \(user.person.currentCity). I have a \(user.person.education.rawValue) education. My hobbie is \(hobbys.joined(separator: ", ")). Color of my eyes is \(user.person.eyeColor.rawValue)
            
            """
    }
    
    private func getLogo() {
        guard let user = user else { return }
        
        photo.image = UIImage(named: user.person.photoName)
    }

}

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
    
    var person: Person?
    
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
        guard let person = person else { return }
        
        for hobby in person.hobby {
            hobbys.append(hobby.rawValue)
        }
    }
    
    private func fillingInfo() {
        guard let person = person else { return }
        
        infoLabel.text = """
            My name is \(person.firstName) \(person.lastName). I'm \(person.age) years old. Now I live in \(person.currentCity). I have a \(person.education.rawValue) education. My hobbie is \(hobbys.joined(separator: ", ")). Color of my eyes is \(person.eyeColor.rawValue)
            
            """
    }
    
    private func getLogo() {
        guard let person = person else { return }
        
        photo.image = UIImage(named: person.photoName)
    }

}

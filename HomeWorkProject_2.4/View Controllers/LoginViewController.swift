//
//  MainViewController.swift
//  HomeWorkProject_2.4
//
//  Created by Максим on 16.07.2021.
//

import UIKit

let user = User(login: "M",
                password: "123",
                persons: person)
let person = Person.getPerson()[0]

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var inButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // MARK: Private Properties
    
    private let login = user.login
    private let password = user.password
    
    // MARK: Override methods
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        let tabBarViewController = segue.destination as? UITabBarController
        
        guard let viewControllers = tabBarViewController?.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeViewController = viewController as? WelcomeViewController {
                welcomeViewController.label = person.firstName + " " + person.lastName
                welcomeViewController.emoji = person.sex.rawValue
            } else if let navigationViewController =
                        viewController as? UINavigationController {
                let aboutUserViewController =
                    navigationViewController.topViewController as! BioViewController
                aboutUserViewController.person = person
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        super.touchesBegan(touches,with: event)
        view.endEditing(true)
    }
    
    // MARK: IB Actions
    
    @IBAction func joinAction() {
        if loginTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "segue", sender: nil)
        } else {
            showAlert(title: "Alarm!",
                      massage: "Enter correct User Name or Password",
                      textField: passwordTextField)
        }
    }
    
    @IBAction func loginAlert() {
        showAlert(title: "Reminder!",
                  massage: "Your user name is \(login)",
                  textField: passwordTextField)
    }
    
    @IBAction func passwordAlert() {
        showAlert(title: "Reminder!",
                  massage: "Your password is \(password)",
                  textField: passwordTextField)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: Public methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            joinAction()
        }
        return true
    }
    
}

// MARK: Extensions

extension LoginViewController {
    private func showAlert(title: String,
                           massage: String,
                           textField: UITextField?) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK",
                                        style: .cancel) { _ in
            textField?.text = ""
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
}



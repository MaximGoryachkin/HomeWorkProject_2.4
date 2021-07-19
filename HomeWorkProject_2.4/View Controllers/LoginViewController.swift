//
//  MainViewController.swift
//  HomeWorkProject_2.4
//
//  Created by Максим on 16.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var inButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // MARK: Private Properties
    
    private let user = User(login: "M",
                    password: "123",
                    person: Person.getPerson())
    
    // MARK: Override methods
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        let tabBarViewController = segue.destination as? UITabBarController
        
        guard let viewControllers = tabBarViewController?.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeViewController = viewController as? WelcomeViewController {
                welcomeViewController.user = user
            } else if let navigationViewController =
                        viewController as? UINavigationController {
                let bioViewController =
                    navigationViewController.topViewController as! BioViewController
                bioViewController.user = user
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
        if loginTextField.text == user.login && passwordTextField.text == user.password {
            performSegue(withIdentifier: "segue", sender: nil)
        } else {
            showAlert(title: "Alarm!",
                      massage: "Enter correct User Name or Password",
                      textField: passwordTextField)
        }
    }
    
    @IBAction func loginAlert() {
        showAlert(title: "Reminder!",
                  massage: "Your user name is \(user.login)",
                  textField: passwordTextField)
    }
    
    @IBAction func passwordAlert() {
        showAlert(title: "Reminder!",
                  massage: "Your password is \(user.password)",
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



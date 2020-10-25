//
//  ViewController.swift
//  AboutMe
//
//  Created by User on 23.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Actions
    @IBAction func logInButtonPressed() {
        
        let authorizationData = User.getAutorizationData()
        
        guard let userName = userNameTextField.text,
            let password = passwordTextField.text else { return }
        
        guard userName == authorizationData.name &&
            password == authorizationData.password else {
                
                let title = "Invalid login or password"
                let message = "Please enter correct login and password"
                presentAlert(title: title, message: message)
                passwordTextField.text = ""
                return
        }
        performSegue(withIdentifier: "toTabBarController", sender: nil)
    }
    
    @IBAction func ForgotButtonsPressed(_ sender: UIButton) {
        
        let authorizationData = User.getAutorizationData()
        
        let title = "Oooops!"
        let message = sender.tag == 0
            ? "Your name is \"\(authorizationData.name)\""
            : "Your password is \"\(authorizationData.password)\""
        presentAlert(title: title, message: message)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        
        guard let destinationVC = tabBarController.viewControllers?.first as?
            WelcomeViewController else { return }
        destinationVC.userName = userNameTextField.text ?? ""
        
        guard let navController = tabBarController.viewControllers?[1] as?
            UINavigationController else { return }
        guard let galleryVC = navController.viewControllers.first as?
            GalleryViewController else { return }
        galleryVC.name = User.getAutorizationData().name
        galleryVC.surname = User.getAutorizationData().surname
    }
}

// MARK: - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField {
            userNameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
            logInButtonPressed()
        }
        return true
    }
}

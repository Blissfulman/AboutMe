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
    
    // MARK: - Properties
    let user = User.getUser()
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Actions
    @IBAction func logInButtonPressed() {
                
        guard let userName = userNameTextField.text,
            let password = passwordTextField.text else { return }
        
        guard userName == user.name &&
            password == user.password else {
                
                let title = "Invalid login or password"
                let message = "Please enter correct login and password"
                presentAlert(title: title, message: message)
                passwordTextField.text = ""
                return
        }
        performSegue(withIdentifier: "toTabBarController", sender: nil)
    }
    
    @IBAction func forgotButtonsPressed(_ sender: UIButton) {
                
        let title = "Oooops!"
        let message = sender.tag == 0
            ? "Your name is \"\(user.name)\""
            : "Your password is \"\(user.password)\""
        presentAlert(title: title, message: message)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        
        guard let welcomeVC = tabBarController.viewControllers?.first as?
            WelcomeViewController else { return }
        welcomeVC.userName = user.name
        
        guard let navController = tabBarController.viewControllers?[1] as?
            UINavigationController else { return }
        guard let galleryVC = navController.viewControllers.first as?
            GalleryViewController else { return }
        galleryVC.name = user.name
        galleryVC.surname = user.surname
        galleryVC.namesOfPhotos = user.namesOfPhotos
    }
}

// MARK: - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}

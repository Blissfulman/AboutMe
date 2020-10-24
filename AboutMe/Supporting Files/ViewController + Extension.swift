//
//  ViewController + Extension.swift
//  AboutMe
//
//  Created by User on 24.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}

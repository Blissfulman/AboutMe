//
//  MeViewController.swift
//  AboutMe
//
//  Created by User on 24.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var welcomeStackView: UIStackView!
    
    // MARK: - Properties
    var userName = ""
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        welcomeAnimation(view: welcomeStackView)
    }
    
    // MARK: - Navigation
    @IBAction func logOutPressed() {
        dismiss(animated: true)
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemIndigo.cgColor, UIColor.systemPurple.cgColor]
        gradientLayer.opacity = 0.7
        gradientLayer.frame = view.frame
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
    // MARK: - Private methods
    private func welcomeAnimation(view: UIView) {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [0, 1.4, 0.7, 1.2, 1]
        animation.keyTimes = [0, 0.4, 0.7, 0.85, 1]
        animation.duration = 1
        view.layer.add(animation, forKey: nil)
    }
}

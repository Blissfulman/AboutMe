//
//  PhotoViewController.swift
//  AboutMe
//
//  Created by User on 25.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    // MARK: - Properties
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    convenience init(image: UIImage) {
        self.init()
        imageView.image = image
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        setupLayout()
    }
    
    // MARK: - Setup layout
    private func setupLayout() {
        let constraints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

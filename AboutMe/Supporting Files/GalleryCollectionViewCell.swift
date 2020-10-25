//
//  GalleryCollectionViewCell.swift
//  AboutMe
//
//  Created by User on 24.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellImageView: UIImageView!
    
    func configure(image: UIImage) {
        cellImageView.image = image
    }
}

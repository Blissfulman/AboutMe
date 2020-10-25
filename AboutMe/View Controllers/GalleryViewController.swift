//
//  GalleryViewController.swift
//  AboutMe
//
//  Created by User on 24.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var galleryCollectionView: UICollectionView!
    
    // MARK: - Properties
    var name = ""
    var surname = ""
    
    private var photos = [UIImage]()
    private let columnNumber: CGFloat = 3
    private let spacing: CGFloat = 2
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        galleryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        setupUI()
        getPhotos()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        titleLabel.text = """
        Hi! I'm \(name) \(surname).
        This is my photo gallery.
        """
    }
    
    // MARK: - Private methods
    private func getPhotos() {
        User.getNamesOfPhotos().forEach {
            if let image = UIImage(named: "\($0)") {
                photos.append(image)
            }
        }
    }
}

// MARK: - CollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell",
                                                             for: indexPath) as! GalleryCollectionViewCell
        cell.configure(image: photos[indexPath.item])
        return cell
    }
}

// MARK: - CollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    
    // Открытие выбранного фото на весь экран
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoVC = PhotoViewController(image: photos[indexPath.item])
        navigationController?.pushViewController(photoVC, animated: true)
    }
}

// MARK: - CollectionViewLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let galleryWidth = galleryCollectionView.bounds.width
        let size = (galleryWidth - (spacing * (columnNumber - 1))) / columnNumber
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
}

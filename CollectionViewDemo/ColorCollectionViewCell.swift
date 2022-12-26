//
//  ColorCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by İrem Karaoğlu on 20.12.2022.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var innerView: UIView!

    func setup(backgroundColor: UIColor, innerBackgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.innerView.backgroundColor = innerBackgroundColor
        self.layer.cornerRadius = 8
        self.innerView.layer.cornerRadius = 8
    }
}

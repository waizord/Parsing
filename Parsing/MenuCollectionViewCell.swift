//
//  MenuCollectionViewCell.swift
//  Parsing
//
//  Created by Indoril Nerevar on 6/5/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let image = menu?.imageName {
                imageView.image = UIImage(named: image)
                
            }
        }
    }
    
}



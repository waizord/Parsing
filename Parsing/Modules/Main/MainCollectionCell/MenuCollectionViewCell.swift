//
//  MenuCollectionViewCell.swift
//  Parsing
//
//  Created by Ivan on 8/11/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let image = menu?.image{
                imageView.image = UIImage(data: image)
                
            }
        }
    }
    
}

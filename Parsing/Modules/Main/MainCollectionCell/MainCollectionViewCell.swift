//
//  MainCollectionViewCell.swift
//  Parsing
//
//  Created by Ivan on 8/11/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

//class MainCollectionViewCell: UICollectionViewCell {
//
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//
//    var menu: Menu? {
//        didSet {
//            nameLabel.text = menu?.name
//            if let image = menu?.image{
//                imageView.image = UIImage(data: image)
//
//            }
//        }
//    }
//
//}
protocol MainTableViewCellProtocol {
    func displayData()
    func displayTitle(title: String?)
    func displaySubtitle(subTitle: String?)
    func displayPrice(price: Int?)
    func displayAllData(title: String?, subTitle: String?, price: Int?, imageUrlStrin: String?)
    func displayImage(imageUrlString: String?)
    
}
class MainTableViewCell: UITableViewCell {
    
    
}

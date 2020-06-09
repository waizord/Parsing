//
//  DetailViewController.swift
//  Parsing
//
//  Created by Indoril Nerevar on 6/6/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            guard let image = menu?.imageName else {return}
            imageView.image = UIImage(data: image)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = menu?.name
        }
    }
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var machinelocationLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    
    var menu: Menu?

    override func viewDidLoad() {
        super.viewDidLoad()


    }


}

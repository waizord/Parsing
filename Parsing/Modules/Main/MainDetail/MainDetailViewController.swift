//
//  MainDetailViewController.swift
//  Parsing
//
//  Created by Indoril Nerevar on 6/6/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class MainDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            guard let image = menu?.image else {return}
            imageView.image = UIImage(data: image)
        }
    }
    
    @IBOutlet weak var manufacturerLabel: UILabel! {
        didSet {
            manufacturerLabel.text = menu?.name
        }
    }
    
    @IBOutlet weak var typeLabel: UILabel! {
        didSet{
            typeLabel.text = menu?.type
        }
    }
    @IBOutlet weak var machinelocationLabel: UILabel! {
        didSet {
            machinelocationLabel.text = menu?.machinelocation
        }
    }
    @IBOutlet weak var modelLabel: UILabel! {
        didSet {
            modelLabel.text = menu?.model
        }
    }
    
    var menu: Menu?

    override func viewDidLoad() {
        super.viewDidLoad()


    }


}

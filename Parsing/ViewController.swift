//
//  ViewController.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let json = Json()
    let identifire = "menuCell"
    var imageMenuArray: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "STATERS"
        blankMenu.imageName = "STR"
        
        var blankMenu1 = Menu()
        blankMenu.name = "STATER"
        blankMenu.imageName = "STR"
        return [blankMenu, blankMenu1]
    }()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        json.parsing()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = imageMenuArray[indexPath.row]
            
            return itemCell
        }
        
        return MenuCollectionViewCell()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (view.frame.width - 20)/3
//        return CGSize(width: width, height: width)
//    }
    
}

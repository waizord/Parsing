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
    let segue = "showVC"
    
    var imageMenuArray: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "STATERS"
        blankMenu.imageName = "STR-1"

        var blankMenu1 = Menu()
        blankMenu.name = "STATER"
        blankMenu.imageName = "STR"
        
        var blankMenu2 = Menu()
        blankMenu.name = "STATEasdasda"
        blankMenu.imageName = "STR"
        return [blankMenu, blankMenu1, blankMenu2]
    }()


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var namelanel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        json.parsing()
        collectionView.dataSource = self
        collectionView.delegate = self
       // fixImageFromUrl()
        
        
    }
    
    // to get elemets viewController -> detailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                
                // test print
                print(menu ?? "nil")
                
                vc.menu = menu
            }
        }
    }
    
//    func fixImageFromUrl(){
//        for one in json.video1 {
//            if let url = URL(string: one){
//                if let data = try? Data(contentsOf: url) {
//                    self.imageMenuArray.append(.init(name:"rr", imageName: data))
//                    print(imageMenuArray)
//                }
//            }
//
//        }
//    }
    

    
}

// MARK: Extension

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
    
    // choice size image
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 50
        return CGSize(width: width, height: width)
    }
    
    // didSelected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = imageMenuArray[indexPath.row]
        self.performSegue(withIdentifier: segue, sender: menu)
    }
    
}

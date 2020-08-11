//
//  MainViewController.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let json = Json()
    
    let identifire = "menuCell"
    let segue = "showVC"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var namelanel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        json.parsing {
            // main stream
            DispatchQueue.main.async {
                self.collectionView.dataSource = self
                self.collectionView.delegate = self
            }
        }
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
    
}

// MARK: - Extension

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = json.menu[indexPath.row]
            
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
        let menu = json.menu[indexPath.row]
        self.performSegue(withIdentifier: segue, sender: menu)
    }
    
}

//
//  MainViewPresenter.swift
//  Parsing
//
//  Created by Ivan on 8/11/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation
protocol MainPresenterProtocol {
    init(view: MainViewControllerProtocol)
    
    func getCountOfRow() -> Int
    func configurateCell(_ cell: MainTableViewCellProtocol, index: IndexPath)
    func pressCell(atIndex index: Int)
}
class MainViewPresenter: MainPresenterProtocol{
    var view: MainViewControllerProtocol
    
    required init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    func getCountOfRow() -> Int {
    return 1
    }
    func configurateCell(_ cell: MainTableViewCellProtocol, index: IndexPath) {
        
    }
    
    func pressCell(atIndex index: Int) {
    
    }
    
    
}

//
//  ParsingJson.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation

class Json {
    
    var menu = [Menu]()
    //usebility elements for that menu
    var id = [String]()
    var manufacturer = [String]()
    var type = [String]()
    var machinelocation = [String]()
    var images = [Data]()
    
    var imageUrlArray = [String]()
    
    
    // Creat json object
    func parsing(completionHandler: (() -> Void)?){
        
        let url = URL(string: "http://q11.jvmhost.net/vmc_json")
        let urlRequest = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: .zero)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil,
                let responseData = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [Dictionary<String, Any>]
                else {return}
            
            //handle object
            //print(jsonObject)
            self.addingInToArrays(jsonObject)
            self.putingElementsInMenu()
            
            // need for check load JSON
            completionHandler?()
        }
        dataTask.resume()
    }
    
    func addingInToArrays( _ jsonObject: [Dictionary<String, Any>]) {

        for dict in jsonObject {
            if let id = dict["id"] {
                self.id.append(String(id as! Int) )
            }
            if let manufacturer = dict["manufacturer"] {
                self.manufacturer.append(manufacturer as! String)
            }
            if let type = dict["type"] {
                self.type.append(type as! String)
            }
            if let machinelocation = dict["machinelocation"] {
                self.machinelocation.append(machinelocation as! String)
            }
            if let urlImage = dict["video1"] {
                self.imageUrlArray.append(urlImage as! String)
            }
            //check array
            print(id, manufacturer, type, machinelocation, images)
        }
    }
    
    func putingElementsInMenu () {
        let names = manufacturer
        let imagesUrl = self.imageUrlArray
        let count = id.count - 1
        for index in 0...count{
            let data = fixImageFromUrl(imagesUrl[index])
            menu.append(Menu(name: names[index], imageName: data)) 
        }
    }
    
    //convert image URL Into Data elements
    func fixImageFromUrl( _ imageUrl: String) -> Data {
                if let url = URL(string: imageUrl){
                    if let data = try? Data(contentsOf: url) {
                        return data
                }
            }
        return Data()
        }
}


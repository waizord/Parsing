//
//  ParsingJson.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation

class Json {
    
    var jsonObject = [Dictionary<String, Any>]()
    //usebility elements for that menu
    var id = [String]()
    var manufacturer = [String]()
    var type = [String]()
    var machinelocation = [String]()
    var video1 = [String]()
    
    
    
    // Creat json object
    func parsing() {
        
        let url = URL(string: "http://q11.jvmhost.net/vmc_json")
        let urlRequest = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil,
                let responseData = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [Dictionary<String, Any>]
                else {
                    //handle error if needed
                    return
            }
            //handle object
            //print(jsonObject)
            // print json to console
            //self.addingInToArrays(jsonObject)
            self.jsonObject = jsonObject
            self.addingInToArrays()
        }
        dataTask.resume()
    }
    
    func addingInToArrays() {

        for dict in self.jsonObject {
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
                self.video1.append(urlImage as! String)
            }
            //check array
            print(id, manufacturer, type, machinelocation, video1)
        }
    }
}


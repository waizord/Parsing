//
//  ParsingJson.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation

class Json {
    
    //usebility elements for that menu
    var spindlenose = [String]()
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
            self.addingInArrays(jsonObject)
        }
        dataTask.resume()
    }
    
    func addingInArrays(_ jsonObject: [Dictionary<String, Any>]) {

        for dict in jsonObject {
            
            if let spindlenose = dict["spindlenose"] as? String {
                self.spindlenose.append(spindlenose)
            }else {return}
            if let manufacturer = dict["manufacturer"] as? String {
                self.manufacturer.append(manufacturer)
            }else{return}
            if let type = dict["type"] as? String {
                self.type.append(type)
            }else{return}
            if let machinelocation = dict["machinelocation"] as? String {
                self.machinelocation.append(machinelocation)
            }
            if let video1 = dict["video1"] as? String {
                self.video1.append(video1)
            }
            
        }
    }
}


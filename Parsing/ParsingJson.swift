//
//  ParsingJson.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation

class Json {
    
    

    // Creat json object
    func parse() {
        
        let url = URL(string: "http://q11.jvmhost.net/vmc_json")
        let urlRequest = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil,
                let responseData = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) else {
                //handle error if needed
                return
            }
            //handle object
            //print(jsonObject)
            //self.convertInArray(jsonObject)
            self.parsing(self.convertInArray(jsonObject))
            
            
        }
        dataTask.resume()
    }
    func convertInArray(_ jsonObject: Any) -> [Any]{
        let json = jsonObject as! [Any]
        //print(json.count)
        return json
        
    }
    
    func parsing(_ array: [Any]) {
        var new: Dictionary<String, Any>?
        for i in array {
            let ii = i as! Dictionary<String, Any>
            new = ii
            
            
            print(new!.keys)
        }
        

    }
}


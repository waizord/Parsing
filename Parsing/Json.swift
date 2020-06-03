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
    func parsing() {
        
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
            // print json to console
            self.convertInArray(jsonObject)
        }
        dataTask.resume()
    }
    
    func convertInArray(_ jsonObject: Any) -> [Dictionary<String, Any>] {
        let json = jsonObject as! [Dictionary<String, Any>]
        //checking json keys
        for dict in json {
            
            //print(JsonKeys.id)
        }
        return json
    }
    
        

    
}


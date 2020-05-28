//
//  ParsingJson.swift
//  Parsing
//
//  Created by Indoril Nerevar on 5/28/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation

struct ParsingJson {
    
    func parse() {
        let url = URL(string: "http://q11.jvmhost.net/vmc_json")
        let urlRequest = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            guard error == nil,
                let responseData = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) else {
                //handle error if needed
                return
            }
            //handle object
            print(jsonObject)
        }
        dataTask.resume()
    }
}


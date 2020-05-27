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
        let session = URLSession(configuration: .default)
        
        let downloadTask = session.downloadTask(with: url!)
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "data.json"
        let urlPath = URL(fileURLWithPath: path)
        print(urlPath)
        
        downloadTask.resume()
        
    }
}


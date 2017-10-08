//
//  HttpService.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 07/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class HttpService: NSObject {
    static func post(_ data: [String: Any], to url: URL, then callback: ((Data?, URLResponse?, Error?) -> Void)!) -> Void {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = serialize(data).data(using: String.Encoding.utf8)
        
        session
            .dataTask(with: request, completionHandler: { (data, resp, err) in
                DispatchQueue.main.async {
                    callback(data, resp, err)
                }
            })
            .resume()
    }
    
    static func serialize(_ data: [String: Any?]) -> String {
        var items:[String] = []
        
        for (key, val) in data {
            if let value = val {
                let query = URLQueryItem(name: key, value: (value as! String))
                items.append("\(query.name)=\(query.value!)")
                
            }
        }
        
        return items.joined(separator: "&")
    }
}

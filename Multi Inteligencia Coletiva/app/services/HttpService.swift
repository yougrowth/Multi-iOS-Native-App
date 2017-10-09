//
//  HttpService.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 07/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

typealias HttpRequestCallback = ((Data?, URLResponse?, Error?) -> Void)!

class HttpService: NSObject {
    static func post(_ data: [String: Any], to url: URL, then callback: HttpRequestCallback, requireAuth auth: Bool = false) -> Void {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = serialize(data).data(using: String.Encoding.utf8)
        
        if (auth) {
            let defaults = UserDefaults.standard
            request.setValue(defaults.string(forKey: "session")!, forHTTPHeaderField: "Authorization")
        }
        
        session
            .dataTask(with: request, completionHandler: { (data, resp, err) in
                DispatchQueue.main.async {
                    callback(data, resp, err)
                }
            })
            .resume()
    }
    
    static func get(from url: URL, then callback: HttpRequestCallback, requireAuth auth: Bool = false) -> Void {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var request = URLRequest(url: url)
        
        if (auth) {
            let defaults = UserDefaults.standard
            request.setValue(defaults.string(forKey: "session")!, forHTTPHeaderField: "Authorization")
        }
        
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
                let query = URLQueryItem(name: key, value: String(describing: value))
                items.append("\(query.name)=\(query.value!)")
                
            }
        }
        
        return items.joined(separator: "&")
    }
}

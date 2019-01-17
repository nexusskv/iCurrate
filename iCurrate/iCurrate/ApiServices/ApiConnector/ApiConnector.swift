//
//  ApiConnector.swift
//  iCurrate
//
//  Created by Rost on 1/16/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class ApiConnector {
    
    
    /// ---> Function for load data from API <--- ///
    static func loadData(_ url: String, type: Int, completion: ((_ response: AnyObject) -> Void)?) {
        guard let resultUrl = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: resultUrl)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print(error ?? "Unknown error")
                completion!(false as AnyObject)
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let jsonValues = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]

                    let handleResult = JsonHandler.handleJson(jsonValues, type: type)
                    
                    DispatchQueue.main.async {
                        completion!(handleResult as AnyObject)
                    }
                } catch {
                    print(error)
                    
                    DispatchQueue.main.async {
                        completion!(false as AnyObject)
                    }
                }
            }
        })
        
        task.resume()
    }
}

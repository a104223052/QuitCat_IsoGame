//
//  QApi.swift
//  QuitCatIsoGame
//
//  Created by Gladys on 2019/3/24.
//  Copyright © 2019 Kai Kuma. All rights reserved.
//

import Foundation

class QApi {
   
    func regeister() {
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
        ]
        
        let postData = NSMutableData(data: "FbID=this".data(using: String.Encoding.utf8)!)
        postData.append("&FbToken=thiso".data(using: String.Encoding.utf8)!)
        postData.append("&name=sidney".data(using: String.Encoding.utf8)!)
        postData.append("&email=thisMail".data(using: String.Encoding.utf8)!)
        postData.append("&undefined=undefined".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://musicrun.shu.edu.tw/quitcat/api/Register")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(httpResponse)
                print(dataString)
            }
        })
        
        dataTask.resume()
    }
   
}

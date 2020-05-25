//
//  CommonObjects.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 24/05/20.
//  Copyright © 2020 Success Resource Pte Ltd. All rights reserved.
//


import UIKit

class CommonObjects: NSObject {
    static let shared = CommonObjects()
    private override init() {}
    
//    var spinner: UIActivityIndicatorView = {
//        let spinner = UIActivityIndicatorView(style: .medium)
//        spinner.translatesAutoresizingMaskIntoConstraints = false
//        return spinner
//    }()
    let unsplashBaseURL = "https://api.unsplash.com"
    let unsplashClientID = "client_id"
    
    
    func getAPIServiceCall(url: String, header: [String: String]?, completionHandler: @escaping (Data) -> Void) {
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: .infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          if (error != nil) {
            print(error!)
          } else {
            guard let data = data else {return}
            completionHandler(data)
          }
        }
        task.resume()
    }
    
}

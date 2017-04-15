//
//  API.swift
//  SwiftInterviewKit
//
//  Created by Boris Oks on 4/14/17.
//  Copyright © 2017 Boris Oks. All rights reserved.
//

import Foundation

class API {
    typealias Response = (_ code: Int, _ object: Any?) -> Void
    
    class func get(url: String, response: @escaping Response) {
        self.request(method: "GET", url: url) { (object, code, error) in
            response(code, object)
        }
    }

    class func post(url: String, payload: Any, response: @escaping Response) {
        self.request(method: "POST", url: url, payload: payload) { (object, code, error) in
            response(code, object)
        }
    }

    class func put(url: String, response: @escaping Response) {
        self.request(method: "PUT", url: url) { (object, code, error) in
            response(code, object)
        }
    }

    private class func request(method: String, url: String, payload: Any? = nil, completionHandler: @escaping (Any?, Int, Error?) -> Swift.Void) {
        guard let url = URL(string: url) else {
            completionHandler(nil, -1, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        if let dictPayload = payload as? [String: Any] {
            request.httpBody = dictPayload.JSONData
        } else if let arrayPayload = payload as? [Any] {
            request.httpBody = arrayPayload.JSONData
        }

        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            GCD.main {
                completionHandler(data?.JSONObject, (response as? HTTPURLResponse)?.statusCode ?? -1, error)
            }
        }
        
        task.resume()
    }
}

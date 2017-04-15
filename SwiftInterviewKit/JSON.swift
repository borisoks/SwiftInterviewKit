//
//  JSON.swift
//  SwiftInterviewKit
//
//  Created by Boris Oks on 4/14/17.
//  Copyright © 2017 Boris Oks. All rights reserved.
//

import Foundation

extension Data {
    var JSONObject: Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: [])
        } catch {
            //print("Problem de-serializing object: \(error)")
        }
        
        return nil
    }
}

extension String {
    var JSONObject: Any? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }

        return data.JSONObject
    }
}

extension Dictionary {
    var JSONString: String? {
        guard let data = self.JSONData else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    var JSONData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            //print("Problem de-serializing object: \(error)")
        }
        return nil
    }
}

extension Array {
    var JSONString: String? {
        guard let data = self.JSONData else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    var JSONData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            //print("Problem de-serializing object: \(error)")
        }
        return nil
    }
}

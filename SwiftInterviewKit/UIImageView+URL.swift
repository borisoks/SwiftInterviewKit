//
//  UIImage+URL.swift
//  SwiftInterviewKit
//
//  Created by Boris Oks on 4/14/17.
//  Copyright © 2017 Boris Oks. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: String, completed: @escaping (_ success: Bool) -> Void) {
        API.get(url: url) { (code, object) in
            if let img = object as? UIImage {
                self.image = img
                completed(true)
            } else {
                completed(false)
            }
        }
    }
}

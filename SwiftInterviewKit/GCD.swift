//
//  GCD.swift
//  SwiftInterviewKit
//
//  Created by Boris Oks on 4/14/17.
//  Copyright © 2017 Boris Oks. All rights reserved.
//

import Foundation

class GCD {
    class func main(delay: TimeInterval = 0, closure: @escaping () -> Void) {
        self.execute(queue: DispatchQueue.main, delay: delay, closure: closure)
    }

    class func background(delay: TimeInterval = 0, closure: @escaping () -> Void) {
        self.execute(queue: DispatchQueue.global(qos: .background), delay: delay, closure: closure)
    }
    
    private class func execute(queue: DispatchQueue, delay: TimeInterval, closure: @escaping () -> Void) {
        queue.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)
    }
}

//
//  GCD.swift
//  SFCore
//
//  Created by Samuel Grau on 03/02/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation

/**
 Delays an operation
 
 - parameter delay:   The delay
 - parameter closure: The closure to execute
 */
public func gcdDelay(_ delay:Double, closure: ()->()) {
  DispatchQueue.main.after(
    when: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
    execute: closure
  )
}

/**
 Executes the closure on the main thread
 
 - parameter closure: The closure to execute
 */
public func gcdMainThread(_ closure: ()->()) {
  DispatchQueue.main.async(execute: { () -> Void in
    closure()
  })
}

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
public func gcdDelay(delay:Double, closure: ()->()) {
  dispatch_after(
    dispatch_time(
      DISPATCH_TIME_NOW,
      Int64(delay * Double(NSEC_PER_SEC))
    ),
    dispatch_get_main_queue(),
    closure
  )
}

/**
 Executes the closure on the main thread
 
 - parameter closure: The closure to execute
 */
public func gcdMainThread(closure: ()->()) {
  dispatch_async(dispatch_get_main_queue(), { () -> Void in
    closure()
  })
}

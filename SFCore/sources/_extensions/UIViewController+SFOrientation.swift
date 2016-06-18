//
// The MIT License (MIT)
//
// Copyright (c) 2015 Samuel GRAU
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

//
//  synchro-agenda : UIViewController+SFOrientation.swift
//
//  Created by Samuel Grau on 11/03/2015.
//  Copyright (c) 2015 Aviva France. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  
  /**
   Set the view controller as an observer of device rotations
   */
  public func startListeningToOrientationChanges() {
    UIDevice.current().beginGeneratingDeviceOrientationNotifications()
    NotificationCenter.default().addObserver(
      self,
      selector: #selector(UIViewController.orientationDidChange(_:)),
      name: NSNotification.Name.UIDeviceOrientationDidChange,
      object: nil
    )
  }
  
  /**
   Remove the view controller as an observer of device rotations
   */
  public func stopListeningToOrientationChanges() {
    UIDevice.current().endGeneratingDeviceOrientationNotifications()
    NotificationCenter.default().removeObserver(
      self,
      name: NSNotification.Name.UIDeviceOrientationDidChange,
      object: nil
    )
  }
  
  /**
   Reacts to a notification when a orientation did change is detected by the device
   
   - parameter notification: The notification with name `UIDeviceOrientationDidChangeNotification`
   */
  public func orientationDidChange(_ notification: Notification) {
    // No-op
  }
}

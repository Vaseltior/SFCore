//
//  UIViewControllerOrientationsTests.swift
//  SFCore
//
//  Created by Samuel Grau on 10/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class UIViewControllerOrientationsTests: XCTestCase {
  var vc: UIViewController!

  override func setUp() {
    super.setUp()
    self.vc = UIViewController()
    self.vc.startListeningToOrientationChanges()
  }

  override func tearDown() {
    self.vc.stopListeningToOrientationChanges()
    super.tearDown()
  }

  func testNotificationReaction() {
    let n = Notification(name: NSNotification.Name.UIDeviceOrientationDidChange, object: self)
    NotificationCenter.default().post(n)
  }
}

//
//  UIColorSFRGB.swift
//  SFCore
//
//  Created by Samuel Grau on 04/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
import UIKit
@testable import SFCore

class UIColorSFRGBTests: XCTestCase {
  var r: CGFloat = 0
  var g: CGFloat = 0
  var b: CGFloat = 0
  var a: CGFloat = 0

  func testRGBInitialization() {
    // This is an example of a functional test case.
    let c = UIColor.sfRGB(255, green: 255, blue: 255)
    c.getRed(&r, green: &g, blue: &b, alpha: &a)
    XCTAssert(r == 1.0 && g == 1.0 && b == 1.0 && a == 1.0)
  }
}

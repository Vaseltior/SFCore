//
//  ObservableTests.swift
//  SFCore
//
//  Created by Samuel Grau on 10/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

/// Used to raise events for the observable property protocol
enum ApplicationDataProperty {
  case loggedCurrentUser
}

class ObservableTests: XCTestCase {
  typealias PropertyType = ApplicationDataProperty
  let propertyChanged = Event<(ApplicationDataProperty, Any)>()

  var disp: Disposable!
  override func setUp() {
    super.setUp()
    self.disp = self.propertyChanged.addHandler(self, handler: ObservableTests.onPropertyChanged)
  }

  override func tearDown() {
    self.disp.dispose()
    super.tearDown()
  }

  var loggedCurrentUser: Bool = false {
    didSet {
      self.propertyChanged.raise(ApplicationDataProperty.loggedCurrentUser, oldValue as Any)
    }
  }

  var circuitCalled = false

  func testObservationCircuit() {
    self.loggedCurrentUser = true

    XCTAssertTrue(self.circuitCalled)
  }

  func onPropertyChanged(_ property: ApplicationDataProperty, oldValue: Any) {
    self.circuitCalled = true
  }
}

//
//  Settings+Texting.swift
//  SFCore
//
//  Created by Samuel Grau on 03/02/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation

// MARK: - Texting

private let kSchemeSMS = "sms://"

extension SettingsHelper {
  
  private static func sanitizedPhoneNumberFromString(phoneNumber: String) -> String {
    return phoneNumber
  }
  
  public static func SMS(number: String? = nil) throws -> Bool {
    let sanitizedNumber = SettingsHelper.sanitizedPhoneNumberFromString(number ?? "")
    let URLString = kSchemeSMS + sanitizedNumber
    return try SettingsHelper.buildAndOpenURL(URLString)
  }
}

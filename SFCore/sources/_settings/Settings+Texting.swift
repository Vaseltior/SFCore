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

/**
You can't detect the simulator directly, but you can detect iOS on a desktop architecture like follows

#if (arch(i386) || arch(x86_64)) && os(iOS)
...
#endif
Clearly this is false on a device, but it returns true for the iOS Simulator, as specified in the documentation:

The arch(i386) build configuration returns true when code is compiled for the 32–bit iOS simulator.
If you are developing for a simulator other than iOS, you can simply vary the os parameter: e.g.

Detect the watchOS simulator

#if (arch(i386) || arch(x86_64)) && os(watchOS)
...
#endif
Detect the tvOS simulator

#if (arch(i386) || arch(x86_64)) && os(tvOS)
...
#endif
Or, even, detect any simulator

#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
...
#endif
*/

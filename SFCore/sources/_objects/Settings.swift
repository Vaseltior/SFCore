//
//  Settings.swift
//  SFCore
//
//  Created by Samuel Grau on 03/02/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation
import UIKit

/**
 Error type that can be thrown from the settings helper class
 
 - InvalidURL:               If no URL can be build
 - ApplicationCannotOpenURL: If the application is not able to open the URL
 */
public enum SettingsHelperError: ErrorType {
  case InvalidURL
  case ApplicationCannotOpenURL
}

/** 
 This class is a helper for interacting with the settings of an application
 */
public class SettingsHelper {
  public static func openSystemApplicationSettingsPage() throws {
    // Should Block the app
    guard let URL = NSURL(string: UIApplicationOpenSettingsURLString) else {
      throw SettingsHelperError.InvalidURL
      return
    }
    
    if UIApplication.sharedApplication().canOpenURL(URL!) {
      UIApplication.sharedApplication().openURL(URL!)
      
    } else {
      throw SettingsHelperError.ApplicationCannotOpenURL
      
    }
  }
}
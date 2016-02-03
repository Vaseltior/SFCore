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
  
  /**
   Opens the settings page associated to the application in the Settings app of the
   device
   
   - throws: errors if the URL can't be created or if the application does not handle the URL
   */
  public static func openSystemApplicationSettingsPage() throws {
    // Should Block the app
    try SettingsHelper.buildAndOpenURL(UIApplicationOpenSettingsURLString)
  }
  
  /**
   Try to build the URL from the given URL string and open that URL if
   the application can open it
   
   - parameter URLString: errors if the URL can't be created or if the application does not handle the URL
   
   - returns: `true` if the resource located by the URL was successfully opened; otherwise `false`.
   */
  public static func buildAndOpenURL(URLString: String) throws -> Bool {
    guard let URL = NSURL(string: URLString) else {
      throw SettingsHelperError.InvalidURL
      return false
    }
    
    if UIApplication.sharedApplication().canOpenURL(URL) {
      return UIApplication.sharedApplication().openURL(URL)
      
    } else {
      throw SettingsHelperError.ApplicationCannotOpenURL
      
    }
  }
}

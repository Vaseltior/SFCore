//
//  Email.swift
//  SFCore
//
//  Created by Samuel Grau on 30/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation

/**
 *  @author Samuel GRAU, 16-01-30 22:01:36
 *
 *  A simple Email class that is able to validate correctly an Email
 */
public class Email: CustomStringConvertible {
  var emailString: String!
  
  // MARK: - Initialization
  
  /**
  Creates an Email object with an email string
  
  - parameter email: the email string representation
  
  - returns: an Email object
  */
  public init(email: String) {
    self.emailString = email.lowercaseString
  }
  
  // MARK: - Email validation functions
  
  /**
  Tells if the current email representation is valid or not
  
  - returns: true if the email is valid, otherwise false
  */
  public func isValidEmail() -> Bool {
    let emailRegEx =
    "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
      "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
      "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
      "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
      "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
      "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let regExPredicate = NSPredicate(format:"%@ MATCHES %@", self.emailString, emailRegEx)
    return regExPredicate.evaluateWithObject(self)
  }
  
  /**
   Tells if the given string is a valid email representation
   
   - parameter emailString: the email string representation
   
   - returns: true if the email is valid, otherwise false
   */
  public static func isValidEmailString(emailString: String) -> Bool {
    return Email(email: emailString).isValidEmail()
  }
  
  // MARK: - CustomStringConvertible
  
  /// A textual representation of `self`.
  public var description: String {
    return self.emailString
  }
}

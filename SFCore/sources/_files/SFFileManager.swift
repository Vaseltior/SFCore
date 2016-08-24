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
//  SFCore : SFFileManager.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

///
/// An implementation of the SFFileManagerProtocol protocol for file manipulation
///
public class SFFileManager : SFFileManagerProtocol {

  ///
  /// A file location for an application's main bundle.
  ///
  public class func mainBundleDirectory() -> String? {
    return Bundle.main().resourcePath
  }

  ///
  /// A file location for an application's caches directory.
  ///
  public class func cachesDirectory() -> String {
    let paths:[AnyObject]! = NSSearchPathForDirectoriesInDomains(
      FileManager.SearchPathDirectory.cachesDirectory,
      FileManager.SearchPathDomainMask.userDomainMask,
      true
    )

    if paths.isEmpty {
      return ""
    }

    return String(format: (paths[0] as! NSString) as NSString as String)
  }

  ///
  /// A file location for an application's documents directory.
  ///
  public class func documentsDirectory() -> String {
    let paths:[AnyObject]! = NSSearchPathForDirectoriesInDomains(
      FileManager.SearchPathDirectory.documentDirectory,
      FileManager.SearchPathDomainMask.userDomainMask,
      true
    )

    if paths.isEmpty {
      return ""
    }

    return String(format: (paths[0] as! NSString) as NSString as String)
  }

  ///
  /// A file location for an application's temporary directory.
  ///
  public class func temporaryDirectory() -> String {
    return NSTemporaryDirectory()
  }

  ///
  /// A file location for serializing an application's user object to disk.
  ///
  public class func userFile() -> String {
    return (self.documentsDirectory() as NSString).appendingPathComponent("User")
  }

  ///
  /// A file location for an application's main bundle
  ///
  /// - parameter fileData: The data to write to a file.
  /// - parameter path: The path to write the data to.
  ///
  /// - returns: BOOL Whether or not th file was created.
  ///
  public class func createFileAtPath(_ fileData: Data, atPath path: String) -> Bool {
    let fileManager: FileManager = FileManager.default()
    let res = fileManager.createFile(atPath: path, contents: fileData, attributes: nil)
    return res
  }

  ///
  /// A file location for an application's main bundle
  ///
  /// - parameter path: The path to remove the file from.
  ///
  /// - returns: BOOL Whether or not the file was deleted.
  ///
  public class func removeFileAtPath(_ path: String) -> NSError? {
    var error: NSError? = nil
    let fileManager: FileManager = FileManager.default()
    let _: Bool
    do {
      try fileManager.removeItem(atPath: path)
    } catch let error1 as NSError {
      error = error1
    }
    return error
  }

  ///
  /// Returns the content of the file at path as a string
  ///
  /// - returns: Returns the content of the file at path as a string
  ///
  public class func contentOfFileAtPath(_ path: String) -> String {
    var res = ""
    do {
      res = try (NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)) as String
    } catch _ {
    }

    return res
  }

  /// MARK: High Level function -


  ///
  /// Creates a directory in the documents directory
  ///
  /// - parameter directoryName: The name of the directory to create.
  ///
  public class func createDirectoryInDocumentsDirectory(_ directoryName: String) {
    let documentsDirectory = self.documentsDirectory() // Get documents folder
    let dataPath = (documentsDirectory as NSString).appendingPathComponent(directoryName)
    let fileManager: FileManager = FileManager.default()

    if (!fileManager.fileExists(atPath: dataPath)) {
      do {
        try fileManager.createDirectory(
          atPath: dataPath,
          withIntermediateDirectories: true,
          attributes: nil)
      } catch _ as NSError {
      }
    }
  }
}

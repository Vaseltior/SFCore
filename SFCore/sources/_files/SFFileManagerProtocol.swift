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
import SFErrors

///
/// A protocol for file manipulation
///
public protocol SFFileManagerProtocol {
    ///
    /// A file location for an application's main bundle.
    ///
    class func mainBundleDirectory() -> String?
    
    ///
    /// A file location for an application's caches directory.
    ///
    class func cachesDirectory() -> String
    
    ///
    /// A file location for an application's documents directory.
    ///
    class func documentsDirectory() -> String
    
    ///
    /// A file location for an application's temporary directory.
    ///
    class func temporaryDirectory() -> String
    
    ///
    /// A file location for serializing an application's user object to disk.
    ///
    class func userFile() -> String
    
    ///
    /// A file location for an application's main bundle
    ///
    /// :param: fileData The data to write to a file.
    /// :param: path The path to write the data to.
    ///
    /// :returns: BOOL Whether or not th file was created.
    ///
    class func createFileAtPath(fileData: NSData, atPath path: String) -> SFFailable
    
    ///
    /// A file location for an application's main bundle
    ///
    /// :param: path The path to remove the file from.
    ///
    /// :returns: BOOL Whether or not the file was deleted.
    ///
    class func removeFileAtPath(path: String) -> SFFailable
    
    ///
    /// Returns the content of the file at path as a string
    ///
    /// :returns: Returns the content of the file at path as a string
    ///
    class func contentOfFileAtPath(path: String) -> String
    
    /// MARK: - High Level -

    
    ///
    /// Creates a directory in the documents directory
    ///
    /// :param: directoryName The name of the directory to create.
    ///
    class func createDirectoryInDocumentsDirectory(directoryName: String)
}

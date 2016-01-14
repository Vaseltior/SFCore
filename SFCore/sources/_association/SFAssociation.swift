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
//  SFCore : SFAssociation.swift
//
//  Created by Samuel Grau on 11/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation


public class ObjectAssociationWrapper : NSObject {
    let value: AnyObject
    
    init(value: AnyObject) {
        self.value = value
    }
}

extension NSObject {
    
    public var swiftAssociatedObject : AnyObject! {
        get {
            let wrapper = objc_getAssociatedObject(self, someKey) as SFCore.ObjectAssociationWrapper?
            return wrapper?.value
        }
        set(value) {
            let wrapper = SFCore.ObjectAssociationWrapper(value: value)
            objc_setAssociatedObject(self, someKey, wrapper, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
}

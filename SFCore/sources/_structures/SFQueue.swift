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
//  SFCore : SFQueue.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

public class SFQNode<T> {
    var key: T? = nil
    var next: SFQNode? = nil
}

public class SFQueue<T> {
    private var top: SFQNode<T>! = SFQNode<T>()

    //enqueue the specified object
    public func enQueue(key: T) {
        
        //check for the instance
        if (top == nil) {
            top = SFQNode()
        }
        
        //establish the top node
        if (top.key == nil) {
            top.key = key;
            return
        }
        
        let childToUse: SFQNode<T> = SFQNode<T>()
        var current: SFQNode = top
        
        //cycle through the list of items to get to the end.
        while (current.next != nil) {
            current = current.next!
        }
        //append a new item
        childToUse.key = key;
        current.next = childToUse;
    }
    
    //retrieve items from the top level in O(1) constant time</span>
    public func deQueue() -> T? {
        
        //determine if the key or instance exists</span>
        let topitem: T? = self.top?.key
        
        if (topitem == nil) {
            return nil
        }
        
        //retrieve and queue the next item</span>
        let queueitem: T? = top.key!
        
        //use optional binding</span>
        if let nextitem = top.next {
            top = nextitem
        }
        else {
            top = nil
        }
        
        return queueitem
    }
    
    //check for the presence of a value</span>
    public func isEmpty() -> Bool {
        
        //determine if the key or instance exist</span>
        if let _: T = self.top?.key {
            return false
        }
            
        else {
            return true
        }
        
    }
    
    
    //retrieve the top most item</span>
    public func peek() -> T? {
        return top.key!
    }
}

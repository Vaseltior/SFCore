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
//  SFCore : NSManagedObject+OneWaySynchronization.swift
//
//  Created by Samuel Grau on 06/02/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation
import CoreData
//import AvivaFrameworkSwift
//import SGAggregationFramework

extension NSManagedObject {
  
  ///
  ///
  ///
  func setObjectPriority(priority: NSNumber, object: AnyObject, key: String) {
    
  }
  
  ///
  ///
  ///
  class func compareUniqueKeyFrom(
    srcObject: AnyObject,
    with dstObject: AnyObject,
    context: AnyObject?) -> Bool {
      return true
  }
  
  ///
  ///
  ///
  class func createObjectWithData(
    data: AnyObject,
    managedObjectContext moc: NSManagedObjectContext,
    context: AnyObject?
    ) -> NSManagedObject? {
      fatalError("createObjectWithData(data:managedObjectContext:context:) has not been implemented")
  }
  
  ///
  ///
  ///
  class func updateObjectWithData(
    data: AnyObject,
    managedObjectContext moc: NSManagedObjectContext,
    context: AnyObject?
    ) -> NSManagedObject? {
      fatalError("updateObjectWithData(data:managedObjectContext:context:) has not been implemented")
  }
  
  ///
  ///
  ///
  class func deleteObjectWithData(
    data: AnyObject,
    managedObjectContext moc: NSManagedObjectContext,
    context: AnyObject?
    ) -> NSManagedObject? {
      fatalError("deleteObjectWithData(data:managedObjectContext:context:) has not been implemented")
  }
  
  ///
  ///
  ///
  class func synchronizeSortedInputData(
    inputObjects: [AnyObject],
    withSortedExistingData sortedExistingData: [AnyObject],
    priorityKey: String,
    managedObjectContext moc: NSManagedObjectContext
    ) -> NSSet {
      return self.synchronizeSortedInputData(
        inputObjects,
        withSortedExistingData:sortedExistingData,
        priorityKey: priorityKey,
        managedObjectContext: moc,
        context: nil
      )
  }
  
  ///
  ///
  ///
  class func synchronizeSortedInputData(
    inputObjects: [AnyObject],
    withSortedExistingData existingData: [AnyObject],
    priorityKey key: String,
    managedObjectContext moc: NSManagedObjectContext,
    context: AnyObject?) -> NSSet {
      
      var srcIndex = 0 // Source index
      var dstIndex = 0 // Destination index
      
      var resultSet = NSMutableSet()
      
      // While source index does not reach the upper bound of the existing data count
      while srcIndex < inputObjects.count {
        // We treat the current source object
        let srcMO: AnyObject = inputObjects[srcIndex]
        
        // Have we reached yet the end of the source array?
        if existingData.sfIsIndexOutOfBounds(dstIndex) {
          
          // There we are out of bounds, so this is an insertion --> Create the object
          self.owsInsertObject(object: srcMO, resultSet: &resultSet, key: key, managedObjectContext: moc, syncContext: context)
          
          // Mark as treated, and go to the next element
          srcIndex++
          
        } else {
          
          // Get the existing current element for comparison
          let dstMO: AnyObject = existingData[dstIndex]
          
          // If the elements are equal this means that we already have the object, and it is an update.
          if self.compareUniqueKeyFrom(srcMO, with:dstMO, context:context) == true {
            
            // We should update
            self.owsUpdateObject(object: srcMO, resultSet: &resultSet, key: key, managedObjectContext: moc, syncContext: context)
            
            // We progress on both indexes
            dstIndex++
            srcIndex++
            
          } else {
            //
            // If there is a difference this means that it could be an
            // insertion or a deletion
            // But we should find out which one it is.
            // - We should delete from Core Data if the next element is equal.
            // - We should insert an element into the Core Data if both the
            // current and the following element are different
            // - We should delete any object
            //
            
            // So we try to get the next Core Data identifier
            let dstIndexPlusOne = dstIndex + 1
            
            // Do this element exist ?
            if existingData.sfIsIndexOutOfBounds(dstIndexPlusOne) {
              
              // There we are out of bounds, so this is an insertion
              self.owsInsertObject(object: srcMO, resultSet: &resultSet, key: key, managedObjectContext: moc, syncContext: context)
              srcIndex++
              
            } else {
              
              // We should compare to know if it is an insertion or a
              // deletion
              
              let dstMOPlusOne = existingData[dstIndexPlusOne] as! NSManagedObject
              
              if self.compareUniqueKeyFrom(srcMO, with:dstMOPlusOne, context:context) == true {
                
                // If objects at this point are identical,
                // it is a deletion of the Core Data object
                self.deleteObjectWithData(dstMO, managedObjectContext:moc, context:context)
                
                dstIndex++
                
              } else {
                self.owsInsertObject(object: srcMO, resultSet: &resultSet, key: key, managedObjectContext: moc, syncContext: context)
                srcIndex++
              }
            }
          }
        }
      }
      
      // The last step consist in deleting all the objects of the core data
      // that have not been deleted yet if any is remaining.
      self.owsDeleteRemainingObjects(existingData, destinationIndex: dstIndex, managedObjectContext: moc, syncContext: context)
      
      return resultSet
  }
  
  // MARK: - Private
  
  /**
  Update the result set with a given object
  
  - parameter srcMO:     the object to insert in the results
  - parameter resultSet: the result set
  - parameter key:       a user key comparison
  - parameter moc:       the context in which the operation should occur
  - parameter context:   a user context
  */
  private static func owsUpdateObject(
    object srcMO: AnyObject,
    inout resultSet: NSMutableSet,
    key: String,
    managedObjectContext moc: NSManagedObjectContext,
    syncContext context: AnyObject?) {
      
      if let updated = self.updateObjectWithData(srcMO, managedObjectContext:moc, context:context) {
        updated.setObjectPriority(resultSet.count, object:updated, key:key)
        resultSet.addObject(updated)
      }
  }
  
  /**
   Insert in the result set a new inserted object
   
   - parameter srcMO:     the object to insert in the results
   - parameter resultSet: the result set
   - parameter key:       a user key comparison
   - parameter moc:       the context in which the operation should occur
   - parameter context:   a user context
   */
  private static func owsInsertObject(
    object srcMO: AnyObject,
    inout resultSet: NSMutableSet,
    key: String,
    managedObjectContext moc: NSManagedObjectContext,
    syncContext context: AnyObject?) {
      
      if let created: NSManagedObject = self.createObjectWithData(srcMO, managedObjectContext: moc, context: context) {
        created.setObjectPriority(resultSet.count, object:created, key:key)
        /*if resultSet.containsObject(created) {
        oneWaySwellLogger.trace { return "duplicate created" }
        }*/
        resultSet.addObject(created)
      }
  }
  
  /**
   Do the last operation of the one way synchronization process
   
   - parameter existingData: Here is the array of the destination data we target to synchronize
   - parameter dstIndex:     The current index in the existingData array
   - parameter moc:          The context in which the operation should be executed
   - parameter context:      a user context, if any
   */
  private static func owsDeleteRemainingObjects(
    existingData: [AnyObject],
    destinationIndex dstIndex: Int,
    managedObjectContext moc: NSManagedObjectContext,
    syncContext context: AnyObject?) {
      
      // The last step consist in deleting all the objects of the core data
      // that have not been deleted yet if any is remaining.
      if !existingData.sfIsIndexOutOfBounds(dstIndex) {
        for i in dstIndex..<existingData.count {
          self.deleteObjectWithData(existingData[i], managedObjectContext: moc, context: context)
        }
      }
  }
}

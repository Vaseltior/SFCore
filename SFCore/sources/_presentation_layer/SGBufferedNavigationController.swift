//
//  SGBufferedNavigationController.swift
//  SFCore
//
//  Created by Samuel Grau on 31/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation
import UIKit

let bufferedNavigationQueue = dispatch_queue_create("com.vaseltior.BufferedNavigationQueue", nil)

typealias SGBCodeBlock = (Void) -> (Void)

/**
 BufferedNavigationController extends UINavigationController to automatically queue up transitions between view controllers.
 
 This prevents you receiving errors such as:
 "Finishing up a navigation transition in an unexpected state. Navigation Bar subview tree might get corrupted."
 
 This can happen if you try to pushViewController during an existing transition.
 
 To use, simply add the provided files to your project and change your UINavigationController class to
 inherit from BufferedNavigationController in Interface Builder.
 */
public class SGBufferedNavigationController: UINavigationController, UINavigationControllerDelegate {
  
  /// A queue of blocks to execute
  var queue: [SGBCodeBlock] = [SGBCodeBlock]()
  
  /// A bbolean telling if the view is currently transitioning
  var isTransitioning: Bool = false
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    self.resetQueue()
  }
  
  // MARK: - Overrides
  
  override public func popViewControllerAnimated(animated: Bool) -> UIViewController? {
    var result: UIViewController? = nil
    
    dispatch_sync(bufferedNavigationQueue) {
      if self.isTransitioning {
        self.queue.append({
          super.popViewControllerAnimated(animated)
        })
        
        // We cannot show what viewcontroller is currently animated now
        result = nil
        
      } else {
        result = super.popViewControllerAnimated(animated)
      }
    }
    
    return result
  }
  
  public override func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
    var result: [UIViewController]? = nil
    
    //
    dispatch_sync(bufferedNavigationQueue) {
      if self.isTransitioning {
        self.queue.append({
          super.popToRootViewControllerAnimated(animated)
        })
        
        // We cannot show what viewcontroller is currently animated now
        result = nil
        
      } else {
        result = super.popToRootViewControllerAnimated(animated)
      }
    }
    
    return result
  }
  
  public override func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    var result: [UIViewController]? = nil
    
    //
    dispatch_sync(bufferedNavigationQueue) {
      if self.isTransitioning {
        self.queue.append({
          super.popToViewController(viewController, animated: animated)
        })
        
        // We cannot show what viewcontroller is currently animated now
        result =  nil
        
      } else {
        result =  super.popToViewController(viewController, animated: animated)
      }
    }
    
    return result
  }
  
  public override func setViewControllers(viewControllers: [UIViewController], animated: Bool) {
    //
    dispatch_sync(bufferedNavigationQueue) {
      if self.isTransitioning {
        self.queue.append({
          super.setViewControllers(viewControllers, animated: animated)
        })
        
      } else {
        super.setViewControllers(viewControllers, animated: animated)
      }
    }
  }
  
  public override func pushViewController(viewController: UIViewController, animated: Bool) {
    dispatch_sync(bufferedNavigationQueue) {
      if self.isTransitioning {
        self.queue.append({
          super.pushViewController(viewController, animated: animated)
        })
        
      } else {
        super.pushViewController(viewController, animated: animated)
      }
    }
  }
  
  // MARK: - UINavigationControllerDelegate
  
  public func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    dispatch_sync(bufferedNavigationQueue) {
      self.isTransitioning = true
      
      guard let transitionCoordinator = navigationController.topViewController?.transitionCoordinator() else {
        return
      }
      
      transitionCoordinator.notifyWhenInteractionEndsUsingBlock({ (context: UIViewControllerTransitionCoordinatorContext) -> Void in
        if context.isCancelled() {
          dispatch_sync(bufferedNavigationQueue) {
            self.isTransitioning = false
          }
        }
      })
    }
  }
  
  public func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
    dispatch_sync(bufferedNavigationQueue) {
      self.isTransitioning = false
      self.runNextBlock()
    }
  }
  
  // MARK: - Private methods
  
  /**
  Pushes the code block on end of the queue
  
  - parameter codeBlock: The code block to queue
  */
  private func pushCodeBlock(codeBlock: SGBCodeBlock) {
    dispatch_sync(bufferedNavigationQueue) {
      self.queue.append(codeBlock)
      if !self.isTransitioning {
        self.runNextBlock()
      }
    }
  }
  
  /**
   Runs the next block on top of the queue. If the queue is empty, nothing is done
   */
  private func runNextBlock() {
    guard self.queue.count != 0 else {
      return
    }
    
    // Execute block, then remove it from the queue (which will dealloc)
    self.queue.first!()
    
    self.queue.removeFirst(1)
  }
  
  /**
   Removes all elements from the queue
   */
  private func resetQueue() {
    self.queue.removeAll()
  }
}

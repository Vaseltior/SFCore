//
//  SGBufferedNavigationController.swift
//  SFCore
//
//  Created by Samuel Grau on 31/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation
import UIKit

let bufferedNavigationQueue = DispatchQueue(label: "com.vaseltior.BufferedNavigationQueue", attributes: [])

typealias SGBCodeBlock = (Void) -> (Void)

/**
 BufferedNavigationController extends UINavigationController to automatically queue up transitions 
 between view controllers.
 
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
  
  override public func popViewController(animated: Bool) -> UIViewController? {
    var result: UIViewController? = nil
    
    bufferedNavigationQueue.sync {
      if self.isTransitioning {
        self.queue.append({
          super.popViewController(animated: animated)
        })
        
        // We cannot show what viewcontroller is currently animated now
        result = nil
        
      } else {
        result = super.popViewController(animated: animated)
      }
    }
    
    return result
  }
  
  public override func popToRootViewController(animated: Bool) -> [UIViewController]? {
    var result: [UIViewController]? = nil
    
    //
    bufferedNavigationQueue.sync {
      if self.isTransitioning {
        self.queue.append({
          super.popToRootViewController(animated: animated)
        })
        
        // We cannot show what viewcontroller is currently animated now
        result = nil
        
      } else {
        result = super.popToRootViewController(animated: animated)
      }
    }
    
    return result
  }
  
  public func pop(to viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    var result: [UIViewController]? = nil
    
    //
    bufferedNavigationQueue.sync {
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
  
  public override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
    //
    bufferedNavigationQueue.sync {
      if self.isTransitioning {
        self.queue.append({
          super.setViewControllers(viewControllers, animated: animated)
        })
        
      } else {
        super.setViewControllers(viewControllers, animated: animated)
      }
    }
  }
  
  public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    bufferedNavigationQueue.sync {
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
  
  public func navigationController(
    _ navigationController: UINavigationController,
    willShow viewController: UIViewController,
    animated: Bool) {
      
      bufferedNavigationQueue.sync {
        self.isTransitioning = true
        
        guard let transitionCoordinator = navigationController.topViewController?.transitionCoordinator() else {
          return
        }
        
        transitionCoordinator.notifyWhenInteractionEnds({ (context: UIViewControllerTransitionCoordinatorContext) -> Void in
          if context.isCancelled() {
            bufferedNavigationQueue.sync {
              self.isTransitioning = false
            }
          }
        })
      }
  }
  
  public func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool) {
      
      bufferedNavigationQueue.sync {
        self.isTransitioning = false
        self.runNextBlock()
      }
  }
  
  // MARK: - Private methods
  
  /**
  Pushes the code block on end of the queue
  
  - parameter codeBlock: The code block to queue
  */
  private func pushCodeBlock(_ codeBlock: SGBCodeBlock) {
    bufferedNavigationQueue.sync {
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

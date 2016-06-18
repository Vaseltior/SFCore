//
//  ObservablePropertyProtocol.swift
//  SFCore
//
//  Created by Samuel Grau on 30/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation

/**
 *  @author Samuel GRAU, 16-01-30 22:01:36
 *
 *  Implements an observable property type. Kind of KVO in Swift.
 */
public protocol ObservableProperty {
  /// The property type that is observed
  associatedtype PropertyType
  /// Property changed
  var propertyChanged: Event<(PropertyType, Any)> { get }
}

/**
 *  @author Samuel GRAU, 16-01-30 22:01:41
 *
 *  Declare a protocol that is disposable. Part of the observation mechanism
 */
public protocol Disposable {
  /**
   Should dispose the disposable implementer
   */
  func dispose()
}

/**
 An Event class representation
 */
public class Event<T> {
  public init() {}
  public typealias EventHandler = (T) -> ()
  
  private var eventHandlers = [Invocable]()
  
  public func raise(_ data: T) {
    self.eventHandlers.forEach {
      $0.invoke(data)
    }
  }
  
  public func addHandler<U: AnyObject>(_ target: U, handler: (U) -> EventHandler) -> Disposable {
    let wrapper = EventHandlerWrapper(target: target, handler: handler, event: self)
    eventHandlers.append(wrapper)
    return wrapper
  }
}

/// Protocol for things that are invacable
private protocol Invocable: class {
  func invoke(_ data: Any)
}

/// A wrapper for
private class EventHandlerWrapper<T: AnyObject, U>: Invocable, Disposable {
  weak var target: T?
  let handler: (T) -> (U) -> ()
  let event: Event<U>
  
  init(target: T?, handler: (T) -> (U) -> (), event: Event<U>) {
    self.target = target
    self.handler = handler
    self.event = event
  }
  
  func invoke(_ data: Any) -> () {
    if let t = target {
      handler(t)(data as! U)
    }
  }
  
  func dispose() {
    event.eventHandlers =
      event.eventHandlers.filter { $0 !== self }
  }
}

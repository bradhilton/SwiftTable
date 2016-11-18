//
//  OrderedObjectSet.swift
//  OrderedObjectSet
//
//  Created by Bradley Hilton on 2/19/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

/// An ordered collection of unique `Element` instances.
/// _Warning_: `Element` must be a class type. Unfortunately this can not be enforced as a generic requirement, because
/// protocols can't be used as concrete types.
public struct OrderedObjectSet<Element> : Hashable, Collection, MutableCollection {
    
    internal(set) var array: [ObjectWrapper]
    internal(set) var set: Set<ObjectWrapper>
    
    /// Always zero, which is the index of the first element when non-empty.
    public var startIndex: Int {
        return array.startIndex
    }
    
    /// A "past-the-end" element index; the successor of the last valid
    /// subscript argument.
    public var endIndex: Int {
        return array.endIndex
    }
    
    /// Returns the position immediately after the given index.
    ///
    /// - Parameter i: A valid index of the collection. `i` must be less than
    ///   `endIndex`.
    /// - Returns: The index value immediately after `i`.
    public func index(after i: Int) -> Int {
        return i + 1
    }
    
    public subscript(position: Int) -> Element {
        get {
            return array[position].object as! Element
        }
        set {
            let wrapper = ObjectWrapper(newValue as AnyObject)
            let oldValue = array[position]
            set.remove(oldValue)
            array[position] = wrapper
            set.insert(wrapper)
            array = array.enumerated().filter { (index, element) in
                return index == position || element.hashValue != wrapper.hashValue }.map { $0.element }
        }
    }
    
    public var hashValue: Int {
        return set.hashValue
    }
    
}


public func ==<T>(lhs: OrderedObjectSet<T>, rhs: OrderedObjectSet<T>) -> Bool {
    return lhs.set == rhs.set
}



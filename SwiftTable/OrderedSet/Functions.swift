//
//  Collapse.swift
//  OrderedSet
//
//  Created by Bradley Hilton on 2/19/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

internal func copy<T>(orderedSet: OrderedSet<T>, operate: (inout OrderedSet<T>) -> ()) -> OrderedSet<T> {
    var copy = orderedSet
    operate(&copy)
    return copy
}

internal func collapse<Element, S : SequenceType where S.Generator.Element == Element>(s: S) -> ([ObjectWrapper], Set<ObjectWrapper>) {
    var aSet = Set<ObjectWrapper>()
    return (s.map { ObjectWrapper($0 as! AnyObject) }.filter { set(&aSet, contains: $0) }, aSet)
}

private func set<Element : Hashable>(inout set: Set<Element>, contains element: Element) -> Bool {
    defer { set.insert(element) }
    return !set.contains(element)
}

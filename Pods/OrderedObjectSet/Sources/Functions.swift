//
//  Functions.swift
//  OrderedObjectSet
//
//  Created by Bradley Hilton on 2/19/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

internal func copy<T>(_ orderedSet: OrderedObjectSet<T>, operate: (inout OrderedObjectSet<T>) -> ()) -> OrderedObjectSet<T> {
    var copy = orderedSet
    operate(&copy)
    return copy
}

internal func collapse<Element, S : Sequence>(_ s: S) -> ([ObjectWrapper], Set<ObjectWrapper>) where S.Iterator.Element == Element {
    var aSet = Set<ObjectWrapper>()
    return (s.map { ObjectWrapper($0 as AnyObject) }.filter { set(&aSet, contains: $0) }, aSet)
}

private func set<Element : Hashable>(_ set: inout Set<Element>, contains element: Element) -> Bool {
    defer { set.insert(element) }
    return !set.contains(element)
}

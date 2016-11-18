//
//  RowSection.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

public protocol RowSection : SectionSource, SectionInterface {
    var rows: OrderedObjectSet<RowSource> { get set }
}

extension RowSection {
    
    public var rows: OrderedObjectSet<RowSource> {
        get {
            return getAssociatedValue(key: "rows", object: self, initialValue: OrderedObjectSet())
        }
        set {
            rows.subtracting(newValue).forEach { $0.section = nil }
            newValue.subtracting(rows).forEach { $0.section = self }
            set(associatedValue: newValue, key: "rows", object: self)
        }
    }
    
    func index(_ row: RowSource) -> Int? {
        return rows.index { $0 === row }
    }
    
    func delegate<T>(_ row: RowSource, handler: (Int) -> T?) -> T? {
        guard let index = index(row) else { return nil }
        return handler(index)
    }
    
}

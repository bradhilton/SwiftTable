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
            return getAssociatedValueForProperty("rows", ofObject: self, withInitialValue: OrderedObjectSet())
        }
        set {
            rows.subtract(newValue).forEach { $0.section = nil }
            newValue.subtract(rows).forEach { $0.section = self }
            setAssociatedValue(newValue, forProperty: "rows", ofObject: self)
        }
    }
    
    func index(row: RowSource) -> Int? {
        return rows.indexOf { $0 === row }
    }
    
    func delegate<T>(row: RowSource, handler: (Int) -> T?) -> T? {
        guard let index = index(row) else { return nil }
        return handler(index)
    }
    
}

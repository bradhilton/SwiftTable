//
//  RowSection.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

private var rowsKey = "rows"

public protocol RowSection : SectionSource, SectionInterface {
    var rows: OrderedObjectSet<RowSource> { get set }
}

extension RowSection {
    
    public var rows: OrderedObjectSet<RowSource> {
        get {
            guard let rows = objc_getAssociatedObject(self, &rowsKey) as? OrderedObjectSet<RowSource> else {
                self.rows = OrderedObjectSet()
                return self.rows
            }
            return rows
        }
        set {
            rows.subtracting(newValue).forEach { $0.section = nil }
            newValue.subtracting(rows).forEach { $0.section = self }
            objc_setAssociatedObject(self, &rowsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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

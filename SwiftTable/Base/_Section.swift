//
//  _Section.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import OrderedObjectSet

private var tableKey = "table"

class EmptyTable : SectionTable {
    var sections = OrderedObjectSet<SectionSource>()
}

public protocol _Section : class {
    var table: TableInterface? { get set }
}

extension _Section {
    
    public var table: TableInterface? {
        get {
            return objc_getAssociatedObject(self, &tableKey) as? TableInterface
        }
        set {
            objc_setAssociatedObject(self, &tableKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var _table: TableInterface {
        return table ?? EmptyTable()
    }
    
}

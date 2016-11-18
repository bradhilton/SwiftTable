//
//  _Section.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

class EmptyTable : SectionTable {
    var sections = OrderedObjectSet<SectionSource>()
}

public protocol _Section : class {
    weak var table: TableInterface? { get set }
}

extension _Section {
    
    public var table: TableInterface? {
        get {
            return getAssociatedValue(key: "table", object: self)
        }
        set {
            set(weakAssociatedValue: newValue as AnyObject, key: "table", object: self)
        }
    }
    
    var _table: TableInterface {
        return table ?? EmptyTable()
    }
    
}

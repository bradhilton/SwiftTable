//
//  _Section.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

class EmptyTable : SectionTable {
    var sections = OrderedSet<SectionSource>()
}

public protocol _Section : class {
    weak var table: TableInterface? { get set }
}

extension _Section {
    
    public var table: TableInterface? {
        get {
            return getAssociatedValueForProperty("table", ofObject: self)
        }
        set {
            setWeakAssociatedValue(newValue as? AnyObject, forProperty: "table", ofObject: self)
        }
    }
    
    var _table: TableInterface {
        return table ?? EmptyTable()
    }
    
}

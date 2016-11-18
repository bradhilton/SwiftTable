//
//  _Row.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

class EmptySection : RowSection {
    var rows = OrderedObjectSet<RowSource>()
}

public protocol _Row : class {
    weak var section: SectionInterface? { get set }
}

extension _Row {
    
    public var section: SectionInterface? {
        get {
            return getAssociatedValue(key: "section", object: self)
        }
        set {
            set(weakAssociatedValue: newValue as AnyObject, key: "section", object: self)
        }
    }
    
    var _section: SectionInterface {
        return section ?? EmptySection()
    }
    
}

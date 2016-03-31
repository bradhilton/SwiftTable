//
//  _Row.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

class EmptySection : RowSection {
    var rows = OrderedSet<RowSource>()
}

public protocol _Row : class {
    weak var section: SectionInterface? { get set }
}

extension _Row {
    
    public var section: SectionInterface? {
        get {
            return getAssociatedValueForProperty("section", ofObject: self)
        }
        set {
            setWeakAssociatedValue(newValue as? AnyObject, forProperty: "section", ofObject: self)
        }
    }
    
    var _section: SectionInterface {
        return section ?? EmptySection()
    }
    
}

//
//  _Row.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import OrderedObjectSet

private var sectionKey = "section"

class EmptySection : RowSection {
    var rows = OrderedObjectSet<RowSource>()
}

public protocol _Row : class {
    var section: SectionInterface? { get set }
}

extension _Row {
    
    public var section: SectionInterface? {
        get {
            return objc_getAssociatedObject(self, &sectionKey) as? SectionInterface
        }
        set {
            objc_setAssociatedObject(self, &sectionKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var _section: SectionInterface {
        return section ?? EmptySection()
    }
    
}

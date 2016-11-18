//
//  _Table.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

public protocol _Table : class {
    weak var parent: ParentInterface? { get set }
}

extension _Table {
    
    public var parent: ParentInterface? {
        get {
            return getAssociatedValue(key: "parent", object: self)
        }
        set {
            set(weakAssociatedValue: newValue as AnyObject, key: "parent", object: self)
        }
    }
    
    var _parent: ParentInterface {
        return parent ?? Bridge(tableView: UITableView())
    }
    
}

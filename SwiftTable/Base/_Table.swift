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
            return getAssociatedValueForProperty("parent", ofObject: self)
        }
        set {
            setWeakAssociatedValue(newValue as? AnyObject, forProperty: "parent", ofObject: self)
        }
    }
    
    var _parent: ParentInterface {
        return parent ?? {
            let tableView = UITableView()
            tableView.setUp()
            return Bridge(tableView: tableView)
        }()
    }
    
}

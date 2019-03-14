//
//  _Table.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

private var parentKey = "parent"

public protocol _Table : class {
    var parent: ParentInterface? { get set }
}

extension _Table {
    
    public var parent: ParentInterface? {
        get {
            return objc_getAssociatedObject(self, &parentKey) as? ParentInterface
        }
        set {
            objc_setAssociatedObject(self, &parentKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var _parent: ParentInterface {
        return parent ?? Bridge(tableView: UITableView())
    }
    
}

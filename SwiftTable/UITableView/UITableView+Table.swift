//
//  UITableView+Table.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

func sectionHeightForStyle(style: UITableViewStyle) -> CGFloat {
    return style == .Plain ? 24 : 40
}

extension UITableView {
    
    public weak var table: TableSource? {
        get {
            guard let bridge: Bridge = getAssociatedValueForProperty("table", ofObject: self) else { return nil }
            return bridge.table
        }
        set {
            setAssociatedValue(Bridge(tableView: self, table: newValue), forProperty: "table", ofObject: self)
        }
    }
    
}

//
//  UITableView+Table.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

func sectionHeightForStyle(_ style: UITableViewStyle, header: Bool) -> CGFloat {
    return style == .plain ? 24 : (header ? 40 : 30)
}

extension UITableView {
    
    public weak var table: TableSource? {
        get {
            guard let bridge: Bridge = getAssociatedValue(key: "table", object: self) else { return nil }
            return bridge.table
        }
        set {
            set(associatedValue: Bridge(tableView: self, table: newValue), key: "table", object: self)
        }
    }
    
}

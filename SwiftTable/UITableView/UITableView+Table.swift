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
            return getAssociatedValueForProperty("table", ofObject: self)
        }
        set {
            setWeakAssociatedValue(newValue as? AnyObject, forProperty: "table", ofObject: self)
        }
    }
    
}

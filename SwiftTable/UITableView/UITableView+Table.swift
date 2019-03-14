//
//  UITableView+Table.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

private var bridgeKey = "bridge"

func sectionHeightForStyle(_ style: UITableView.Style, header: Bool) -> CGFloat {
    return style == .plain ? 24 : (header ? 40 : 30)
}

extension UITableView {
    
    public weak var table: TableSource? {
        get {
            return (objc_getAssociatedObject(self, &bridgeKey) as? Bridge)?.table
        }
        set {
            objc_setAssociatedObject(self, &bridgeKey, Bridge(tableView: self, table: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}

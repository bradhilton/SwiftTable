//
//  RowSource+SectionInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/17/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

extension RowSource where Self : SectionSource, Self : SectionInterface {
    
    public var section: SectionInterface? {
        get {
            guard let section: SectionInterface = getAssociatedValue(key: "section", object: self) else {
                return self
            }
            return section
        }
        set {
            set(weakAssociatedValue: newValue as AnyObject, key: "section", object: self)
        }
    }
    
    public func rectForRow(_ row: RowSource) -> CGRect {
        return _table.rectForRow(0, inSection: self)
    }
    
    public func cellForRow(_ row: RowSource) -> UITableViewCell? {
        return table?.cellForRow(0, inSection: self)
    }
    
    public func scrollToRow(_ row: RowSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        table?.scrollToRow(0, inSection: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func insertRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.insertRows([0], inSection: self, withRowAnimation: animation)
    }
    
    public func deleteRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.deleteRows([0], inSection: self, withRowAnimation: animation)
    }
    
    public func reloadRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.reloadRows([0], inSection: self, withRowAnimation: animation)
    }
    
    public func selectRow(_ row: RowSource?, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        table?.selectRow(row != nil ? 0 : nil, inSection: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(_ row: RowSource, animated: Bool) {
        table?.deselectRow(0, inSection: self, animated: animated)
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: RowSource) -> UITableViewCell {
        return _table.dequeueReusableCellWithIdentifier(identifier, forRow: 0, inSection: self)
    }

}

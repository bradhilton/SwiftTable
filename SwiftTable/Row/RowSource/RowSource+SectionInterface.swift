//
//  RowSource+SectionInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/17/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

private var sectionKey = "section"

extension RowSource where Self : SectionSource, Self : SectionInterface {
    
    public var section: SectionInterface? {
        get {
            guard let section = objc_getAssociatedObject(self, &sectionKey) as? SectionInterface else {
                return self
            }
            return section
        }
        set {
            objc_setAssociatedObject(self, &sectionKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public func rectForRow(_ row: RowSource) -> CGRect {
        return _table.rectForRow(0, inSection: self)
    }
    
    public func cellForRow(_ row: RowSource) -> UITableViewCell? {
        return table?.cellForRow(0, inSection: self)
    }
    
    public func scrollToRow(_ row: RowSource, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        table?.scrollToRow(0, inSection: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func insertRow(_ row: RowSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.insertRows([0], inSection: self, withRowAnimation: animation)
    }
    
    public func deleteRow(_ row: RowSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.deleteRows([0], inSection: self, withRowAnimation: animation)
    }
    
    public func reloadRow(_ row: RowSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.reloadRows([0], inSection: self, withRowAnimation: animation)
    }
    
    public func selectRow(_ row: RowSource?, animated: Bool, scrollPosition: UITableView.ScrollPosition) {
        table?.selectRow(row != nil ? 0 : nil, inSection: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(_ row: RowSource, animated: Bool) {
        table?.deselectRow(0, inSection: self, animated: animated)
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: RowSource) -> UITableViewCell {
        return _table.dequeueReusableCellWithIdentifier(identifier, forRow: 0, inSection: self)
    }

}

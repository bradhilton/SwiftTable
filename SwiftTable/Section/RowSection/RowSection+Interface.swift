//
//  RowSection+Interface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension RowSection {
    
    public func rectForRow(_ row: RowSource) -> CGRect {
        return delegate(row) { self.table?.rectForRow($0, inSection: self) } ?? CGRect.zero
    }
    
    public func cellForRow(_ row: RowSource) -> UITableViewCell? {
        return delegate(row) { self.table?.cellForRow($0, inSection: self) }
    }
    
    public func scrollToRow(_ row: RowSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        delegate(row) { self.table?.scrollToRow($0, inSection: self, atScrollPosition: scrollPosition, animated: animated) }
    }
    
    public func insertRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(row) { self.table?.insertRows([$0], inSection: self, withRowAnimation: animation) }
    }
    
    public func deleteRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(row) { self.table?.deleteRows([$0], inSection: self, withRowAnimation: animation) }
    }
    
    public func reloadRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(row) { self.table?.reloadRows([$0], inSection: self, withRowAnimation: animation) }
    }
    
    public func selectRow(_ row: RowSource?, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        let mappedRow = row != nil ? index(row!) : nil
        table?.selectRow(mappedRow, inSection: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(_ row: RowSource, animated: Bool) {
        delegate(row) { self.table?.deselectRow($0, inSection: self, animated: animated) }
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: RowSource) -> UITableViewCell {
        return delegate(row) { self.table?.dequeueReusableCellWithIdentifier(identifier, forRow: $0, inSection: self) } ?? UITableViewCell()
    }
    
}

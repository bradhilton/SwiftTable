//
//  SectionSource+TableInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/17/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

private var tableKey = "table"

extension SectionSource where Self : TableSource, Self : TableInterface {
    
    public var table: TableInterface? {
        get {
            guard let table = objc_getAssociatedObject(self, &tableKey) as? TableInterface else {
                return self
            }
            return table
        }
        set {
            objc_setAssociatedObject(self, &tableKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public func numberOfRowsInSection(_ section: SectionSource) -> Int {
        return section.numberOfRows
    }
    
    public func rectForSection(_ section: SectionSource) -> CGRect {
        return _parent.rectForSection(0, inTable: self)
    }
    
    public func rectForHeaderInSection(_ section: SectionSource) -> CGRect {
        return _parent.rectForHeaderInSection(0, inTable: self)
    }
    
    public func rectForFooterInSection(_ section: SectionSource) -> CGRect {
        return _parent.rectForFooterInSection(0, inTable: self)
    }
    
    public func rectForRow(_ row: Int, inSection section: SectionSource) -> CGRect {
        return _parent.rectForRowAtIndexPath(IndexPath(row: row, section: 0), inTable: self)
    }
    
    public func rowAtPoint(_ point: CGPoint, inSection section: SectionSource) -> Int? {
        return parent?.indexPathForRowAtPoint(point, inTable: self)?.row
    }
    
    public func rowForCell(_ cell: UITableViewCell, inSection section: SectionSource) -> Int? {
        return parent?.indexPathForCell(cell, inTable: self)?.row
    }
    
    public func rowsInRect(_ rect: CGRect, inSection section: SectionSource) -> [Int]? {
        return parent?.indexPathsForRowsInRect(rect, inTable: self)?.map { $0.row }
    }
    
    public func cellForRow(_ row: Int, inSection section: SectionSource) -> UITableViewCell? {
        return parent?.cellForRowAtIndexPath(IndexPath(row: row, section: 0), inTable: self)
    }
    
    public func visibleRowsInSection(_ section: SectionSource) -> [Int]? {
        return parent?.indexPathsForVisibleRowsInTable(self)?.map { $0.row }
    }
    
    public func headerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView? {
        return parent?.headerViewForSection(0, inTable: self)
    }
    
    public func footerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView? {
        return parent?.footerViewForSection(0, inTable: self)
    }
    
    public func scrollToRow(_ row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        parent?.scrollToRowAtIndexPath(IndexPath(row: row, section: 0), inTable: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func insertSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        parent?.insertSections(IndexSet(integer: 0), inTable: self, withRowAnimation: animation)
    }
    
    public func deleteSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        parent?.deleteSections(IndexSet(integer: 0), inTable: self, withRowAnimation: animation)
    }
    
    public func reloadSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        parent?.reloadSections(IndexSet(integer: 0), inTable: self, withRowAnimation: animation)
    }
    
    public func insertRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        parent?.insertRowsAtIndexPaths(rows.map { IndexPath(row: $0, section: 0) }, inTable: self, withRowAnimation: animation)
    }
    
    public func deleteRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        parent?.deleteRowsAtIndexPaths(rows.map { IndexPath(row: $0, section: 0) }, inTable: self, withRowAnimation: animation)
    }
    
    public func reloadRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        parent?.reloadRowsAtIndexPaths(rows.map { IndexPath(row: $0, section: 0) }, inTable: self, withRowAnimation: animation)
    }
    
    public func moveRow(_ row: Int, toRow newRow: Int, inSection section: SectionSource) {
        parent?.moveRowAtIndexPath(IndexPath(row: row, section: 0), toIndexPath: IndexPath(row: newRow, section: 0), inTable: self)
    }
    
    public func selectedRowInSection(_ section: SectionSource) -> Int? {
        return parent?.indexPathForSelectedRowInTable(self)?.row
    }
    
    public func selectedRowsInSection(_ section: SectionSource) -> [Int]? {
        return parent?.indexPathsForSelectedRowsInTable(self)?.map { $0.row }
    }
    
    public func selectRow(_ row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableView.ScrollPosition) {
        parent?.selectRowAtIndexPath(IndexPath(row: row, section: 0), inTable: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(_ row: Int, inSection section: SectionSource, animated: Bool) {
        parent?.deselectRowAtIndexPath(IndexPath(row: row, section: 0), inTable: self, animated: animated)
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell {
        return _parent.dequeueReusableCellWithIdentifier(identifier, forIndexPath: IndexPath(row: row, section: 0), inTable: self)
    }
    
}

//
//  SectionSource+TableInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/17/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

extension SectionSource where Self : TableSource, Self : TableInterface {
    
    public var table: TableInterface? {
        get {
            return getAssociatedValueForProperty("table", ofObject: self) ?? self
        }
        set {
            setWeakAssociatedValue(newValue as? AnyObject, forProperty: "table", ofObject: self)
        }
    }
    
    public func numberOfRowsInSection(section: SectionSource) -> Int {
        return section.numberOfRows
    }
    
    public func rectForSection(section: SectionSource) -> CGRect {
        return _parent.rectForSection(0, inTable: self)
    }
    
    public func rectForHeaderInSection(section: SectionSource) -> CGRect {
        return _parent.rectForHeaderInSection(0, inTable: self)
    }
    
    public func rectForFooterInSection(section: SectionSource) -> CGRect {
        return _parent.rectForFooterInSection(0, inTable: self)
    }
    
    public func rectForRow(row: Int, inSection section: SectionSource) -> CGRect {
        return _parent.rectForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTable: self)
    }
    
    public func rowAtPoint(point: CGPoint, inSection section: SectionSource) -> Int? {
        return parent?.indexPathForRowAtPoint(point, inTable: self)?.row
    }
    
    public func rowForCell(cell: UITableViewCell, inSection section: SectionSource) -> Int? {
        return parent?.indexPathForCell(cell, inTable: self)?.row
    }
    
    public func rowsInRect(rect: CGRect, inSection section: SectionSource) -> [Int]? {
        return parent?.indexPathsForRowsInRect(rect, inTable: self)?.map { $0.row }
    }
    
    public func cellForRow(row: Int, inSection section: SectionSource) -> UITableViewCell? {
        return parent?.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTable: self)
    }
    
    public func visibleRowsInSection(section: SectionSource) -> [Int]? {
        return parent?.indexPathsForVisibleRowsInTable(self)?.map { $0.row }
    }
    
    public func headerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView? {
        return parent?.headerViewForSection(0, inTable: self)
    }
    
    public func footerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView? {
        return parent?.footerViewForSection(0, inTable: self)
    }
    
    public func scrollToRow(row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        parent?.scrollToRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTable: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func insertSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.insertSections(NSIndexSet(index: 0), inTable: self, withRowAnimation: animation)
    }
    
    public func deleteSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.deleteSections(NSIndexSet(index: 0), inTable: self, withRowAnimation: animation)
    }
    
    public func reloadSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.reloadSections(NSIndexSet(index: 0), inTable: self, withRowAnimation: animation)
    }
    
    public func insertRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.insertRowsAtIndexPaths(rows.map { NSIndexPath(forRow: $0, inSection: 0) }, inTable: self, withRowAnimation: animation)
    }
    
    public func deleteRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.deleteRowsAtIndexPaths(rows.map { NSIndexPath(forRow: $0, inSection: 0) }, inTable: self, withRowAnimation: animation)
    }
    
    public func reloadRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.reloadRowsAtIndexPaths(rows.map { NSIndexPath(forRow: $0, inSection: 0) }, inTable: self, withRowAnimation: animation)
    }
    
    public func moveRow(row: Int, toRow newRow: Int, inSection section: SectionSource) {
        parent?.moveRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), toIndexPath: NSIndexPath(forRow: newRow, inSection: 0), inTable: self)
    }
    
    public func selectedRowInSection(section: SectionSource) -> Int? {
        return parent?.indexPathForSelectedRowInTable(self)?.row
    }
    
    public func selectedRowsInSection(section: SectionSource) -> [Int]? {
        return parent?.indexPathsForSelectedRowsInTable(self)?.map { $0.row }
    }
    
    public func selectRow(row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        parent?.selectRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTable: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(row: Int, inSection section: SectionSource, animated: Bool) {
        parent?.deselectRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTable: self, animated: animated)
    }
    
    public func dequeueReusableCellWithIdentifier(identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell {
        return _parent.dequeueReusableCellWithIdentifier(identifier, forIndexPath: NSIndexPath(forRow: row, inSection: 0), inTable: self)
    }
    
}

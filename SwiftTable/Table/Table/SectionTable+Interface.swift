//
//  SectionTable+Interface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension SectionTable {
    
    public func numberOfRowsInSection(_ section: SectionSource) -> Int {
        return delegate(section) { self.parent?.numberOfRowsInSection($0, inTable: self) } ?? 0
    }
    
    public func rectForSection(_ section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForSection($0, inTable: self) } ?? CGRect.zero
    }
    
    public func rectForHeaderInSection(_ section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForHeaderInSection($0, inTable: self) } ?? CGRect.zero
    }
    
    public func rectForFooterInSection(_ section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForFooterInSection($0, inTable: self) } ?? CGRect.zero
    }
    
    public func rectForRow(_ row: Int, inSection section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForRowAtIndexPath(IndexPath(row: row, section: $0), inTable: self) } ?? CGRect.zero
    }
    
    public func rowAtPoint(_ point: CGPoint, inSection section: SectionSource) -> Int? {
        return rowForSection(section, fromIndexPath: parent?.indexPathForRowAtPoint(point, inTable: self))
    }
    
    public func rowForCell(_ cell: UITableViewCell, inSection section: SectionSource) -> Int? {
        return rowForSection(section, fromIndexPath: parent?.indexPathForCell(cell, inTable: self))
    }
    
    public func rowsInRect(_ rect: CGRect, inSection section: SectionSource) -> [Int]? {
        return rowsForSection(section, fromIndexPaths: parent?.indexPathsForRowsInRect(rect, inTable: self))
    }
    
    public func cellForRow(_ row: Int, inSection section: SectionSource) -> UITableViewCell? {
        return delegate(section) { self.parent?.cellForRowAtIndexPath(IndexPath(row: row, section: $0), inTable: self) }
    }
    
    public func visibleRowsInSection(_ section: SectionSource) -> [Int]? {
        return rowsForSection(section, fromIndexPaths: parent?.indexPathsForVisibleRowsInTable(self))
    }
    
    public func headerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView? {
        return delegate(section) { self.parent?.headerViewForSection($0, inTable: self) }
    }
    
    public func footerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView? {
        return delegate(section) { self.parent?.footerViewForSection($0, inTable: self) }
    }
    
    public func scrollToRow(_ row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        delegate(section) { self.parent?.scrollToRowAtIndexPath(IndexPath(row: row, section: $0), inTable: self, atScrollPosition: scrollPosition, animated: animated) }
    }
    
    public func insertSection(_ section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(section) { self.parent?.insertSections(IndexSet(integer: $0), inTable: self, withRowAnimation: animation) }
    }
    
    public func deleteSection(_ section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(section) { self.parent?.deleteSections(IndexSet(integer: $0), inTable: self, withRowAnimation: animation) }
    }
    
    public func reloadSection(_ section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(section) { self.parent?.reloadSections(IndexSet(integer: $0), inTable: self, withRowAnimation: animation) }
    }
    
    public func insertRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.insertRowsAtIndexPaths(indexPathsFromRows(rows, inSection: section), inTable: self, withRowAnimation: animation)
    }
    
    public func deleteRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.deleteRowsAtIndexPaths(indexPathsFromRows(rows, inSection: section), inTable: self, withRowAnimation: animation)
    }
    
    public func reloadRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.reloadRowsAtIndexPaths(indexPathsFromRows(rows, inSection: section), inTable: self, withRowAnimation: animation)
    }
    
    public func moveRow(_ row: Int, toRow newRow: Int, inSection section: SectionSource) {
        delegate(section) { self.parent?.moveRowAtIndexPath(IndexPath(row: row, section: $0), toIndexPath: IndexPath(row: newRow, section: $0), inTable: self) }
    }
    
    public func selectedRowInSection(_ section: SectionSource) -> Int? {
        return rowForSection(section, fromIndexPath: self.parent?.indexPathForSelectedRowInTable(self))
    }
    
    public func selectedRowsInSection(_ section: SectionSource) -> [Int]? {
        return rowsForSection(section, fromIndexPaths: self.parent?.indexPathsForSelectedRowsInTable(self))
    }
    
    public func selectRow(_ row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        delegate(section) { self.parent?.selectRowAtIndexPath(IndexPath(row: row, section: $0), inTable: self, animated: animated, scrollPosition: scrollPosition) }
    }
    
    public func deselectRow(_ row: Int, inSection section: SectionSource, animated: Bool) {
        delegate(section) { self.parent?.deselectRowAtIndexPath(IndexPath(row: row, section: $0), inTable: self, animated: animated) }
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell {
        return delegate(section) { self.parent?.dequeueReusableCellWithIdentifier(identifier, forIndexPath: IndexPath(row: row, section: $0), inTable: self) } ?? UITableViewCell()
    }
    
}

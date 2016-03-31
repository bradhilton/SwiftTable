//
//  SectionTable+Interface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension SectionTable {
    
    func numberOfRowsInSection(section: SectionSource) -> Int {
        return delegate(section) { self.parent?.numberOfRowsInSection($0, inTable: self) } ?? 0
    }
    
    func rectForSection(section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForSection($0, inTable: self) } ?? CGRectZero
    }
    
    func rectForHeaderInSection(section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForHeaderInSection($0, inTable: self) } ?? CGRectZero
    }
    
    func rectForFooterInSection(section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForFooterInSection($0, inTable: self) } ?? CGRectZero
    }
    
    func rectForRow(row: Int, inSection section: SectionSource) -> CGRect {
        return delegate(section) { self.parent?.rectForRowAtIndexPath(NSIndexPath(forRow: row, inSection: $0), inTable: self) } ?? CGRectZero
    }
    
    func rowAtPoint(point: CGPoint, inSection section: SectionSource) -> Int? {
        return rowForSection(section, fromIndexPath: parent?.indexPathForRowAtPoint(point, inTable: self))
    }
    
    func rowForCell(cell: UITableViewCell, inSection section: SectionSource) -> Int? {
        return rowForSection(section, fromIndexPath: parent?.indexPathForCell(cell, inTable: self))
    }
    
    func rowsInRect(rect: CGRect, inSection section: SectionSource) -> [Int]? {
        return rowsForSection(section, fromIndexPaths: parent?.indexPathsForRowsInRect(rect, inTable: self))
    }
    
    func cellForRow(row: Int, inSection section: SectionSource) -> UITableViewCell? {
        return delegate(section) { self.parent?.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: $0), inTable: self) }
    }
    
    func visibleRowsInSection(section: SectionSource) -> [Int]? {
        return rowsForSection(section, fromIndexPaths: parent?.indexPathsForVisibleRowsInTable(self))
    }
    
    func headerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView? {
        return delegate(section) { self.parent?.headerViewForSection($0, inTable: self) }
    }
    
    func footerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView? {
        return delegate(section) { self.parent?.footerViewForSection($0, inTable: self) }
    }
    
    func scrollToRow(row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        delegate(section) { self.parent?.scrollToRowAtIndexPath(NSIndexPath(forRow: row, inSection: $0), inTable: self, atScrollPosition: scrollPosition, animated: animated) }
    }
    
    func insertSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(section) { self.parent?.insertSections(NSIndexSet(index: $0), inTable: self, withRowAnimation: animation) }
    }
    
    func deleteSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(section) { self.parent?.deleteSections(NSIndexSet(index: $0), inTable: self, withRowAnimation: animation) }
    }
    
    func reloadSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        delegate(section) { self.parent?.reloadSections(NSIndexSet(index: $0), inTable: self, withRowAnimation: animation) }
    }
    
    func insertRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.insertRowsAtIndexPaths(indexPathsFromRows(rows, inSection: section), inTable: self, withRowAnimation: animation)
    }
    
    func deleteRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.deleteRowsAtIndexPaths(indexPathsFromRows(rows, inSection: section), inTable: self, withRowAnimation: animation)
    }
    
    func reloadRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.reloadRowsAtIndexPaths(indexPathsFromRows(rows, inSection: section), inTable: self, withRowAnimation: animation)
    }
    
    func moveRow(row: Int, toRow newRow: Int, inSection section: SectionSource) {
        delegate(section) { self.parent?.moveRowAtIndexPath(NSIndexPath(forRow: row, inSection: $0), toIndexPath: NSIndexPath(forRow: newRow, inSection: $0), inTable: self) }
    }
    
    func selectedRowInSection(section: SectionSource) -> Int? {
        return rowForSection(section, fromIndexPath: self.parent?.indexPathForSelectedRowInTable(self))
    }
    
    func selectedRowsInSection(section: SectionSource) -> [Int]? {
        return rowsForSection(section, fromIndexPaths: self.parent?.indexPathsForSelectedRowsInTable(self))
    }
    
    func selectRow(row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        delegate(section) { self.parent?.selectRowAtIndexPath(NSIndexPath(forRow: row, inSection: $0), inTable: self, animated: animated, scrollPosition: scrollPosition) }
    }
    
    func deselectRow(row: Int, inSection section: SectionSource, animated: Bool) {
        delegate(section) { self.parent?.deselectRowAtIndexPath(NSIndexPath(forRow: row, inSection: $0), inTable: self, animated: animated) }
    }
    
    func dequeueReusableCellWithIdentifier(identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell {
        return delegate(section) { self.parent?.dequeueReusableCellWithIdentifier(identifier, forIndexPath: NSIndexPath(forRow: row, inSection: $0), inTable: self) } ?? UITableViewCell()
    }
    
}

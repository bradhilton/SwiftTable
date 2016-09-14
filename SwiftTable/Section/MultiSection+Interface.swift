//
//  MultiSection+Interface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 9/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

extension MultiSection {
    
    public func numberOfRowsInSection(section: SectionSource) -> Int {
        return section.numberOfRows
    }
    
    public func rectForSection(section: SectionSource) -> CGRect {
        return _table.rectForSection(self)
    }
    
    public func rectForHeaderInSection(section: SectionSource) -> CGRect {
        return _table.rectForHeaderInSection(section)
    }
    
    public func rectForFooterInSection(section: SectionSource) -> CGRect {
        return _table.rectForFooterInSection(self)
    }
    
    public func rectForRow(row: Int, inSection section: SectionSource) -> CGRect {
        return _table.rectForRow(rowFromSection(section, row: row), inSection: self)
    }
    
    public func rowAtPoint(point: CGPoint, inSection section: SectionSource) -> Int? {
        return table?.rowAtPoint(point, inSection: self).flatMap { self.rowForSection(section, row: $0) }
    }
    
    public func rowForCell(cell: UITableViewCell, inSection section: SectionSource) -> Int? {
        return table?.rowForCell(cell, inSection: self).flatMap { self.rowForSection(section, row: $0) }
    }
    
    public func rowsInRect(rect: CGRect, inSection section: SectionSource) -> [Int]? {
        return table?.rowsInRect(rect, inSection: section)?.map { self.rowForSection(section, row: $0) }
    }
    
    public func cellForRow(row: Int, inSection section: SectionSource) -> UITableViewCell? {
        return table?.cellForRow(rowForSection(section, row: row), inSection: self)
    }
    
    public func visibleRowsInSection(section: SectionSource) -> [Int]? {
        return table?.visibleRowsInSection(self)?.map { self.rowForSection(section, row: $0) }
    }
    
    public func headerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView? {
        return table?.headerViewForSection(self)
    }
    
    public func footerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView? {
        return table?.footerViewForSection(self)
    }
    
    public func scrollToRow(row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        table?.scrollToRow(rowFromSection(section, row: row), inSection: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func insertSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.insertRows(rowsFromSection(section), inSection: self, withRowAnimation: animation)
    }
    
    public func deleteSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.deleteRows(rowsFromSection(section), inSection: self, withRowAnimation: animation)
    }
    
    public func reloadSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.deleteRows(rowsFromSection(section), inSection: self, withRowAnimation: animation)
    }
    
    public func insertRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.insertRows(rowsFromSection(section, rows: rows), inSection: self, withRowAnimation: animation)
    }
    
    public func deleteRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.deleteRows(rowsFromSection(section, rows: rows), inSection: self, withRowAnimation: animation)
    }
    
    public func reloadRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation) {
        table?.reloadRows(rowsFromSection(section, rows: rows), inSection: self, withRowAnimation: animation)
    }
    
    public func moveRow(row: Int, toRow newRow: Int, inSection section: SectionSource) {
        table?.moveRow(rowFromSection(section, row: row), toRow: rowFromSection(section, row: newRow), inSection: self)
    }
    
    public func selectedRowInSection(section: SectionSource) -> Int? {
        return table?.selectedRowInSection(self).flatMap { rowForSection(section, row: $0) }
    }
    
    public func selectedRowsInSection(section: SectionSource) -> [Int]? {
        return table?.selectedRowsInSection(section)?.flatMap { rowForSection(section, row: $0) }
    }
    
    public func selectRow(row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        table?.selectRow(row.flatMap { self.rowFromSection(section, row: $0) }, inSection: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(row: Int, inSection section: SectionSource, animated: Bool) {
        table?.deselectRow(rowFromSection(section, row: row), inSection: self, animated: animated)
    }
    
    public func dequeueReusableCellWithIdentifier(identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell {
        return _table.dequeueReusableCellWithIdentifier(identifier, forRow: rowFromSection(section, row: row), inSection: self)
    }
    
}

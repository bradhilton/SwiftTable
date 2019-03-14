//
//  MultiSection+Interface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 9/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension MultiSection {
    
    public func numberOfRowsInSection(_ section: SectionSource) -> Int {
        return section.numberOfRows
    }
    
    public func rectForSection(_ section: SectionSource) -> CGRect {
        return _table.rectForSection(self)
    }
    
    public func rectForHeaderInSection(_ section: SectionSource) -> CGRect {
        return _table.rectForHeaderInSection(section)
    }
    
    public func rectForFooterInSection(_ section: SectionSource) -> CGRect {
        return _table.rectForFooterInSection(self)
    }
    
    public func rectForRow(_ row: Int, inSection section: SectionSource) -> CGRect {
        return _table.rectForRow(rowFromSection(section, row: row), inSection: self)
    }
    
    public func rowAtPoint(_ point: CGPoint, inSection section: SectionSource) -> Int? {
        return table?.rowAtPoint(point, inSection: self).flatMap { self.rowForSection(section, row: $0) }
    }
    
    public func rowForCell(_ cell: UITableViewCell, inSection section: SectionSource) -> Int? {
        return table?.rowForCell(cell, inSection: self).flatMap { self.rowForSection(section, row: $0) }
    }
    
    public func rowsInRect(_ rect: CGRect, inSection section: SectionSource) -> [Int]? {
        return table?.rowsInRect(rect, inSection: section)?.map { self.rowForSection(section, row: $0) }
    }
    
    public func cellForRow(_ row: Int, inSection section: SectionSource) -> UITableViewCell? {
        return table?.cellForRow(rowForSection(section, row: row), inSection: self)
    }
    
    public func visibleRowsInSection(_ section: SectionSource) -> [Int]? {
        return table?.visibleRowsInSection(self)?.map { self.rowForSection(section, row: $0) }
    }
    
    public func headerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView? {
        return table?.headerViewForSection(self)
    }
    
    public func footerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView? {
        return table?.footerViewForSection(self)
    }
    
    public func scrollToRow(_ row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        table?.scrollToRow(rowFromSection(section, row: row), inSection: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func insertSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.insertRows(rowsFromSection(section), inSection: self, withRowAnimation: animation)
    }
    
    public func deleteSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.deleteRows(rowsFromSection(section), inSection: self, withRowAnimation: animation)
    }
    
    public func reloadSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.deleteRows(rowsFromSection(section), inSection: self, withRowAnimation: animation)
    }
    
    public func insertRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.insertRows(rowsFromSection(section, rows: rows), inSection: self, withRowAnimation: animation)
    }
    
    public func deleteRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.deleteRows(rowsFromSection(section, rows: rows), inSection: self, withRowAnimation: animation)
    }
    
    public func reloadRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation) {
        table?.reloadRows(rowsFromSection(section, rows: rows), inSection: self, withRowAnimation: animation)
    }
    
    public func moveRow(_ row: Int, toRow newRow: Int, inSection section: SectionSource) {
        table?.moveRow(rowFromSection(section, row: row), toRow: rowFromSection(section, row: newRow), inSection: self)
    }
    
    public func selectedRowInSection(_ section: SectionSource) -> Int? {
        return table?.selectedRowInSection(self).flatMap { rowForSection(section, row: $0) }
    }
    
    public func selectedRowsInSection(_ section: SectionSource) -> [Int]? {
        return table?.selectedRowsInSection(section)?.compactMap { rowForSection(section, row: $0) }
    }
    
    public func selectRow(_ row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableView.ScrollPosition) {
        table?.selectRow(row.flatMap { self.rowFromSection(section, row: $0) }, inSection: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRow(_ row: Int, inSection section: SectionSource, animated: Bool) {
        table?.deselectRow(rowFromSection(section, row: row), inSection: self, animated: animated)
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell {
        return _table.dequeueReusableCellWithIdentifier(identifier, forRow: rowFromSection(section, row: row), inSection: self)
    }
    
}

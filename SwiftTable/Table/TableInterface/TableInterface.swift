//
//  TableInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol TableInterface : _Table {
    
    func numberOfRowsInSection(section: SectionSource) -> Int
    func rectForSection(section: SectionSource) -> CGRect
    func rectForHeaderInSection(section: SectionSource) -> CGRect
    func rectForFooterInSection(section: SectionSource) -> CGRect
    func rectForRow(row: Int, inSection section: SectionSource) -> CGRect
    func rowAtPoint(point: CGPoint, inSection section: SectionSource) -> Int?
    func rowForCell(cell: UITableViewCell, inSection section: SectionSource) -> Int?
    func rowsInRect(rect: CGRect, inSection section: SectionSource) -> [Int]?
    func cellForRow(row: Int, inSection section: SectionSource) -> UITableViewCell?
    func visibleRowsInSection(section: SectionSource) -> [Int]?
    func headerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView?
    func footerViewForSection(section: SectionSource) -> UITableViewHeaderFooterView?
    func scrollToRow(row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool)

    func insertSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadSection(section: SectionSource, withRowAnimation animation: UITableViewRowAnimation)
    func insertRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadRows(rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableViewRowAnimation)
    func moveRow(row: Int, toRow newRow: Int, inSection section: SectionSource)
    
    func selectedRowInSection(section: SectionSource) -> Int?
    func selectedRowsInSection(section: SectionSource) -> [Int]?
    
    func selectRow(row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableViewScrollPosition)
    func deselectRow(row: Int, inSection section: SectionSource, animated: Bool)
    
    func dequeueReusableCellWithIdentifier(identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell
    
}
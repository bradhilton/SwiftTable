//
//  TableInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol TableInterface : _Table {
    
    func numberOfRowsInSection(_ section: SectionSource) -> Int
    func rectForSection(_ section: SectionSource) -> CGRect
    func rectForHeaderInSection(_ section: SectionSource) -> CGRect
    func rectForFooterInSection(_ section: SectionSource) -> CGRect
    func rectForRow(_ row: Int, inSection section: SectionSource) -> CGRect
    func rowAtPoint(_ point: CGPoint, inSection section: SectionSource) -> Int?
    func rowForCell(_ cell: UITableViewCell, inSection section: SectionSource) -> Int?
    func rowsInRect(_ rect: CGRect, inSection section: SectionSource) -> [Int]?
    func cellForRow(_ row: Int, inSection section: SectionSource) -> UITableViewCell?
    func visibleRowsInSection(_ section: SectionSource) -> [Int]?
    func headerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView?
    func footerViewForSection(_ section: SectionSource) -> UITableViewHeaderFooterView?
    func scrollToRow(_ row: Int, inSection section: SectionSource, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool)

    func insertSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation)
    func deleteSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation)
    func reloadSection(_ section: SectionSource, withRowAnimation animation: UITableView.RowAnimation)
    func insertRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation)
    func deleteRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation)
    func reloadRows(_ rows: [Int], inSection section: SectionSource, withRowAnimation animation: UITableView.RowAnimation)
    func moveRow(_ row: Int, toRow newRow: Int, inSection section: SectionSource)
    
    func selectedRowInSection(_ section: SectionSource) -> Int?
    func selectedRowsInSection(_ section: SectionSource) -> [Int]?
    
    func selectRow(_ row: Int?, inSection section: SectionSource, animated: Bool, scrollPosition: UITableView.ScrollPosition)
    func deselectRow(_ row: Int, inSection section: SectionSource, animated: Bool)
    
    func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: Int, inSection section: SectionSource) -> UITableViewCell
    
}

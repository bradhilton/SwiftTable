//
//  Bride+TableInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension Bridge : ParentInterface {
    
    var style: UITableView.Style {
        return _tableView.style
    }
    
    var rowHeight: CGFloat {
        get {
            return _tableView.rowHeight
        }
        set {
            tableView?.rowHeight = newValue
        }
    }
    
    var sectionHeaderHeight: CGFloat {
        get {
            return _tableView.sectionHeaderHeight
        }
        set {
            tableView?.sectionHeaderHeight = newValue
        }
    }
    
    var sectionFooterHeight: CGFloat {
        get {
            return _tableView.sectionFooterHeight
        }
        set {
            tableView?.sectionFooterHeight = newValue
        }
    }
    
    var estimatedRowHeight: CGFloat {
        get {
            return _tableView.estimatedRowHeight
        }
        set {
            tableView?.estimatedRowHeight = newValue
        }
    }
    
    var estimatedSectionHeaderHeight: CGFloat {
        get {
            return _tableView.estimatedSectionHeaderHeight
        }
        set {
            tableView?.estimatedSectionHeaderHeight = newValue
        }
    }
    
    var estimatedSectionFooterHeight: CGFloat {
        get {
            return _tableView.estimatedSectionFooterHeight
        }
        set {
            tableView?.estimatedSectionFooterHeight = newValue
        }
    }
    
    var separatorInset: UIEdgeInsets {
        get {
            return _tableView.separatorInset
        }
        set {
            tableView?.separatorInset = newValue
        }
    }
    
    var backgroundView: UIView? {
        get {
            return tableView?.backgroundView
        }
        set {
            tableView?.backgroundView = newValue
        }
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    func reloadSectionIndexTitles() {
        tableView?.reloadSectionIndexTitles()
    }
    
    func numberOfSectionsInTable(_ table: TableSource) -> Int {
        return _tableView.numberOfSections
    }
    
    func numberOfRowsInSection(_ section: Int, inTable table: TableSource) -> Int {
        return _tableView.numberOfRows(inSection: section)
    }
    
    func rectForSection(_ section: Int, inTable table: TableSource) -> CGRect {
        return _tableView.rect(forSection: section)
    }
    
    func rectForHeaderInSection(_ section: Int, inTable table: TableSource) -> CGRect {
        return _tableView.rectForHeader(inSection: section)
    }
    
    func rectForFooterInSection(_ section: Int, inTable table: TableSource) -> CGRect {
        return _tableView.rectForFooter(inSection: section)
    }
    
    func rectForRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource) -> CGRect {
        return _tableView.rectForRow(at: indexPath)
    }
    
    func indexPathForRowAtPoint(_ point: CGPoint, inTable table: TableSource) -> IndexPath? {
        return tableView?.indexPathForRow(at: point)
    }
    
    func indexPathForCell(_ cell: UITableViewCell, inTable table: TableSource) -> IndexPath? {
        return tableView?.indexPath(for: cell)
    }
    
    func indexPathsForRowsInRect(_ rect: CGRect, inTable table: TableSource) -> [IndexPath]? {
        return tableView?.indexPathsForRows(in: rect)
    }
    
    func cellForRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource) -> UITableViewCell? {
        return tableView?.cellForRow(at: indexPath)
    }
    
    var visibleCells: [UITableViewCell] {
        return _tableView.visibleCells
    }
    
    func indexPathsForVisibleRowsInTable(_ table: TableSource) -> [IndexPath]? {
        return tableView?.indexPathsForVisibleRows
    }
    
    func headerViewForSection(_ section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView? {
        return tableView?.headerView(forSection: section)
    }
    
    func footerViewForSection(_ section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView? {
        return tableView?.footerView(forSection: section)
    }
    
    func scrollToRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        tableView?.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    func scrollToNearestSelectedRowAtScrollPosition(_ scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        tableView?.scrollToNearestSelectedRow(at: scrollPosition, animated: animated)
    }
    
    func beginUpdates() {
        tableView?.beginUpdates()
    }
    
    func endUpdates() {
        tableView?.endUpdates()
    }
    
    func insertSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableView.RowAnimation) {
        tableView?.insertSections(sections, with: animation)
    }
    
    func deleteSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableView.RowAnimation) {
        tableView?.deleteSections(sections, with: animation)
    }
    
    func reloadSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableView.RowAnimation) {
        tableView?.reloadSections(sections, with: animation)
    }
    
    func moveSection(_ section: Int, toSection newSection: Int, inTable table: TableSource) {
        tableView?.moveSection(section, toSection: newSection)
    }
    
    func insertRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableView.RowAnimation) {
        tableView?.insertRows(at: indexPaths, with: animation)
    }
    
    func deleteRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableView.RowAnimation) {
        tableView?.deleteRows(at: indexPaths, with: animation)
    }
    
    func reloadRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableView.RowAnimation) {
        tableView?.reloadRows(at: indexPaths, with: animation)
    }
    
    func moveRowAtIndexPath(_ indexPath: IndexPath, toIndexPath newIndexPath: IndexPath, inTable table: TableSource) {
        tableView?.moveRow(at: indexPath, to: newIndexPath)
    }
    
    var editing: Bool {
        get {
            return _tableView.isEditing
        }
        set {
            tableView?.isEditing = newValue
        }
    }
    
    func setEditing(_ editing: Bool, animated: Bool) {
        tableView?.setEditing(editing, animated: animated)
    }
    
    var allowsSelection: Bool {
        get {
            return _tableView.allowsSelection
        }
        set {
            tableView?.allowsSelection = newValue
        }
    }
    
    var allowsSelectionDuringEditing: Bool {
        get {
            return _tableView.allowsSelectionDuringEditing
        }
        set {
            tableView?.allowsSelectionDuringEditing = newValue
        }
    }
    
    var allowsMultipleSelection: Bool {
        get {
            return _tableView.allowsMultipleSelection
        }
        set {
            tableView?.allowsMultipleSelection = newValue
        }
    }
    
    var allowsMultipleSelectionDuringEditing: Bool {
        get {
            return _tableView.allowsMultipleSelectionDuringEditing
        }
        set {
            tableView?.allowsMultipleSelectionDuringEditing = newValue
        }
    }
    
    func indexPathForSelectedRowInTable(_ table: TableSource) -> IndexPath? {
        return tableView?.indexPathForSelectedRow
    }
    
    func indexPathsForSelectedRowsInTable(_ table: TableSource) -> [IndexPath]? {
        return tableView?.indexPathsForSelectedRows
    }
    
    func selectRowAtIndexPath(_ indexPath: IndexPath?, inTable table: TableSource, animated: Bool, scrollPosition: UITableView.ScrollPosition) {
        tableView?.selectRow(at: indexPath, animated: animated, scrollPosition: scrollPosition)
    }
    
    func deselectRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource, animated: Bool) {
        tableView?.deselectRow(at: indexPath, animated: animated)
    }
    
    var sectionIndexMinimumDisplayRowCount: Int {
        get {
            return _tableView.sectionIndexMinimumDisplayRowCount
        }
        set {
            tableView?.sectionIndexMinimumDisplayRowCount = newValue
        }
    }
    
    var sectionIndexColor: UIColor? {
        get {
            return tableView?.sectionIndexColor
        }
        set {
            tableView?.sectionIndexColor = newValue
        }
    }
    
    var sectionIndexBackgroundColor: UIColor? {
        get {
            return tableView?.sectionIndexBackgroundColor
        }
        set {
            tableView?.sectionIndexBackgroundColor = newValue
        }
    }
    
    var sectionIndexTrackingBackgroundColor: UIColor? {
        get {
            return tableView?.sectionIndexTrackingBackgroundColor
        }
        set {
            tableView?.sectionIndexTrackingBackgroundColor = newValue
        }
    }
    
    var separatorStyle: UITableViewCell.SeparatorStyle {
        get {
            return _tableView.separatorStyle
        }
        set {
            tableView?.separatorStyle = newValue
        }
    }
    var separatorColor: UIColor? {
        get {
            return tableView?.separatorColor
        }
        set {
            tableView?.separatorColor = newValue
        }
    }
    
    var separatorEffect: UIVisualEffect? {
        get {
            return tableView?.separatorEffect
        }
        set {
            tableView?.separatorEffect = newValue
        }
    }
    
    var tableHeaderView: UIView? {
        get {
            return tableView?.tableHeaderView
        }
        set {
            tableView?.tableHeaderView = newValue
        }
    }
    
    var tableFooterView: UIView? {
        get {
            return tableView?.tableFooterView
        }
        set {
            tableView?.tableFooterView = newValue
        }
    }
    
    func dequeueReusableCellWithIdentifier(_ identifier: String) -> UITableViewCell? {
        return tableView?.dequeueReusableCell(withIdentifier: identifier)
    }
    
    func dequeueReusableCellWithIdentifier(_ identifier: String, forIndexPath indexPath: IndexPath, inTable table: TableSource) -> UITableViewCell {
        return _tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    func dequeueReusableHeaderFooterViewWithIdentifier(_ identifier: String) -> UITableViewHeaderFooterView? {
        return tableView?.dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
    
    func registerNib(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        tableView?.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerClass(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        tableView?.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerNib(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
        tableView?.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerClass(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) {
        tableView?.register(aClass, forHeaderFooterViewReuseIdentifier: identifier)
    }

    
}

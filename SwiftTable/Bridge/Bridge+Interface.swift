//
//  Bride+TableInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension Bridge : ParentInterface {
    
    var style: UITableViewStyle {
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
    
    func numberOfSectionsInTable(table: TableSource) -> Int {
        return _tableView.numberOfSections
    }
    
    func numberOfRowsInSection(section: Int, inTable table: TableSource) -> Int {
        return _tableView.numberOfRowsInSection(section)
    }
    
    func rectForSection(section: Int, inTable table: TableSource) -> CGRect {
        return _tableView.rectForSection(section)
    }
    
    func rectForHeaderInSection(section: Int, inTable table: TableSource) -> CGRect {
        return _tableView.rectForHeaderInSection(section)
    }
    
    func rectForFooterInSection(section: Int, inTable table: TableSource) -> CGRect {
        return _tableView.rectForFooterInSection(section)
    }
    
    func rectForRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource) -> CGRect {
        return _tableView.rectForRowAtIndexPath(indexPath)
    }
    
    func indexPathForRowAtPoint(point: CGPoint, inTable table: TableSource) -> NSIndexPath? {
        return tableView?.indexPathForRowAtPoint(point)
    }
    
    func indexPathForCell(cell: UITableViewCell, inTable table: TableSource) -> NSIndexPath? {
        return tableView?.indexPathForCell(cell)
    }
    
    func indexPathsForRowsInRect(rect: CGRect, inTable table: TableSource) -> [NSIndexPath]? {
        return tableView?.indexPathsForRowsInRect(rect)
    }
    
    func cellForRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource) -> UITableViewCell? {
        return tableView?.cellForRowAtIndexPath(indexPath)
    }
    
    var visibleCells: [UITableViewCell] {
        return _tableView.visibleCells
    }
    
    func indexPathsForVisibleRowsInTable(table: TableSource) -> [NSIndexPath]? {
        return tableView?.indexPathsForVisibleRows
    }
    
    func headerViewForSection(section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView? {
        return tableView?.headerViewForSection(section)
    }
    
    func footerViewForSection(section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView? {
        return tableView?.footerViewForSection(section)
    }
    
    func scrollToRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        tableView?.scrollToRowAtIndexPath(indexPath, atScrollPosition: scrollPosition, animated: animated)
    }
    
    func scrollToNearestSelectedRowAtScrollPosition(scrollPosition: UITableViewScrollPosition, animated: Bool) {
        tableView?.scrollToNearestSelectedRowAtScrollPosition(scrollPosition, animated: animated)
    }
    
    func beginUpdates() {
        tableView?.beginUpdates()
    }
    
    func endUpdates() {
        tableView?.endUpdates()
    }
    
    func insertSections(sections: NSIndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        tableView?.insertSections(sections, withRowAnimation: animation)
    }
    
    func deleteSections(sections: NSIndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        tableView?.deleteSections(sections, withRowAnimation: animation)
    }
    
    func reloadSections(sections: NSIndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        tableView?.reloadSections(sections, withRowAnimation: animation)
    }
    
    func moveSection(section: Int, toSection newSection: Int, inTable table: TableSource) {
        tableView?.moveSection(section, toSection: newSection)
    }
    
    func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        tableView?.insertRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
    }
    
    func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        tableView?.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
    }
    
    func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        tableView?.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
    }
    
    func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath, inTable table: TableSource) {
        tableView?.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
    }
    
    var editing: Bool {
        get {
            return _tableView.editing
        }
        set {
            tableView?.editing = newValue
        }
    }
    
    func setEditing(editing: Bool, animated: Bool) {
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
    
    func indexPathForSelectedRowInTable(table: TableSource) -> NSIndexPath? {
        return tableView?.indexPathForSelectedRow
    }
    
    func indexPathsForSelectedRowsInTable(table: TableSource) -> [NSIndexPath]? {
        return tableView?.indexPathsForSelectedRows
    }
    
    func selectRowAtIndexPath(indexPath: NSIndexPath?, inTable table: TableSource, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        tableView?.selectRowAtIndexPath(indexPath, animated: animated, scrollPosition: scrollPosition)
    }
    
    func deselectRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource, animated: Bool) {
        tableView?.deselectRowAtIndexPath(indexPath, animated: animated)
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
    
    var separatorStyle: UITableViewCellSeparatorStyle {
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
    
    func dequeueReusableCellWithIdentifier(identifier: String) -> UITableViewCell? {
        return tableView?.dequeueReusableCellWithIdentifier(identifier)
    }
    
    func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath, inTable table: TableSource) -> UITableViewCell {
        return _tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
    }
    
    func dequeueReusableHeaderFooterViewWithIdentifier(identifier: String) -> UITableViewHeaderFooterView? {
        return tableView?.dequeueReusableHeaderFooterViewWithIdentifier(identifier)
    }
    
    func registerNib(nib: UINib?, forCellReuseIdentifier identifier: String) {
        tableView?.registerNib(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerClass(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        tableView?.registerClass(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerNib(nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
        tableView?.registerNib(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerClass(aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) {
        tableView?.registerClass(aClass, forHeaderFooterViewReuseIdentifier: identifier)
    }

    
}

//
//  MultiTable+Interface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//


extension MultiTable {
    
    public var style: UITableViewStyle {
        return _parent.style
    }
    
    public var rowHeight: CGFloat {
        get {
            return _parent.rowHeight
        }
        set {
            parent?.rowHeight = newValue
        }
    }
    
    public var sectionHeaderHeight: CGFloat {
        get {
            return _parent.sectionHeaderHeight
        }
        set {
            parent?.sectionHeaderHeight = newValue
        }
    }
    
    public var sectionFooterHeight: CGFloat {
        get {
            return _parent.sectionFooterHeight
        }
        set {
            parent?.sectionFooterHeight = newValue
        }
    }
    
    public var estimatedRowHeight: CGFloat {
        get {
            return _parent.estimatedRowHeight
        }
        set {
            parent?.estimatedRowHeight = newValue
        }
    }
    
    public var estimatedSectionHeaderHeight: CGFloat {
        get {
            return _parent.estimatedSectionHeaderHeight
        }
        set {
            parent?.estimatedSectionHeaderHeight = newValue
        }
    }
    
    public var estimatedSectionFooterHeight: CGFloat {
        get {
            return _parent.estimatedSectionFooterHeight
        }
        set {
            parent?.estimatedSectionFooterHeight = newValue
        }
    }
    
    public var separatorInset: UIEdgeInsets {
        get {
            return _parent.separatorInset
        }
        set {
            parent?.separatorInset = newValue
        }
    }
    
    public var backgroundView: UIView? {
        get {
            return parent?.backgroundView
        }
        set {
            parent?.backgroundView = newValue
        }
    }
    
    public func reloadData() {
        parent?.reloadData()
    }
    
    public func reloadSectionIndexTitles() {
        parent?.reloadSectionIndexTitles()
    }
    
    public func numberOfSectionsInTable(_ table: TableSource) -> Int {
        return table.numberOfSections
    }
    
    public func numberOfRowsInSection(_ section: Int, inTable table: TableSource) -> Int {
        return table.numberOfRowsInSection(section)
    }
    
    public func rectForSection(_ section: Int, inTable table: TableSource) -> CGRect {
        return _parent.rectForSection(sectionFromTable(table, section: section), inTable: self)
    }
    
    public func rectForHeaderInSection(_ section: Int, inTable table: TableSource) -> CGRect {
        return _parent.rectForHeaderInSection(sectionFromTable(table, section: section), inTable: self)
    }
    
    public func rectForFooterInSection(_ section: Int, inTable table: TableSource) -> CGRect {
        return _parent.rectForFooterInSection(sectionFromTable(table, section: section), inTable: self)
    }
    
    public func rectForRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource) -> CGRect {
        return _parent.rectForRowAtIndexPath(indexPathFromTable(table, indexPath: indexPath), inTable: self)
    }
    
    public func indexPathForRowAtPoint(_ point: CGPoint, inTable table: TableSource) -> IndexPath? {
        return optionalIndexPathForTable(table, indexPath: parent?.indexPathForRowAtPoint(point, inTable: self))
    }
    
    public func indexPathForCell(_ cell: UITableViewCell, inTable table: TableSource) -> IndexPath? {
        return optionalIndexPathForTable(table, indexPath: parent?.indexPathForCell(cell, inTable: self))
    }
    
    public func indexPathsForRowsInRect(_ rect: CGRect, inTable table: TableSource) -> [IndexPath]? {
        return indexPathsForTable(table, indexPaths: parent?.indexPathsForRowsInRect(rect, inTable: self))
    }
    
    public func cellForRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource) -> UITableViewCell? {
        return parent?.cellForRowAtIndexPath(indexPathFromTable(table, indexPath: indexPath), inTable: self)
    }
    
    public var visibleCells: [UITableViewCell] {
        return _parent.visibleCells
    }
    
    public func indexPathsForVisibleRowsInTable(_ table: TableSource) -> [IndexPath]? {
        return indexPathsForTable(table, indexPaths: parent?.indexPathsForVisibleRowsInTable(self))
    }
    
    public func headerViewForSection(_ section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView? {
        return parent?.headerViewForSection(sectionFromTable(table, section: section), inTable: self)
    }
    
    public func footerViewForSection(_ section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView? {
        return parent?.footerViewForSection(sectionFromTable(table, section: section), inTable: self)
    }
    
    public func scrollToRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        parent?.scrollToRowAtIndexPath(indexPathFromTable(table, indexPath: indexPath), inTable: self, atScrollPosition: scrollPosition, animated: animated)
    }
    
    public func scrollToNearestSelectedRowAtScrollPosition(_ scrollPosition: UITableViewScrollPosition, animated: Bool) {
        parent?.scrollToNearestSelectedRowAtScrollPosition(scrollPosition, animated: animated)
    }
    
    public func beginUpdates() {
        parent?.beginUpdates()
    }
    
    public func endUpdates() {
        parent?.endUpdates()
    }
    
    public func insertSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.insertSections(indexSetFromTable(table, indexSet: sections), inTable: self, withRowAnimation: animation)
    }
    
    public func deleteSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.deleteSections(indexSetFromTable(table, indexSet: sections), inTable: self, withRowAnimation: animation)
    }
    
    public func reloadSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.reloadSections(indexSetFromTable(table, indexSet: sections), inTable: self, withRowAnimation: animation)
    }
    
    public func moveSection(_ section: Int, toSection newSection: Int, inTable table: TableSource) {
        parent?.moveSection(sectionFromTable(table, section: section), toSection: sectionFromTable(table, section: newSection), inTable: self)
    }
    
    public func insertRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.insertRowsAtIndexPaths(indexPathsFromTable(table, indexPaths: indexPaths), inTable: self, withRowAnimation: animation)
    }
    
    public func deleteRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.deleteRowsAtIndexPaths(indexPathsFromTable(table, indexPaths: indexPaths), inTable: self, withRowAnimation: animation)
    }
    
    public func reloadRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation) {
        parent?.reloadRowsAtIndexPaths(indexPathsFromTable(table, indexPaths: indexPaths), inTable: self, withRowAnimation: animation)
    }
    
    public func moveRowAtIndexPath(_ indexPath: IndexPath, toIndexPath newIndexPath: IndexPath, inTable table: TableSource) {
        parent?.moveRowAtIndexPath(indexPathFromTable(table, indexPath: indexPath), toIndexPath: indexPathFromTable(table, indexPath: newIndexPath), inTable: self)
    }
    
    public var editing: Bool {
        get {
            return _parent.editing
        }
        set {
            parent?.editing = newValue
        }
    }
    
    public func setEditing(_ editing: Bool, animated: Bool) {
        parent?.setEditing(editing, animated: animated)
    }
    
    public var allowsSelection: Bool {
        get {
            return _parent.allowsSelection
        }
        set {
            parent?.allowsSelection = newValue
        }
    }
    
    public var allowsSelectionDuringEditing: Bool {
        get {
            return _parent.allowsSelectionDuringEditing
        }
        set {
            parent?.allowsSelectionDuringEditing = newValue
        }
    }
    
    public var allowsMultipleSelection: Bool {
        get {
            return _parent.allowsMultipleSelection
        }
        set {
            parent?.allowsMultipleSelection = newValue
        }
    }
    
    public var allowsMultipleSelectionDuringEditing: Bool {
        get {
            return _parent.allowsMultipleSelectionDuringEditing
        }
        set {
            parent?.allowsMultipleSelectionDuringEditing = newValue
        }
    }
    
    
    public func indexPathForSelectedRowInTable(_ table: TableSource) -> IndexPath? {
        return optionalIndexPathForTable(table, indexPath: parent?.indexPathForSelectedRowInTable(self))
    }
    
    public func indexPathsForSelectedRowsInTable(_ table: TableSource) -> [IndexPath]? {
        return indexPathsForTable(table, indexPaths: parent?.indexPathsForSelectedRowsInTable(self))
    }
    
    public func selectRowAtIndexPath(_ indexPath: IndexPath?, inTable table: TableSource, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        let mappedIndexPath: IndexPath? = indexPath != nil ? indexPathFromTable(table, indexPath: indexPath!) : nil
        parent?.selectRowAtIndexPath(mappedIndexPath, inTable: self, animated: animated, scrollPosition: scrollPosition)
    }
    
    public func deselectRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource, animated: Bool) {
        parent?.deselectRowAtIndexPath(indexPathFromTable(table, indexPath: indexPath), inTable: self, animated: animated)
    }
    
    public var sectionIndexMinimumDisplayRowCount: Int {
        get {
            return _parent.sectionIndexMinimumDisplayRowCount
        }
        set {
            parent?.sectionIndexMinimumDisplayRowCount = newValue
        }
    }
    
    public var sectionIndexColor: UIColor? {
        get {
            return parent?.sectionIndexColor
        }
        set {
            parent?.sectionIndexColor = newValue
        }
    }
    
    public var sectionIndexBackgroundColor: UIColor? {
        get {
            return parent?.sectionIndexBackgroundColor
        }
        set {
            parent?.sectionIndexBackgroundColor = newValue
        }
    }
    
    public var sectionIndexTrackingBackgroundColor: UIColor? {
        get {
            return parent?.sectionIndexTrackingBackgroundColor
        }
        set {
            parent?.sectionIndexTrackingBackgroundColor = newValue
        }
    }
    
    public var separatorStyle: UITableViewCellSeparatorStyle {
        get {
            return _parent.separatorStyle
        }
        set {
            parent?.separatorStyle = newValue
        }
    }
    
    public var separatorColor: UIColor? {
        get {
            return parent?.separatorColor
        }
        set {
            parent?.separatorColor = newValue
        }
    }
    
    public var separatorEffect: UIVisualEffect? {
        get {
            return parent?.separatorEffect
        }
        set {
            parent?.separatorEffect = newValue
        }
    }
    
    public var tableHeaderView: UIView? {
        get {
            return parent?.tableHeaderView
        }
        set {
            parent?.tableHeaderView = newValue
        }
    }
    
    public var tableFooterView: UIView? {
        get {
            return parent?.tableFooterView
        }
        set {
            parent?.tableFooterView = newValue
        }
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String) -> UITableViewCell? {
        return parent?.dequeueReusableCellWithIdentifier(identifier)
    }
    
    public func dequeueReusableCellWithIdentifier(_ identifier: String, forIndexPath indexPath: IndexPath, inTable table: TableSource) -> UITableViewCell {
        return _parent.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPathFromTable(table, indexPath: indexPath), inTable: self)
    }
    
    public func dequeueReusableHeaderFooterViewWithIdentifier(_ identifier: String) -> UITableViewHeaderFooterView? {
        return parent?.dequeueReusableHeaderFooterViewWithIdentifier(identifier)
    }
    
    public func registerNib(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        parent?.registerNib(nib, forCellReuseIdentifier: identifier)
    }
    
    public func registerClass(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        parent?.registerClass(cellClass, forCellReuseIdentifier: identifier)
    }
    
    public func registerNib(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
        parent?.registerNib(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    public func registerClass(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) {
        parent?.registerClass(aClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
}

//
//  ParentInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol ParentInterface : class {
    
    var style: UITableViewStyle { get }
    var rowHeight: CGFloat { get set }
    var sectionHeaderHeight: CGFloat { get set }
    var sectionFooterHeight: CGFloat { get set }
    var estimatedRowHeight: CGFloat { get set }
    var estimatedSectionHeaderHeight: CGFloat { get set }
    var estimatedSectionFooterHeight: CGFloat { get set }
    var separatorInset: UIEdgeInsets { get set }
    var backgroundView: UIView? { get set }
    
    func reloadData()
    func reloadSectionIndexTitles()
    
    func numberOfSectionsInTable(table: TableSource) -> Int
    func numberOfRowsInSection(section: Int, inTable table: TableSource) -> Int
    func rectForSection(section: Int, inTable table: TableSource) -> CGRect
    func rectForHeaderInSection(section: Int, inTable table: TableSource) -> CGRect
    func rectForFooterInSection(section: Int, inTable table: TableSource) -> CGRect
    func rectForRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource) -> CGRect
    func indexPathForRowAtPoint(point: CGPoint, inTable table: TableSource) -> NSIndexPath?
    func indexPathForCell(cell: UITableViewCell, inTable table: TableSource) -> NSIndexPath?
    func indexPathsForRowsInRect(rect: CGRect, inTable table: TableSource) -> [NSIndexPath]?
    func cellForRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource) -> UITableViewCell?
    var visibleCells: [UITableViewCell] { get }
    func indexPathsForVisibleRowsInTable(table: TableSource) -> [NSIndexPath]?
    func headerViewForSection(section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView?
    func footerViewForSection(section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView?
    func scrollToRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool)
    func scrollToNearestSelectedRowAtScrollPosition(scrollPosition: UITableViewScrollPosition, animated: Bool)
    
    func beginUpdates()
    func endUpdates()
    func insertSections(sections: NSIndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteSections(sections: NSIndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadSections(sections: NSIndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func moveSection(section: Int, toSection newSection: Int, inTable table: TableSource)
    func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath, inTable table: TableSource)
    
    var editing: Bool { get set }
    func setEditing(editing: Bool, animated: Bool)
    var allowsSelection: Bool { get set }
    var allowsSelectionDuringEditing: Bool { get set }
    var allowsMultipleSelection: Bool { get set }
    var allowsMultipleSelectionDuringEditing: Bool { get set }
    
    func indexPathForSelectedRowInTable(table: TableSource) -> NSIndexPath?
    func indexPathsForSelectedRowsInTable(table: TableSource) -> [NSIndexPath]?
    
    func selectRowAtIndexPath(indexPath: NSIndexPath?, inTable table: TableSource, animated: Bool, scrollPosition: UITableViewScrollPosition)
    func deselectRowAtIndexPath(indexPath: NSIndexPath, inTable table: TableSource, animated: Bool)
    
    var sectionIndexMinimumDisplayRowCount: Int { get set }
    var sectionIndexColor: UIColor? { get set }
    var sectionIndexBackgroundColor: UIColor? { get set }
    var sectionIndexTrackingBackgroundColor: UIColor? { get set }
    
    var separatorStyle: UITableViewCellSeparatorStyle { get set }
    var separatorColor: UIColor? { get set }
    
    var separatorEffect: UIVisualEffect? { get set }
    
    var tableHeaderView: UIView? { get set }
    var tableFooterView: UIView? { get set }
    
    func dequeueReusableCellWithIdentifier(identifier: String) -> UITableViewCell?
    func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath, inTable table: TableSource) -> UITableViewCell
    func dequeueReusableHeaderFooterViewWithIdentifier(identifier: String) -> UITableViewHeaderFooterView?
    
    func registerNib(nib: UINib?, forCellReuseIdentifier identifier: String)
    func registerClass(cellClass: AnyClass?, forCellReuseIdentifier identifier: String)
    func registerNib(nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String)
    func registerClass(aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)
    
}

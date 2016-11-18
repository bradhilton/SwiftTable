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
    
    func numberOfSectionsInTable(_ table: TableSource) -> Int
    func numberOfRowsInSection(_ section: Int, inTable table: TableSource) -> Int
    func rectForSection(_ section: Int, inTable table: TableSource) -> CGRect
    func rectForHeaderInSection(_ section: Int, inTable table: TableSource) -> CGRect
    func rectForFooterInSection(_ section: Int, inTable table: TableSource) -> CGRect
    func rectForRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource) -> CGRect
    func indexPathForRowAtPoint(_ point: CGPoint, inTable table: TableSource) -> IndexPath?
    func indexPathForCell(_ cell: UITableViewCell, inTable table: TableSource) -> IndexPath?
    func indexPathsForRowsInRect(_ rect: CGRect, inTable table: TableSource) -> [IndexPath]?
    func cellForRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource) -> UITableViewCell?
    var visibleCells: [UITableViewCell] { get }
    func indexPathsForVisibleRowsInTable(_ table: TableSource) -> [IndexPath]?
    func headerViewForSection(_ section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView?
    func footerViewForSection(_ section: Int, inTable table: TableSource) -> UITableViewHeaderFooterView?
    func scrollToRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool)
    func scrollToNearestSelectedRowAtScrollPosition(_ scrollPosition: UITableViewScrollPosition, animated: Bool)
    
    func beginUpdates()
    func endUpdates()
    func insertSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadSections(_ sections: IndexSet, inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func moveSection(_ section: Int, toSection newSection: Int, inTable table: TableSource)
    func insertRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadRowsAtIndexPaths(_ indexPaths: [IndexPath], inTable table: TableSource, withRowAnimation animation: UITableViewRowAnimation)
    func moveRowAtIndexPath(_ indexPath: IndexPath, toIndexPath newIndexPath: IndexPath, inTable table: TableSource)
    
    var editing: Bool { get set }
    func setEditing(_ editing: Bool, animated: Bool)
    var allowsSelection: Bool { get set }
    var allowsSelectionDuringEditing: Bool { get set }
    var allowsMultipleSelection: Bool { get set }
    var allowsMultipleSelectionDuringEditing: Bool { get set }
    
    func indexPathForSelectedRowInTable(_ table: TableSource) -> IndexPath?
    func indexPathsForSelectedRowsInTable(_ table: TableSource) -> [IndexPath]?
    
    func selectRowAtIndexPath(_ indexPath: IndexPath?, inTable table: TableSource, animated: Bool, scrollPosition: UITableViewScrollPosition)
    func deselectRowAtIndexPath(_ indexPath: IndexPath, inTable table: TableSource, animated: Bool)
    
    var sectionIndexMinimumDisplayRowCount: Int { get set }
    var sectionIndexColor: UIColor? { get set }
    var sectionIndexBackgroundColor: UIColor? { get set }
    var sectionIndexTrackingBackgroundColor: UIColor? { get set }
    
    var separatorStyle: UITableViewCellSeparatorStyle { get set }
    var separatorColor: UIColor? { get set }
    
    var separatorEffect: UIVisualEffect? { get set }
    
    var tableHeaderView: UIView? { get set }
    var tableFooterView: UIView? { get set }
    
    func dequeueReusableCellWithIdentifier(_ identifier: String) -> UITableViewCell?
    func dequeueReusableCellWithIdentifier(_ identifier: String, forIndexPath indexPath: IndexPath, inTable table: TableSource) -> UITableViewCell
    func dequeueReusableHeaderFooterViewWithIdentifier(_ identifier: String) -> UITableViewHeaderFooterView?
    
    func registerNib(_ nib: UINib?, forCellReuseIdentifier identifier: String)
    func registerClass(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)
    func registerNib(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String)
    func registerClass(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)
    
}

//
//  SectionSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol SectionSource : _Section {
    
    // Delegate
    
    func willDisplayCell(_ cell: UITableViewCell, forRow row: Int)
    func willDisplayHeaderView(_ view: UIView)
    func willDisplayFooterView(_ view: UIView)
    func didEndDisplayingCell(_ cell: UITableViewCell, forRow row: Int)
    func didEndDisplayingHeaderView(_ view: UIView)
    func didEndDisplayingFooterView(_ view: UIView)
    func heightForRow(_ row: Int) -> CGFloat
    var heightForHeader: CGFloat { get }
    var heightForFooter: CGFloat { get }
    func estimatedHeightForRow(_ row: Int) -> CGFloat
    var estimatedHeightForHeader: CGFloat { get }
    var estimatedHeightForFooter: CGFloat { get }
    var viewForHeader: UIView? { get }
    var viewForFooter: UIView? { get }
    func accessoryButtonTappedForRow(_ row: Int)
    func shouldHighlightRow(_ row: Int) -> Bool
    func didHighlightRow(_ row: Int)
    func didUnhighlightRow(_ row: Int)
    func willSelectRow(_ row: Int) -> Int?
    func willDeselectRow(_ row: Int) -> Int?
    func didSelectRow(_ row: Int)
    func didDeselectRow(_ row: Int)
    func editingStyleForRow(_ row: Int) -> UITableViewCell.EditingStyle
    func titleForDeleteConfirmationButtonForRow(_ row: Int) -> String?
    func editActionsForRow(_ row: Int) -> [UITableViewRowAction]?
    func shouldIndentWhileEditingRow(_ row: Int) -> Bool
    func willBeginEditingRow(_ row: Int)
    func didEndEditingRow(_ row: Int?)
    func targetRowForMoveFromRow(_ sourceRow: Int, toProposedRow proposedDestinationRow: Int) -> Int
    func indentationLevelForRow(_ row: Int) -> Int
    func shouldShowMenuForRow(_ row: Int) -> Bool
    
    // Data Source
    
    var numberOfRows: Int { get }
    func cellForRow(_ row: Int) -> UITableViewCell
    var titleForHeader: String? { get }
    var titleForFooter: String? { get }
    func canEditRow(_ row: Int) -> Bool
    func canMoveRow(_ row: Int) -> Bool
    var sectionIndexTitle: String? { get }
    func commitEditingStyle(_ editingStyle: UITableViewCell.EditingStyle, forRow row: Int)
    func moveRow(_ sourceRow: Int, toRow destinationRow: Int)
    
}

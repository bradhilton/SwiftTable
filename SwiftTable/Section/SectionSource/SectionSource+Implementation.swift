//
//  SectionSource+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

extension SectionSource {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRow row: Int) {}
    public func willDisplayHeaderView(view: UIView) {}
    public func willDisplayFooterView(view: UIView) {}
    public func didEndDisplayingCell(cell: UITableViewCell, forRow row: Int) {}
    public func didEndDisplayingHeaderView(view: UIView) {}
    public func didEndDisplayingFooterView(view: UIView) {}
    
    public func heightForRow(row: Int) -> CGFloat {
        return _table._parent.rowHeight
    }
    
    public var heightForHeader: CGFloat {
        return defaultHeightForHeader
    }
    
    public var heightForFooter: CGFloat {
        return defaultHeightForFooter
    }
    
    public func estimatedHeightForRow(row: Int) -> CGFloat {
        return _table._parent.estimatedRowHeight
    }
    
    public var estimatedHeightForHeader: CGFloat {
        return defaultHeightForHeader
    }
    
    public var estimatedHeightForFooter: CGFloat {
        return defaultHeightForFooter
    }
    
    var defaultHeightForHeader: CGFloat {
        return titleForHeader != nil ? sectionHeightForStyle(_table._parent.style, header: true) : 0
    }
    
    var defaultHeightForFooter: CGFloat {
        return titleForFooter != nil ? sectionHeightForStyle(_table._parent.style, header: false) : 0
    }
    
    public var viewForHeader: UIView? {
        get {
            return getAssociatedValueForProperty("viewForHeader", ofObject: self)
        }
        set {
            setAssociatedValue(newValue, forProperty: "viewForHeader", ofObject: self)
        }
    }
    
    public var viewForFooter: UIView? {
        get {
            return getAssociatedValueForProperty("viewForFooter", ofObject: self)
        }
        set {
            setAssociatedValue(newValue, forProperty: "viewForFooter", ofObject: self)
        }
    }
    
    public func accessoryButtonTappedForRow(row: Int) {}
    
    public func shouldHighlightRow(row: Int) -> Bool {
        return true
    }
    
    public func didHighlightRow(row: Int) {}
    public func didUnhighlightRow(row: Int) {}
    
    public func willSelectRow(row: Int) -> Int? {
        return row
    }
    
    public func willDeselectRow(row: Int) -> Int? {
        return row
    }
    
    public func didSelectRow(row: Int) {}
    public func didDeselectRow(row: Int) {}
    
    public func editingStyleForRow(row: Int) -> UITableViewCellEditingStyle {
        return .None
    }
    public func titleForDeleteConfirmationButtonForRow(row: Int) -> String? {
        return "Delete"
    }
    
    public func editActionsForRow(row: Int) -> [UITableViewRowAction]? {
        return nil
    }
    
    public func shouldIndentWhileEditingRow(row: Int) -> Bool {
        return true
    }
    
    public func willBeginEditingRow(row: Int) {}
    
    public func didEndEditingRow(row: Int) {}
    
    public func targetRowForMoveFromRow(sourceRow: Int, toProposedRow proposedDestinationRow: Int) -> Int {
        return proposedDestinationRow
    }
    
    public func indentationLevelForRow(row: Int) -> Int {
        return 0
    }
    
    public func shouldShowMenuForRow(row: Int) -> Bool {
        return false
    }
    
    public func canPerformAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    public func performAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) {}
    
    // Data Source
    
    public var numberOfRows: Int {
        return 0
    }
    
    public func cellForRow(row: Int) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public var titleForHeader: String? {
        get {
            return getAssociatedValueForProperty("titleForHeader", ofObject: self)
        }
        set {
            setAssociatedValue(newValue, forProperty: "titleForHeader", ofObject: self)
        }
    }
    
    public var titleForFooter: String? {
        get {
            return getAssociatedValueForProperty("titleForFooter", ofObject: self)
        }
        set {
            setAssociatedValue(newValue, forProperty: "titleForFooter", ofObject: self)
        }
    }
    
    public func canEditRow(row: Int) -> Bool {
        return false
    }
    
    public func canMoveRow(row: Int) -> Bool {
        return false
    }
    
    public var sectionIndexTitle: String? {
        get {
            return getAssociatedValueForProperty("sectionIndexTitle", ofObject: self)
        }
        set {
            setAssociatedValue(newValue, forProperty: "sectionIndexTitle", ofObject: self)
        }
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRow row: Int) {}
    public func moveRow(sourceRow: Int, toRow destinationRow: Int) {}
    
}

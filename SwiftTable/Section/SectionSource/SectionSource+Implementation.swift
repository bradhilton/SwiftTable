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
    
    public func willDisplayCell(_ cell: UITableViewCell, forRow row: Int) {}
    public func willDisplayHeaderView(_ view: UIView) {}
    public func willDisplayFooterView(_ view: UIView) {}
    public func didEndDisplayingCell(_ cell: UITableViewCell, forRow row: Int) {}
    public func didEndDisplayingHeaderView(_ view: UIView) {}
    public func didEndDisplayingFooterView(_ view: UIView) {}
    
    public func heightForRow(_ row: Int) -> CGFloat {
        return _table._parent.rowHeight
    }
    
    public var heightForHeader: CGFloat {
        return defaultHeightForHeader
    }
    
    public var heightForFooter: CGFloat {
        return defaultHeightForFooter
    }
    
    public func estimatedHeightForRow(_ row: Int) -> CGFloat {
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
            return getAssociatedValue(key: "viewForHeader", object: self)
        }
        set {
            set(associatedValue: newValue, key: "viewForHeader", object: self)
        }
    }
    
    public var viewForFooter: UIView? {
        get {
            return getAssociatedValue(key: "viewForFooter", object: self)
        }
        set {
            set(associatedValue: newValue, key: "viewForFooter", object: self)
        }
    }
    
    public func accessoryButtonTappedForRow(_ row: Int) {}
    
    public func shouldHighlightRow(_ row: Int) -> Bool {
        return true
    }
    
    public func didHighlightRow(_ row: Int) {}
    public func didUnhighlightRow(_ row: Int) {}
    
    public func willSelectRow(_ row: Int) -> Int? {
        return row
    }
    
    public func willDeselectRow(_ row: Int) -> Int? {
        return row
    }
    
    public func didSelectRow(_ row: Int) {}
    public func didDeselectRow(_ row: Int) {}
    
    public func editingStyleForRow(_ row: Int) -> UITableViewCellEditingStyle {
        return .none
    }
    public func titleForDeleteConfirmationButtonForRow(_ row: Int) -> String? {
        return "Delete"
    }
    
    public func editActionsForRow(_ row: Int) -> [UITableViewRowAction]? {
        return nil
    }
    
    public func shouldIndentWhileEditingRow(_ row: Int) -> Bool {
        return true
    }
    
    public func willBeginEditingRow(_ row: Int) {}
    
    public func didEndEditingRow(_ row: Int?) {}
    
    public func targetRowForMoveFromRow(_ sourceRow: Int, toProposedRow proposedDestinationRow: Int) -> Int {
        return proposedDestinationRow
    }
    
    public func indentationLevelForRow(_ row: Int) -> Int {
        return 0
    }
    
    public func shouldShowMenuForRow(_ row: Int) -> Bool {
        return false
    }
    
    public func canPerformAction(_ action: Selector, forRow row: Int, withSender sender: Any?) -> Bool {
        return false
    }
    
    public func performAction(_ action: Selector, forRow row: Int, withSender sender: Any?) {}
    
    // Data Source
    
    public var numberOfRows: Int {
        return 0
    }
    
    public func cellForRow(_ row: Int) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public var titleForHeader: String? {
        get {
            return getAssociatedValue(key: "titleForHeader", object: self)
        }
        set {
            set(associatedValue: newValue, key: "titleForHeader", object: self)
        }
    }
    
    public var titleForFooter: String? {
        get {
            return getAssociatedValue(key: "titleForFooter", object: self)
        }
        set {
            set(associatedValue: newValue, key: "titleForFooter", object: self)
        }
    }
    
    public func canEditRow(_ row: Int) -> Bool {
        return false
    }
    
    public func canMoveRow(_ row: Int) -> Bool {
        return false
    }
    
    public var sectionIndexTitle: String? {
        get {
            return getAssociatedValue(key: "sectionIndexTitle", object: self)
        }
        set {
            set(associatedValue: newValue, key: "sectionIndexTitle", object: self)
        }
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRow row: Int) {}
    public func moveRow(_ sourceRow: Int, toRow destinationRow: Int) {}
    
}

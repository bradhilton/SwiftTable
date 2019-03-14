//
//  SectionSource+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

private var headerViewKey = "headerView"
private var footerViewKey = "footerView"
private var headerTitleKey = "headerTitle"
private var footerTitleKey = "footerTitle"
private var indexTitleKey = "indexTitle"

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
            return objc_getAssociatedObject(self, &headerViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &headerViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var viewForFooter: UIView? {
        get {
            return objc_getAssociatedObject(self, &footerViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &footerViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
    
    public func editingStyleForRow(_ row: Int) -> UITableViewCell.EditingStyle {
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
    
    // Data Source
    
    public var numberOfRows: Int {
        return 0
    }
    
    public func cellForRow(_ row: Int) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public var titleForHeader: String? {
        get {
            return objc_getAssociatedObject(self, &headerTitleKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &headerTitleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var titleForFooter: String? {
        get {
            return objc_getAssociatedObject(self, &footerTitleKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &footerTitleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
            return objc_getAssociatedObject(self, &indexTitleKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &indexTitleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCell.EditingStyle, forRow row: Int) {}
    public func moveRow(_ sourceRow: Int, toRow destinationRow: Int) {}
    
}

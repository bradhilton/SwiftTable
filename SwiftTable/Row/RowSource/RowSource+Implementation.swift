//
//  RowSource+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension RowSource {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell) {}
    public func didEndDisplayingCell(cell: UITableViewCell) {}
    
    public var height: CGFloat {
        return _section._table._parent.rowHeight
    }
    
    public var estimatedHeight: CGFloat {
        return _section._table._parent.estimatedRowHeight ?? 0
    }

    public func accessoryButtonTapped() {}
    
    public var shouldHighlight: Bool {
        return true
    }
    
    public func didHighlight() {}
    public func didUnhighlight() {}
    
    public var willSelect: Bool {
        return true
    }
    
    public var willDeselect: Bool {
        return true
    }
    
    public func didSelect() {}
    public func didDeselect() {}
    
    public var editingStyle: UITableViewCellEditingStyle {
        return .None
    }
    
    public var titleForDeleteConfirmationButton: String? {
        return "Delete"
    }
    
    public var editActions: [UITableViewRowAction]? {
        return nil
    }
    
    public var shouldIndentWhileEditing: Bool {
        return true
    }
    
    public func willBeginEditing() {}
    public func didEndEditing() {}
    
    public var indentationLevel: Int {
        return 0
    }
    
    public var shouldShowMenu: Bool {
        return false
    }
    
    public func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    public func performAction(action: Selector, withSender sender: AnyObject?) {}

    // Data Source
    
    public var cell: UITableViewCell {
        return UITableViewCell()
    }
    
    public var canEdit: Bool {
        return false
    }
    
    public var canMove: Bool {
        return false
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle) {}
    
}
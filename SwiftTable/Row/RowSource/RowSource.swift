//
//  RowSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol RowSource : _Row {
    
    // Delegate
    
    func willDisplayCell(_ cell: UITableViewCell)
    func didEndDisplayingCell(_ cell: UITableViewCell)
    var height: CGFloat { get }
    var estimatedHeight: CGFloat { get }
    func accessoryButtonTapped()
    var shouldHighlight: Bool { get }
    func didHighlight()
    func didUnhighlight()
    var willSelect: Bool { get }
    var willDeselect: Bool { get }
    func didSelect()
    func didDeselect()
    var editingStyle: UITableViewCellEditingStyle { get }
    var titleForDeleteConfirmationButton: String? { get }
    var editActions: [UITableViewRowAction]? { get }
    var shouldIndentWhileEditing: Bool { get }
    func willBeginEditing()
    func didEndEditing()
    var indentationLevel: Int { get }
    var shouldShowMenu: Bool { get }
    
    // Data Source
    
    var cell: UITableViewCell { get }
    var canEdit: Bool { get }
    var canMove: Bool { get }
    func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle)
    
}



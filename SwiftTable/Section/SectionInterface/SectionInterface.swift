//
//  SectionInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol SectionInterface : _Section {
    
    func rectForRow(row: RowSource) -> CGRect
    func cellForRow(row: RowSource) -> UITableViewCell?
    func scrollToRow(row: RowSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool)
    
    func insertRow(row: RowSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteRow(row: RowSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadRow(row: RowSource, withRowAnimation animation: UITableViewRowAnimation)
    
    func selectRow(row: RowSource?, animated: Bool, scrollPosition: UITableViewScrollPosition)
    func deselectRow(row: RowSource, animated: Bool)
    
    func dequeueReusableCellWithIdentifier(identifier: String, forRow row: RowSource) -> UITableViewCell
    
}

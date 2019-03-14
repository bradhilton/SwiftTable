//
//  SectionInterface.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol SectionInterface : _Section {
    
    func rectForRow(_ row: RowSource) -> CGRect
    func cellForRow(_ row: RowSource) -> UITableViewCell?
    func scrollToRow(_ row: RowSource, atScrollPosition scrollPosition: UITableView.ScrollPosition, animated: Bool)
    
    func insertRow(_ row: RowSource, withRowAnimation animation: UITableView.RowAnimation)
    func deleteRow(_ row: RowSource, withRowAnimation animation: UITableView.RowAnimation)
    func reloadRow(_ row: RowSource, withRowAnimation animation: UITableView.RowAnimation)
    
    func selectRow(_ row: RowSource?, animated: Bool, scrollPosition: UITableView.ScrollPosition)
    func deselectRow(_ row: RowSource, animated: Bool)
    
    func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: RowSource) -> UITableViewCell
    
}

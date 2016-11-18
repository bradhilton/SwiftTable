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
    func scrollToRow(_ row: RowSource, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool)
    
    func insertRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation)
    func deleteRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation)
    func reloadRow(_ row: RowSource, withRowAnimation animation: UITableViewRowAnimation)
    
    func selectRow(_ row: RowSource?, animated: Bool, scrollPosition: UITableViewScrollPosition)
    func deselectRow(_ row: RowSource, animated: Bool)
    
    func dequeueReusableCellWithIdentifier(_ identifier: String, forRow row: RowSource) -> UITableViewCell
    
}

//
//  Bridge+DataSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension Bridge : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return table?.cellForRowAtIndexPath(indexPath) ?? UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return table?.numberOfSections ?? 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return table?.titleForHeaderInSection(section)
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return table?.titleForFooterInSection(section)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return table?.canEditRowAtIndexPath(indexPath) ?? false
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return table?.canMoveRowAtIndexPath(indexPath) ?? false
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return table?.sectionIndexTitles
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return table?.sectionForSectionIndexTitle(title, atIndex: index) ?? 0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        table?.commitEditingStyle(editingStyle, forRowAtIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        table?.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
    }
    
}
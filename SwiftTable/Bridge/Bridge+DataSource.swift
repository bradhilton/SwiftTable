//
//  Bridge+DataSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension Bridge : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return table?.cellForRowAtIndexPath(indexPath) ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return table?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return table?.titleForHeaderInSection(section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return table?.titleForFooterInSection(section)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return table?.canEditRowAtIndexPath(indexPath) ?? false
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return table?.canMoveRowAtIndexPath(indexPath) ?? false
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return table?.sectionIndexTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return table?.sectionForSectionIndexTitle(title, atIndex: index) ?? 0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        table?.commitEditingStyle(editingStyle, forRowAtIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        table?.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
    }
    
}

//
//  Bridge.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

class Bridge : NSObject {
    
    weak var tableView: UITableView?
    weak var table: TableSource?
    weak var parent: ParentInterface?
    
    init?(tableView: UITableView, table: TableSource?) {
        super.init()
        guard table != nil else { return nil }
        self.tableView = tableView
        self.table = table
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.table?.parent = self
    }
    
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
    }
    
    var _tableView: UITableView {
        return tableView ?? UITableView()
    }
    
    class EmptyTable : TableSource {
         weak var parent: ParentInterface?
    }

    var _table: TableSource {
        return table ?? EmptyTable()
    }
    
}



//
//  SwiftTableTests.swift
//  SwiftTableTests
//
//  Created by Bradley Hilton on 2/18/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import XCTest
import OrderedObjectSet
@testable import SwiftTable

class NamesSection : SectionSource, TableSource, TableInterface {
    
    var names: [String]
    
    init(names: [String]) {
        self.names = names
    }
    
    var numberOfRows: Int {
        return names.count
    }
    
}

class MultipleTables : MultiTable {
    
    var tables: OrderedObjectSet<TableSource>
    
    init(tables: OrderedObjectSet<TableSource>) {
        self.tables = tables
    }
    
}

class SwiftTableTests: XCTestCase {
    
    let tableView = UITableView()
    
    func testSection() {
        let multipleTables = MultipleTables(tables: OrderedObjectSet((0..<4).map { _ in NamesSection(names: ["Brad", "Johnny"]) }))
        XCTAssert(multipleTables.numberOfSections == 4)
        XCTAssert(multipleTables.tableForSection(1)?.numberOfSections == 1)
        XCTAssert(multipleTables.tableForSection(1)?.numberOfRowsInSection(0) == 2)
    }
    
}

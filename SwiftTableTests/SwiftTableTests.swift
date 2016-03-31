//
//  SwiftTableTests.swift
//  SwiftTableTests
//
//  Created by Bradley Hilton on 2/18/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import XCTest
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
    
    var tables: OrderedSet<TableSource>
    
    init(tables: OrderedSet<TableSource>) {
        self.tables = tables
    }
    
}

class SwiftTableTests: XCTestCase {
    
    let tableView = UITableView()
    
    func testSection() {
        let multipleTables = MultipleTables(tables: OrderedSet((0..<4).map { _ in NamesSection(names: ["Brad", "Johnny"]) }))
        XCTAssert(multipleTables.numberOfSections == 4)
        XCTAssert(multipleTables.tableForSection(1)?.numberOfSections == 1)
        XCTAssert(multipleTables.tableForSection(1)?.numberOfRowsInSection(0) == 2)
    }
    
    func testOrderedSet() {
        let brad: NSString = "Brad"
        let lorraine: NSString = "Lorraine"
        let evan: NSString = "Evan"
        let scott: NSString = "Scott"
        let sarah: NSString = "Sarah"
        let ivonne: NSString = "Ivonne"
        let natalie: NSString = "Natalie"
        var orderedSet: OrderedSet<NSString> = [brad, lorraine, brad, sarah]
        XCTAssert(orderedSet == [brad, lorraine, sarah])
        orderedSet.append(evan)
        XCTAssert(orderedSet == [brad, lorraine, sarah, evan])
        orderedSet.insert(evan, atIndex: 0)
        XCTAssert(orderedSet == [evan, brad, lorraine, sarah])
        orderedSet[2] = brad
        XCTAssert(orderedSet == [evan, brad, sarah])
        orderedSet.unionInPlace([brad, scott, ivonne])
        XCTAssert(orderedSet == [evan, sarah, brad, scott, ivonne])
        orderedSet.subtractInPlace([brad, evan])
        XCTAssert(orderedSet == [sarah, scott, ivonne])
        orderedSet.intersectInPlace([sarah, brad, ivonne])
        XCTAssert(orderedSet == [sarah, ivonne])
        orderedSet.appendContentsOf([natalie, lorraine])
        orderedSet.exclusiveOrInPlace([ivonne, brad, natalie])
        XCTAssert(orderedSet == [sarah, lorraine, brad])
        orderedSet = orderedSet + [lorraine, natalie]
        XCTAssert(orderedSet == [sarah, brad, lorraine, natalie])
        orderedSet += [sarah, sarah, scott, scott]
        XCTAssert(orderedSet == [brad, lorraine, natalie, sarah, scott])
    }
    
}

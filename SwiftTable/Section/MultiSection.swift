//
//  MultiSection.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 9/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

public protocol MultiSection : SectionSource, TableInterface {
    var sections: OrderedObjectSet<SectionSource> { get set }
}

extension MultiSection {
    
    public var sections: OrderedObjectSet<SectionSource> {
        get {
            return getAssociatedValue(key: "sections", object: self, initialValue: OrderedObjectSet())
        }
        set {
            sections.subtracting(newValue).forEach { $0.table = nil }
            newValue.subtracting(sections).forEach { $0.table = self }
            set(associatedValue: newValue, key: "sections", object: self)
        }
    }
    
    func sectionForRow(_ row: Int) -> SectionSource? {
        var lastRow = 0
        for section in sections {
            lastRow += section.numberOfRows
            if row < lastRow {
                return section
            }
        }
        return nil
    }
    
    fileprivate func rowOffsetForSection(_ section: SectionSource) -> Int {
        var rowOffset = 0
        for element in sections {
            if section === element {
                return rowOffset
            }
            rowOffset += element.numberOfRows
        }
        return 0
    }
    
    func rowsFromSection(_ section: SectionSource, rows: [Int]? = nil) -> [Int] {
        let rows = rows ?? (0..<section.numberOfRows).map { $0 }
        let rowOffset = rowOffsetForSection(section)
        return rows.map { $0 + rowOffset }
    }
    
    func rowForSection(_ section: SectionSource, row: Int) -> Int {
        return row - rowOffsetForSection(section)
    }
    
    func rowFromSection(_ section: SectionSource, row: Int) -> Int {
        return row + rowOffsetForSection(section)
    }
    
    func delegate<T>(_ row: Int, handler: (SectionSource, Int) -> T?) -> T? {
        guard let section = sectionForRow(row) else { return nil }
        return handler(section, rowForSection(section, row: row))
    }
    
}

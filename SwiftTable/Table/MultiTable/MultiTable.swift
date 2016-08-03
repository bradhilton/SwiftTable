//
//  MultiTable.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

public protocol MultiTable : TableSource, ParentInterface {
    var tables: OrderedObjectSet<TableSource> { get set }
}

extension MultiTable {
    
    public var tables: OrderedObjectSet<TableSource> {
        get {
            return getAssociatedValueForProperty("tables", ofObject: self, withInitialValue: OrderedObjectSet())
        }
        set {
            tables.subtract(newValue).forEach { $0.parent = nil }
            newValue.subtract(tables).forEach { $0.parent = self }
            setAssociatedValue(newValue, forProperty: "tables", ofObject: self)
        }
    }
    
    func tableForSection(section: Int) -> TableSource? {
        var lastSection = 0
        for table in tables {
            lastSection += table.numberOfSections
            if section < lastSection {
                return table
            }
        }
        return nil
    }
    
    func tableForSectionTitleAtIndex(index: Int) -> TableSource? {
        return tableForIndex(index) { $0 + ($1.sectionIndexTitles?.count ?? 0) }
    }
    
    func tableForIndex(index: Int, combine: (Int, TableSource) -> Int) -> TableSource? {
        for i in tables.indices {
            if index < tables[0...i].reduce(0, combine: combine) {
                return self.tables[i]
            }
        }
        return nil
    }
    
    func sectionOffsetForTable(table: TableSource) -> Int {
        var sectionOffset = 0
        for element in tables {
            if table === element {
                return sectionOffset
            }
            sectionOffset += element.numberOfSections
        }
        return 0
    }
    
    func indexSetFromTable(table: TableSource, indexSet: NSIndexSet) -> NSIndexSet {
        let sectionOffset = sectionOffsetForTable(table)
        return indexSet.reduce(NSMutableIndexSet()) { $0.addIndex($1 + sectionOffset); return $0 }
    }
    
    func indexPathsForTable(table: TableSource, indexPaths: [NSIndexPath]?) -> [NSIndexPath]? {
        guard let indexPaths = indexPaths else { return nil }
        let sectionOffset = sectionOffsetForTable(table)
        return indexPaths.filter {
            (sectionOffset..<(sectionOffset + table.numberOfSections)).contains($0.section)
        }.map {
            NSIndexPath(forRow: $0.row, inSection: $0.section - sectionOffset)
        }
    }
    
    func indexPathsFromTable(table: TableSource, indexPaths: [NSIndexPath]) -> [NSIndexPath] {
        let sectionOffset = sectionOffsetForTable(table)
        return indexPaths.map { NSIndexPath(forRow: $0.row, inSection: $0.section + sectionOffset) }
    }
    
    func optionalIndexPathForTable(table: TableSource, indexPath: NSIndexPath?) -> NSIndexPath? {
        guard let indexPath = indexPath where tableForSection(indexPath.section) === table else { return nil }
        return indexPathForTable(table, indexPath: indexPath)
    }
    
    func indexPathForTable(table: TableSource, indexPath: NSIndexPath) -> NSIndexPath {
        return NSIndexPath(forRow: indexPath.row, inSection: sectionForTable(table, section: indexPath.section))
    }
    
    func indexPathFromTable(table: TableSource, indexPath: NSIndexPath) -> NSIndexPath {
        return NSIndexPath(forRow: indexPath.row, inSection: sectionFromTable(table, section: indexPath.section))
    }
    
    func sectionForTable(table: TableSource, section: Int) -> Int {
        return section - sectionOffsetForTable(table)
    }
    
    func sectionFromTable(table: TableSource, section: Int) -> Int {
        return section + sectionOffsetForTable(table)
    }
    
    func delegate<T>(indexPath: NSIndexPath, handler: (TableSource, NSIndexPath) -> T?) -> T? {
        guard let table = tableForSection(indexPath.section) else { return nil }
        return handler(table, indexPathForTable(table, indexPath: indexPath))
    }
    
    func delegate<T>(section: Int, handler: (TableSource, Int) -> T?) -> T? {
        guard let table = tableForSection(section) else { return nil }
        return handler(table, sectionForTable(table, section: section))
    }
    
    func respond<T>(table: TableSource, indexPath: NSIndexPath, handler: (NSIndexPath) -> T?) -> T? {
        return handler(indexPathFromTable(table, indexPath: indexPath))
    }
    
    func respond<T>(table: TableSource, section: Int, handler: (Int) -> T?) -> T? {
        return handler(sectionFromTable(table, section: section))
    }

}


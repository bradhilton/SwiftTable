//
//  MultiTable.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import OrderedObjectSet

private var tablesKey = "tables"

public protocol MultiTable : TableSource, ParentInterface {
    var tables: OrderedObjectSet<TableSource> { get set }
}

extension MultiTable {
    
    public var tables: OrderedObjectSet<TableSource> {
        get {
            guard let tables = objc_getAssociatedObject(self, &tablesKey) as? OrderedObjectSet<TableSource> else {
                return []
            }
            return tables
        }
        set {
            tables.subtracting(newValue).forEach { $0.parent = nil }
            newValue.subtracting(tables).forEach { $0.parent = self }
            objc_setAssociatedObject(self, &tablesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func tableForSection(_ section: Int) -> TableSource? {
        var lastSection = 0
        for table in tables {
            lastSection += table.numberOfSections
            if section < lastSection {
                return table
            }
        }
        return nil
    }
    
    func tableForSectionTitleAtIndex(_ index: Int) -> TableSource? {
        return tableForIndex(index) { $0 + ($1.sectionIndexTitles?.count ?? 0) }
    }
    
    func tableForIndex(_ index: Int, combine: (Int, TableSource) -> Int) -> TableSource? {
        for i in tables.indices {
            if index < tables[0...i].reduce(0, combine) {
                return self.tables[i]
            }
        }
        return nil
    }
    
    func sectionOffsetForTable(_ table: TableSource) -> Int {
        var sectionOffset = 0
        for element in tables {
            if table === element {
                return sectionOffset
            }
            sectionOffset += element.numberOfSections
        }
        return 0
    }
    
    func indexSetFromTable(_ table: TableSource, indexSet: IndexSet) -> IndexSet {
        let sectionOffset = sectionOffsetForTable(table)
        return indexSet.reduce(IndexSet()) {
            var set = $0
            set.insert($1 + sectionOffset);
            return set
        }
    }
    
    func indexPathsForTable(_ table: TableSource, indexPaths: [IndexPath]?) -> [IndexPath]? {
        guard let indexPaths = indexPaths else { return nil }
        let sectionOffset = sectionOffsetForTable(table)
        return indexPaths.filter {
            (sectionOffset..<(sectionOffset + table.numberOfSections)).contains($0.section)
        }.map {
            IndexPath(row: $0.row, section: $0.section - sectionOffset)
        }
    }
    
    func indexPathsFromTable(_ table: TableSource, indexPaths: [IndexPath]) -> [IndexPath] {
        let sectionOffset = sectionOffsetForTable(table)
        return indexPaths.map { IndexPath(row: $0.row, section: $0.section + sectionOffset) }
    }
    
    func optionalIndexPathForTable(_ table: TableSource, indexPath: IndexPath?) -> IndexPath? {
        guard let indexPath = indexPath, tableForSection(indexPath.section) === table else { return nil }
        return indexPathForTable(table, indexPath: indexPath)
    }
    
    func indexPathForTable(_ table: TableSource, indexPath: IndexPath) -> IndexPath {
        return IndexPath(row: indexPath.row, section: sectionForTable(table, section: indexPath.section))
    }
    
    func indexPathFromTable(_ table: TableSource, indexPath: IndexPath) -> IndexPath {
        return IndexPath(row: indexPath.row, section: sectionFromTable(table, section: indexPath.section))
    }
    
    func sectionForTable(_ table: TableSource, section: Int) -> Int {
        return section - sectionOffsetForTable(table)
    }
    
    func sectionFromTable(_ table: TableSource, section: Int) -> Int {
        return section + sectionOffsetForTable(table)
    }
    
    func delegate<T>(_ indexPath: IndexPath, handler: (TableSource, IndexPath) -> T?) -> T? {
        guard let table = tableForSection(indexPath.section) else { return nil }
        return handler(table, indexPathForTable(table, indexPath: indexPath))
    }
    
    func delegate<T>(_ section: Int, handler: (TableSource, Int) -> T?) -> T? {
        guard let table = tableForSection(section) else { return nil }
        return handler(table, sectionForTable(table, section: section))
    }
    
    func respond<T>(_ table: TableSource, indexPath: IndexPath, handler: (IndexPath) -> T?) -> T? {
        return handler(indexPathFromTable(table, indexPath: indexPath))
    }
    
    func respond<T>(_ table: TableSource, section: Int, handler: (Int) -> T?) -> T? {
        return handler(sectionFromTable(table, section: section))
    }

}


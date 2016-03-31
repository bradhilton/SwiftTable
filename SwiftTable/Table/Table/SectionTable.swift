//
//  SectionTable.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

public protocol SectionTable : TableSource, TableInterface {
    var sections: OrderedSet<SectionSource> { get set }
}

extension SectionTable {
    
    public var sections: OrderedSet<SectionSource> {
        get {
            return getAssociatedValueForProperty("sections", ofObject: self, withInitialValue: OrderedSet())
        }
        set {
            sections.subtract(newValue).forEach { $0.table = nil }
            newValue.subtract(sections).forEach { $0.table = self }
            setAssociatedValue(newValue, forProperty: "sections", ofObject: self)
        }
    }
    
    func index(section: SectionSource) -> Int? {
        return sections.indexOf { $0 === section }
    }
    
    func delegate<T>(section: SectionSource, handler: (Int) -> T?) -> T? {
        guard let index = sections.indexOf({ $0 === section }) else { return nil }
        return handler(index)
    }
    
    func rowForSection(section: SectionSource, fromIndexPath indexPath: NSIndexPath?) -> Int? {
        guard let indexPath = indexPath where indexPath.section == index(section) else { return nil }
        return indexPath.row
    }
    
    func rowsForSection(section: SectionSource, fromIndexPaths indexPaths: [NSIndexPath]?) -> [Int]? {
        guard let indexPaths = indexPaths, index = index(section) else { return nil }
        let rows = indexPaths.filter { $0.section == index }.map { $0.row }
        return rows.count > 0 ? rows : nil
    }
    
    func indexPathsFromSection(section: SectionSource, withRows rows: [Int]) -> [NSIndexPath] {
        guard let index = index(section) else { return [] }
        return rows.map { NSIndexPath(forRow: $0, inSection: index) }
    }
    
    func indexPathsFromRows(rows: [Int], inSection section: SectionSource) -> [NSIndexPath] {
        guard let index = index(section) else { return [] }
        return rows.map { NSIndexPath(forRow: $0, inSection: index) }
    }
    
}

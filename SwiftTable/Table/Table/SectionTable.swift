//
//  SectionTable.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues
import OrderedObjectSet

public protocol SectionTable : TableSource, TableInterface {
    var sections: OrderedObjectSet<SectionSource> { get set }
}

extension SectionTable {
    
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
    
    func index(_ section: SectionSource) -> Int? {
        return sections.index { $0 === section }
    }
    
    func delegate<T>(_ section: SectionSource, handler: (Int) -> T?) -> T? {
        guard let index = sections.index(where: { $0 === section }) else { return nil }
        return handler(index)
    }
    
    func rowForSection(_ section: SectionSource, fromIndexPath indexPath: IndexPath?) -> Int? {
        guard let indexPath = indexPath, indexPath.section == index(section) else { return nil }
        return indexPath.row
    }
    
    func rowsForSection(_ section: SectionSource, fromIndexPaths indexPaths: [IndexPath]?) -> [Int]? {
        guard let indexPaths = indexPaths, let index = index(section) else { return nil }
        let rows = indexPaths.filter { $0.section == index }.map { $0.row }
        return rows.count > 0 ? rows : nil
    }
    
    func indexPathsFromSection(_ section: SectionSource, withRows rows: [Int]) -> [IndexPath] {
        guard let index = index(section) else { return [] }
        return rows.map { IndexPath(row: $0, section: index) }
    }
    
    func indexPathsFromRows(_ rows: [Int], inSection section: SectionSource) -> [IndexPath] {
        guard let index = index(section) else { return [] }
        return rows.map { IndexPath(row: $0, section: index) }
    }
    
}

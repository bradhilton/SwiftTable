//
//  NSIndexPath+Additions.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import Foundation

extension IndexPath {
    
    init?(row: Int?, section: Int) {
        guard let row = row else { return nil }
        self.init(row: row, section: section)
    }
    
}

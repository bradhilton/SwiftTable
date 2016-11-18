//
//  ObjectObjectWrapper.swift
//  OrderedObjectSet
//
//  Created by Bradley Hilton on 2/22/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

struct ObjectWrapper : Hashable {
    
    let object: AnyObject
    
    var hashValue: Int {
        return Unmanaged.passUnretained(object).toOpaque().hashValue
    }
    
    init(_ object: AnyObject) {
        self.object = object
    }
    
}

func ==(lhs: ObjectWrapper, rhs: ObjectWrapper) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

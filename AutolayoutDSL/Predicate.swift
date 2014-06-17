//
//  Predicate.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Predicate {
    var relation: NSLayoutRelation = NSLayoutRelation.Equal
    var multiplier: Float = 1
    var constant: Float = 0
    var priority: UILayoutPriority? = nil
}

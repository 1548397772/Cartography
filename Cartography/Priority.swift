//
//  Priority.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

infix operator  ~ { }

/// Sets the priority for a constraint.
///
/// :param: lhs The constraint to update.
/// :param: rhs The new priority.
///
/// :returns: The same constraint with its priority updated.
///
public func ~ (lhs: NSLayoutConstraint, rhs: Float) -> NSLayoutConstraint {
    lhs.priority = rhs

    return lhs
}

/// Sets the priority for multiple constraints.
///
/// :param: lhs An array of `NSLayoutConstraint` instances.
/// :param: rhs The new priority/
///
/// :returns: The same constraints with their priorities updated.
///
public func ~ (lhs: [NSLayoutConstraint], rhs: Float) -> [NSLayoutConstraint] {
    return lhs.map {
        $0 ~ rhs
    }
}

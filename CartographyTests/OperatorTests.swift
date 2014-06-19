//
//  OperatorTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class OperatorTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 200, 200))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testAddition() {
        var constraint: NSLayoutConstraint!

        layout(view, superview) { view, superview in
            constraint = view.width == superview.width + 100
        }

        XCTAssertEqual(constraint.constant, 100, "It should set the constant")
    }

    func testSubtraction() {
        var constraint: NSLayoutConstraint!

        layout(view, superview) { view, superview in
            constraint = view.width == superview.width - 100
        }

        XCTAssertEqual(constraint.constant, -100, "It should set the constant")
    }

    func testMultiplication() {
        var constraint: NSLayoutConstraint!

        layout(view, superview) { view, superview in
            constraint = view.width == (superview.width + 100) * 2 + 5
        }

        XCTAssertEqual(constraint.multiplier, 2, "It should set the constant")
        XCTAssertEqual(constraint.constant, 205, "It should multiply the constant")
    }

    func testDivision() {
        var constraint: NSLayoutConstraint!

        layout(view, superview) { view, superview in
            constraint = view.width == (superview.width + 100) / 2 + 5
        }

        XCTAssertEqual(constraint.multiplier, 0.5, "It should set the constant")
        XCTAssertEqual(constraint.constant, 55, "It should divide the constant")
    }

    func testDivision2() {
        var constraint: NSLayoutConstraint!

        layout(view, superview) { view, superview in
            constraint = view.width == superview.width / 2
        }

        XCTAssertEqual(constraint.multiplier, 0.5, "It should set the constant")
    }

    func testPriority() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = (view.width == 200 ~ 100)
        }

        XCTAssertEqual(constraint.priority, 100, "It should set the priority")
    }

    func testPriorities() {
        var constraints: NSLayoutConstraint[]!

        layout(view, superview) { view, superview in
            constraints = (view.size <= superview.size ~ 100)
        }

        XCTAssertEqual(constraints[0].priority, 100, "It should set the priority")
        XCTAssertEqual(constraints[1].priority, 100, "It should set the priority")
    }
}

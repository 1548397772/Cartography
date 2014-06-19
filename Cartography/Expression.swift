//
//  Expression.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Expression<T> {
    let value: T
    var coefficients: Coefficients[]

    init(_ value: T, _ coefficients: Coefficients[]) {
        assert(coefficients.count > 0)

        self.value = value
        self.coefficients = coefficients
    }
}

// Addition

@infix func +<P: Property>(c: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

@infix func +<P: Property>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs + lhs
}

@infix func +<P: Property>(c: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

@infix func +<P: Property>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs + lhs
}

// Subtraction

@infix func -<P: Property>(c: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

@infix func -<P: Property>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs - lhs
}

@infix func -<P: Property>(c: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

@infix func -<P: Property>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs - lhs
}

// Multiplication

@infix func *<P: Property>(m: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

@infix func *<P: Property>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs * lhs
}

@infix func *<P: Property>(m: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

@infix func *<P: Property>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs * lhs
}

// Division

@infix func /<P: Property>(m: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

@infix func /<P: Property>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs / lhs
}

@infix func /<P: Property>(m: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

@infix func /<P: Property>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs / lhs
}

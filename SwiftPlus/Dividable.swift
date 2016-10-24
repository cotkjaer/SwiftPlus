//
//  Dividable.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Dividable
{
    static func / (lhs: Self, rhs: Self) -> Self
    static func /= (lhs: inout Self, rhs: Self)
}

// MARK: - Int Interoperability

public func / <F:Dividable>(lhs: F, rhs: Int) -> F where F:IntegerConvertible
{
    return lhs / F(rhs)
}

public func / <F:Dividable>(lhs: Int, rhs: F) -> F where F:IntegerConvertible
{
    return F(lhs) / rhs
}

public func /= <F:Dividable>(lhs: inout F, rhs: Int) where F:IntegerConvertible
{
    return lhs /= F(rhs)
}

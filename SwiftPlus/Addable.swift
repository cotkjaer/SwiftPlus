//
//  Addable.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Addable : Zeroable
{
    static func + (lhs: Self, rhs: Self) -> Self
    
    static func += (lhs: inout Self, rhs: Self)
    
    static prefix func + (_: Self) -> Self
}

// MARK: - Optional

public func + <A: Addable>(lhs : A, rhs: A?) -> A
{
    guard let rhs = rhs else { return lhs }
    
    return lhs + rhs
}

public func + <A: Addable>(lhs : A?, rhs: A) -> A
{
    guard let lhs = lhs else { return rhs }
    
    return lhs + rhs
}

func += <A: Addable>(lhs : inout A, rhs: A?)
{
    guard let rhs = rhs else { return }
    
    lhs += rhs
}

// MARK: - Int Interoperability

public func + <F: Addable>(lhs: F, rhs: Int) -> F where F: IntegerConvertible
{
    return lhs + F(rhs)
}

public func + <F: Addable>(lhs: Int, rhs: F) -> F where F: IntegerConvertible
{
    return F(lhs) + rhs
}

public func += <F: Addable>(lhs: inout F, rhs: Int) where F: IntegerConvertible
{
    return lhs += F(rhs)
}


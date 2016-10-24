//
//  Subtractable.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Subtractable
{
    static func - (lhs: Self, rhs: Self) -> Self
    
    static func -= (lhs: inout Self, rhs: Self)
    
    static prefix func - (_: Self) -> Self
}

// MARK: - Optional

public func - <S: Subtractable>(lhs : S, rhs: S?) -> S
{
    guard let rhs = rhs else { return lhs }
    
    return lhs - rhs
}

public func - <S: Subtractable>(lhs : S?, rhs: S) -> S
{
    guard let lhs = lhs else { return -rhs }
    
    return lhs - rhs
}

func -= <S: Subtractable>(lhs : inout S, rhs: S?)
{
    guard let rhs = rhs else { return }
    
    lhs -= rhs
}

// MARK: - Int Interoperability

public func - <F:Subtractable>(lhs: F, rhs: Int) -> F where F:IntegerConvertible
{
    return lhs - F(rhs)
}

public func - <F:Subtractable>(lhs: Int, rhs: F) -> F where F:IntegerConvertible
{
    return F(lhs) - rhs
}

public func -= <F:Subtractable>(lhs: inout F, rhs: Int) where F:IntegerConvertible
{
    return lhs -= F(rhs)
}

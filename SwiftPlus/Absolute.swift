//
//  Absolute.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

// MARK: - Absolute

public extension AbsoluteValuable
{
    var absolute: Self { return abs(self) }
}

// MARK: - Int

extension Int : AbsoluteValuable
{
    
    public static func abs(_ x: Int) -> Int
    {
        return Swift.abs(x)
    }
}

// MARK: - Int

extension UInt : AbsoluteValuable
{
    
    public static func abs(_ x: UInt) -> UInt
    {
        return x
    }
}


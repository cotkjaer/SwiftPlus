//
//  Int.swift
//  Random
//
//  Created by Christian Otkjær on 14/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

extension Int : Randomable
{
    public init(randomBetween lower: Int = min, and upper: Int = max)
    {
        self = Int.random(between: lower, and: upper)
    }
    
    public init(randomBelow: Int)
    {
        self = Int.random(between: 0, and: randomBelow)
    }

    /**
     Random integer in the open range [_lower_;_upper_[, ie. an integer between lower (_inclusive_) and upper (_exclusive_)
     
     - note: _lower_ **must** be less than _upper_
     
     - parameter between lower: lower limit - inclusive
     - parameter and upper: upper limit - exclusive
     - returns: Random integer in the open range [_lower_;_upper_[
     */
    public static func random(between lower: Int = min, and upper: Int = max) -> Int
    {
        let realLower = Swift.min(lower, upper)
        let realUpper = Swift.max(lower, upper)
        
        return Int(Int64(randomBetween: Int64(realLower), and: Int64(realUpper)))
    }
}

extension UInt64 : Randomable
{
    public init(randomBetween lower: UInt64 = min, and upper: UInt64 = max)
    {
        self = UInt64.random(between: lower, and: upper)
    }
    
    public init(randomBelow: UInt64)
    {
        self = UInt64.random(between: 0, and: randomBelow)
    }
    
    public static func random(between lower: UInt64 = min, and upper: UInt64 = max) -> UInt64
    {
        var m: UInt64
        let u = upper - lower
        var r = arc4random(UInt64.self)
        
        if u > UInt64(Int64.max)
        {
            m = 1 + ~u
        }
        else
        {
            m = ((max - (u * 2)) + 1) % u
        }
        
        while r < m
        {
            r = arc4random(UInt64.self)
        }
        
        return (r % u) + lower
    }
}

extension Int64 : Randomable
{
    public init(randomBetween lower: Int64 = min, and upper: Int64 = max)
    {
        self = Int64.random(between: lower, and: upper)
    }
    
    /// Returns a random Int < `randomBelow`. If `randomBelow` is negative the result will be >= `randomBelow` and < 0.
    public init(randomBelow: Int64)
    {
        self = Int64.random(between: 0, and: randomBelow)
    }

    public static func random(between lower: Int64 = min, and upper: Int64 = max) -> Int64
    {
        let (s, overflow) = Int64.subtractWithOverflow(upper, lower)
        let u = overflow ? UInt64.max - UInt64(~s) : UInt64(s)
        let r = UInt64(randomBelow: u) //.random(between: 0, and: u)
        
        if r > UInt64(Int64.max)
        {
            return Int64(r - (UInt64(~lower) + 1))
        }
        else
        {
            return Int64(r) + lower
        }
    }
}

extension UInt32 : Randomable
{
    public init(randomBetween lower: UInt32 = min, and upper: UInt32 = max)
    {
        self = UInt32.random(between: lower, and: upper)
    }
    
    public init(randomBelow: UInt32)
    {
        self = UInt32.random(between: 0, and: randomBelow)
    }

    public static func random(between lower: UInt32 = min, and upper: UInt32 = max) -> UInt32
    {
        return arc4random_uniform(upper - lower) + lower
    }
}

extension Int32 : Randomable
{
    public init(randomBetween lower: Int32 = min, and upper: Int32 = max)
    {
        self = Int32.random(between: lower, and: upper)
    }
    
    public init(randomBelow: Int32)
    {
        self = Int32.random(between: 0, and: randomBelow)
    }

    public static func random(between lower: Int32 = min, and upper: Int32 = max) -> Int32
    {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}

extension UInt : Randomable
{
    public init(randomBetween lower: UInt = min, and upper: UInt = max)
    {
        self = UInt.random(between: lower, and: upper)
    }
    
    public init(randomBelow: UInt)
    {
        self = UInt.random(between: 0, and: randomBelow)
    }

    public static func random(between lower: UInt = min, and upper: UInt = max) -> UInt
    {
        return UInt(UInt64(randomBetween: UInt64(lower), and: UInt64(upper)))
    }
}

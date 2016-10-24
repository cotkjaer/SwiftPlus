//
//  Double.swift
//  Random
//
//  Created by Christian Otkjær on 14/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

extension Double : Randomable
{
    public init(randomBetween lower: Double, and upper: Double)
    {
        self = Double.random(between: lower, and: upper)
    }
    
    public init(randomBelow: Double)
    {
        self = Double.random(between: 0, and: randomBelow)
    }

    /**
     Create a random Double in the given interval
     - parameter lower: lower bounds, default: 0
     - parameter upper: upper bounds, default: 1
     - returns: A random Double in `[min(lower,upper); max(lower,upper)]`
     - note: the order of lower and upper is irrelevant
     */
    public static func random(between lower: Double = 0, and upper: Double = 1) -> Double
    {
        //Construct random between 0 and 1
        let r = Double(arc4random(UInt64.self)) / Double(UInt64.max)
        
        //Use LERP to find result (renders the order of lower and upper irrelevant)
        return r * lower + (1 - r) * upper
    }
}

//
//  Rounding.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

// MARK: - Rounding

public protocol Roundable
{
    /// `self` rounded to an arbitrary number
    func rounded(toNearest number: Self) -> Self
    
    mutating func round(toNearest number: Self)
    
    /// Largest integral value not greater than `self`
    var floor : Self { get }
    
    /// Smallest integral value not less than `self`
    var ceil : Self { get }
    
    /// Nearest integral value, eaqual to, less than, or greater than `self`
    var round : Self { get }
    
    /// `self` rounded to a given number of decimals
    func rounded(toDecimals decimals: Int) -> Self
    
    mutating func round(toDecimals decimals: Int)
}

// MARK: - Default

public extension Roundable where Self : FloatingPointArithmeticType
{
    /**
     Round `self` to arbitrary number
     
     - parameter number: the number to use in rounding, if `nil` self is rounded to nearest integral value
     */
    mutating func round(toNearest number: Self)
    {
        self = rounded(toNearest: number)
    }
    
    func rounded(toDecimals decimals: Int = 0) -> Self
    {
        return SwiftPlus.round(self, toDecimals: decimals)
    }
    
    mutating func round(toDecimals decimals: Int = 0)
    {
        self = rounded(toDecimals: decimals)
    }
}

public extension Roundable where Self : ArithmeticType
{
    /**
     Round `self` to arbitrary `number`
     
     - parameter number: the number to use in rounding
     */
    func rounded(toNearest number: Self) -> Self
    {
        let remainder = self % number
        return remainder < number / 2 ? self - remainder : self - remainder + number
    }
}

//MARK: - Round to number of decimals

public func round<F: FloatingPointArithmeticType>(_ f: F, toDecimals: Int = 0) -> F
{
    let decimals = max(0, toDecimals)
    
    if decimals == 0
    {
        return f.round
    }
    else
    {
        let factor = pow(10, F(decimals))
        
        return (f * factor).round / factor
    }
}


extension Double : Roundable
{
    /**
     Round `self` to arbitrary `number`
     
     - parameter number: the number to use in rounding
     */
    public func rounded(toNearest number: Double) -> Double
    {
        let remainder = self.truncatingRemainder(dividingBy: number)
        return remainder < number / 2 ? self - remainder : self - remainder + number
    }
    
    /// Largest integral value not greater than `self`
    public var floor : Double { return Foundation.floor(self) }
    
    /// Smallest integral value not less than `self`
    public var ceil : Double { return Foundation.ceil(self) }
    
    /// Nearest integral value, eaqual to, less than, or greater than `self`
    public var round : Double { return Foundation.round(self) }
}

extension Float : Roundable
{
    /// Largest integral value not greater than `self`
    public var floor : Float { return Foundation.floorf(self) }
    
    /// Smallest integral value not less than `self`
    public var ceil : Float { return Foundation.ceilf(self) }

    /// Nearest integral value, eaqual to, less than, or greater than `self`
    public var round : Float { return Foundation.roundf(self) }
}

//
//  Approximate.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

public protocol ApproximatelyEquatable
{
    /// compare `self` to `other` within the given precision, return **true** if they are close enough
    func equalTo(_ other: Self, within precision: Self) -> Bool
}

// MARK: - Default

public extension ApproximatelyEquatable where Self:Comparable, Self:Subtractable, Self:AbsoluteValuable
{
    func equalTo(_ other: Self, within precision: Self) -> Bool
    {
        return abs(self - other) <= abs(precision)
    }
}

//MARK: - Approximate equals

public func approximatelyEqual<C:Comparable>(_ lhs: C, _ rhs: C, accuracy: C) -> Bool where C:Subtractable, C:AbsoluteValuable
{
    return abs(rhs - lhs) <= abs(accuracy)
}



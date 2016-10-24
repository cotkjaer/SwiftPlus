//
//  Interpolation.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 02/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

/// LERP operator (◊ made with alt-shift-v)
infix operator ◊ : MultiplicationPrecedence// LeftAssociativity//{ associativity left precedence 160 }

/// Basic linear interpolation between two floating-point values
public func ◊ <F: FloatingPointArithmeticType> (ab: (F, F), t: F) -> F
{
    return ab.0 * (1 - t) + ab.1 * t
}

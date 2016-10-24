//
//  Power.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

// MARK: - Powerable

public protocol Powerable //: FloatingPointArithmeticType
{
    static func ** (left: Self, right: Self) -> Self

    func pow(_ rhs: Self) -> Self
}

infix operator ** : MultiplicationPrecedence//{ associativity left precedence 160 }

public func ** <F: Powerable>(left: F, right: F) -> F { return left.pow(right) }

infix operator **= : AssignmentPrecedence//{ associativity right precedence 90 }

public func **= <F: Powerable>(left: inout F, right: F) { left = left ** right }



public func pow<F: Powerable>(_ lhs: F, _ rhs: F) -> F
{
    return lhs.pow(rhs)
}

public func ** (left: Int, right: Int) -> Double { return pow(Double(left), Double(right)) }

// MARK: - Double

public func ** (left: Double, right: Double) -> Double { return pow(left, right) }

extension Double : Powerable
{
    public func pow(_ rhs: Double) -> Double
    {
        return Foundation.pow(self, rhs)
    }
}

// MARK: - Float

public func ** (left: Float, right: Float) -> Float { return powf(left, right) }

extension Float : Powerable
{
    public func pow(_ rhs: Float) -> Float
    {
        return Foundation.powf(self, rhs)
    }
}

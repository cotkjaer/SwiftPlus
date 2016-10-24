//
//  Squared.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Squarable : Multipliable
{
    var squareroot : Self { get }
    var squared : Self { get }
}

extension Squarable
{
    /// `self` * `self`
    public var squared : Self { return self * self }
}

extension Double : Squarable
{
    /// Squareroot of `self`
    public var squareroot : Double { return Foundation.sqrt(self) }
}

extension Float : Squarable
{
    /// Squareroot of `self`
    public var squareroot : Float { return Foundation.sqrt(self) }
}

extension CGFloat : Squarable
{
    /// Squareroot of `self`
    public var squareroot : CGFloat { return CoreGraphics.sqrt(self) }
}

//
//  Zeroable.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Zeroable
{
    func isZero() -> Bool

    static var zero : Self { get }
    
    init() // Zero
}

public extension Zeroable where Self : ExpressibleByIntegerLiteral
{
    static var zero : Self { return 0 }
}

public extension Zeroable where Self : Equatable
{
    func isZero() -> Bool { return self == Self.zero }
}

//
//  Sign.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 10/12/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import CoreGraphics

// MARK: - Sign

public extension Comparable where Self : ExpressibleByIntegerLiteral
{
    public var sign : Self { return self < 0 ? -1 : 1 }
}

public func sign<N:ExpressibleByIntegerLiteral>(_ n: N) -> N where N:Comparable
{
    return n < 0 ? -1 : 1
}

public func sameSign<N:ExpressibleByIntegerLiteral>(_ lhs: N, _ rhs: N) -> Bool where N:Comparable
{
    return sign(lhs) == sign(rhs)
}



//
//  Sum.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//


public func sum<T: IntegerArithmetic>(_ vs: T...) -> T where T:ExpressibleByIntegerLiteral
{
    return vs.reduce(0) { return $0 + $1 }
}

//MARK: - Sum

public extension Sequence where Iterator.Element : Addable//, Generator.Element : IntegerLiteralConvertible
{
    func sum() -> Iterator.Element
    {
        return reduce(Iterator.Element.zero) { return $0 + $1 }
    }
}

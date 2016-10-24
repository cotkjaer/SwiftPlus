//
//  Remainderable.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Remainderable
{
    static func % (lhs: Self, rhs: Self) -> Self
}

//
//  Epsilon.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//


// MARK: - Epsilon

extension Double
{
    /// The smallest Double where `Double(1) + Double.epsilon != Double(1)`
    public static var epsilon : Double { return DBL_EPSILON }
}

extension Float
{
    /// The smallest Float where `Float(1) + Float.epsilon != Float(1)`
    public static var epsilon : Float { return FLT_EPSILON }
}



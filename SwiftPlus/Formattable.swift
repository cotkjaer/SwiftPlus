//
//  Formattable.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 20/05/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

public protocol FormattableFloatingPointType : FloatingPoint
{
    func formatted(_ fractionDigits: Int) -> String
}

// MARK: - Format

extension NumberFormatter
{
    convenience init(decimalNumberWithFractionDigits fractionDigits: Int)
    {
        self.init()
        numberStyle = .decimal
        minimumFractionDigits = fractionDigits
        maximumFractionDigits = fractionDigits
    }
}

extension CGFloat : FormattableFloatingPointType
{
    public func formatted(_ fractionDigits: Int = 2) -> String
    {
        return Double(self).formatted(fractionDigits)
    }
}

extension Float : FormattableFloatingPointType
{
    public func formatted(_ fractionDigits: Int = 3) -> String
    {
        return NumberFormatter(decimalNumberWithFractionDigits: fractionDigits).string(from: NSNumber(value: self)) ?? String(self)
    }
}
extension Double : FormattableFloatingPointType
{
    public func formatted(_ fractionDigits: Int = 4) -> String
    {
        return NumberFormatter(decimalNumberWithFractionDigits: fractionDigits).string(from: NSNumber(value: self)) ?? String(self)
    }
}

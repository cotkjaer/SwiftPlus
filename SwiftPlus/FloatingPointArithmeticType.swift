//
//  FloatingPointArithmeticType.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol FloatingPointArithmeticType : FloatingPoint, ArithmeticType, IntegerConvertible, Squarable, Roundable, ExpressibleByFloatLiteral, FuzzyEquatable, Powerable, SignedNumber
{
    // MARK: - Constants
    
    /// The smallest `Self` where `Self(1) + Self.epsilon != Self(1)`
    static var epsilon : Self { get }
    
    static var 𝑒 : Self { get }
    
    static var π : Self { get }
    static var π2 : Self { get }
    
    static var π_2 : Self { get }
    static var π_4 : Self { get }
    static var π_8 : Self { get }
    
    func equalTo(_ number: Self, within precision: Self) -> Bool
}

extension Float : FloatingPointArithmeticType {}
extension Double : FloatingPointArithmeticType {}

// MARK: - Constants

extension FloatingPointArithmeticType
{
    public static var 𝑒 : Self { return 2.71828182845904523536028747135266250 }
    
    /// π ~ 3.1415926535897932384626433832795028841971693993751058209749445923078164062
    public static var π : Self { return 3.14159265358979323846264338327950288 }
    public static var π2 : Self { return 6.28318520717958647692528676655900576 }
    
    public static var π_2 : Self { return 1.57079632679489661923132169163975144 }
    public static var π_4 : Self { return 0.785398163397448309615660845819875721 }
    public static var π_8 : Self { return Self.π_4 / 2 }
}

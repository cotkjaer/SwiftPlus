//
//  CGSize.swift
//  SilverbackFramework
//
//  Created by Christian Otkjær on 20/04/15.
//  Copyright (c) 2015 Christian Otkjær. All rights reserved.
//

import CoreGraphics


// MARK: - CGFloatPair

extension CGSize : CGFloatPair
{
    public init<S1 : CGFloatConvertible, S2 : CGFloatConvertible>(_ width: S1, _ height: S2)
    {
        self.init(width: CGFloat(width), height: CGFloat(height))
    }
    
    public subscript(index: Int) -> CGFloat
        {
        set
        {
            switch index
            {
            case 0:
                width = newValue
                
            case 1:
                height = newValue
                
            default:
                debugPrint("index (\(index)) out of bounds for \(type(of: self))")
            }
        }
        get
        {
            switch index
            {
            case 0:
                return width
                
            case 1:
                return height
                
            default:
                debugPrint("index (\(index)) out of bounds for \(type(of: self))")
                return 0
            }
        }
    }
}

// MARK: - With

extension CGSize
{
    public func with(width: CGFloat? = nil, height: CGFloat? = nil) -> CGSize
    {
        return CGSize(width: width ?? self.width, height: height ?? self.height)
    }
    
    ///Returns *true* if `size` fits inside `self`
    public func fits(_ size: CGSize) -> Bool
    {
        return width >= size.width && height >= size.height
    }
}

// MARK: - Transform

public func * (size: CGSize, transform: CGAffineTransform) -> CGSize
{
    return size.applying(transform)
}

public func *= (size: inout CGSize, transform: CGAffineTransform)
{
    size = size * transform
}



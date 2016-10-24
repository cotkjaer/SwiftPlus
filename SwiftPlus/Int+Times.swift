//
//  Int+Times.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation


extension Int
{
    /// Runs the code passed as a closure the specified number of times.
    ///
    /// - Parameters:
    ///   - closure: The code to be run multiple times.

    public func times(_ closure: () -> ())
    {
        guard self > 0 else { return }
        
        for _ in 1...self
        {
            closure()
        }
    }
    
    
    /// Executes the closure the specified number of times with arguments increasing from 1 to `self`.
    ///
    /// - Parameters:
    ///   - closure: The code to be run multiple times.
    
    public func times(_ closure: (Int) -> ())
    {
        guard self > 0 else { return }
        
        for n in 1...self
        {
            closure(n)
        }
    }
    
    
    
}

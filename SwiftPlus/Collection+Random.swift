//
//  Collection+Random.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

// MARK: - Random

public extension Collection where Index == Int
{
    /**
     Picks a random element from this Int-indexed collection
     
     - returns: A random element from this collection or nil if this collection is empty
     */
    func random() -> Iterator.Element?
    {
        switch count
        {
        case 0:
            return nil
        case 1:
            return first
        default:
            return self[Int(randomBetween: startIndex, and: endIndex)]
        }
    }
    
    /// Returns a given number of random elements from this `Array`.
    ///
    /// - Parameters:
    ///   - size: The number of random elements wanted.
    /// - Returns: An array with the given number of random elements or `nil` if this array is empty.
    public func sample(size: Int) -> [Iterator.Element]?
    {
        guard !isEmpty else { return nil }
        
        var sampleElements = Array<Iterator.Element>()
        
        size.times {
            sampleElements.append(self.random()!)
        }
        
        return sampleElements
    }

}

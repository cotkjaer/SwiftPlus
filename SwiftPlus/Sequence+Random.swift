//
//  Sequence+Random.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

public extension Sequence
{
    /**
     Picks a random element from the sequence
     
     - returns: random element or nil if the sequence is empty
     */
    func random() -> Iterator.Element?
    {
        // Simpler way, but has to create a whole Array
        // return Array(self).random()
        
        var best : Double = 2
        var randomElement : Iterator.Element? = nil
        
        for element in self
        {
            let v = Double.random(between: 0, and: 1)
            
            guard v < best else { continue }
            
            randomElement = element
            best = v
        }
        
        return randomElement
    }
}

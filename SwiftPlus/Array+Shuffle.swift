//
//  Array+Random.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Shuffle

public extension Array
{
    /**
     Randomly rearranges (shuffles) the elements of self using the [Fisher-Yates shuffle](https://en.wikipedia.org/wiki/Fisher–Yates_shuffle)
     */
    mutating func shuffle()
    {
        let N = count
        
        if N > 1
        {
            for i in stride(from: (N - 1), to: 1, by: -1)
            {
                let j = Int.random(between: 0, and: i + 1)
                
                if j != i
                {
                    swap(&self[i], &self[j])
                }
            }
        }
    }
    
    /**
     Shuffles the values of the array into a new one
     
     - returns: Shuffled copy of self
     */
    func shuffled() -> Array
    {
        var shuffled = self
        
        shuffled.shuffle()
        
        return shuffled
    }
}





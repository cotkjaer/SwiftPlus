//
//  Heap.swift
//  Collections
//
//  Created by Christian Otkjær on 26/05/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

public struct Heap<Element>
{
    public init<S: Sequence>(elements: S, isOrderedBefore: @escaping (Element, Element) -> Bool) where S.Iterator.Element == Element
    {
        self.isOrderedBefore = isOrderedBefore
        for e in elements
        {
            push(e)
        }
    }
    
    public init(isOrderedBefore: @escaping (Element, Element) -> Bool)
    {
        self.isOrderedBefore = isOrderedBefore
    }
    
    public var count : Int { return heap.count }
    
    public var isEmpty : Bool { return heap.isEmpty }
    
    /// Push a new `element` onto the heap
    public mutating func push(_ element: Element)
    {
        // use only append() and removeLast(), as they are MUCH faster than any other Array insert/remove
        heap.append(element)
        
        siftUp()
    }
    
    /// Peek at the top of the heap (the smallest (by isOrderedBefore) element)
    
    public func peek() -> Element?
    {
        return heap.first
    }
    
    /// Remove the top of the heap (the smallest (by isOrderedBefore) element)
    
    public mutating func pop() -> Element?
    {
        let result : Element?
        
        switch heap.endIndex
        {
        case 0:
            result = nil
            
        case 1:
            result = heap.removeLast()
            
        case 2:
            result = heap.removeFirst()
            
        default:
            swap(&heap[heap.startIndex], &heap[heap.endIndex - 1])
            
            result = heap.removeLast()
            
            siftDown()
        }
        
        return result
    }
    
    // MARK: - Private
    
    // The actual heap of elements
    fileprivate var heap = Array<Element>()
    
    // The less-than closure
    fileprivate let isOrderedBefore : (Element, Element) -> Bool
        
    fileprivate func parentIndexForChildIndex(_ childIndex: Int) -> Int?
    {
        guard childIndex > 0 else { return nil }
        
        return (childIndex - 1) / 2 //Int(floor((Float(childIndex) - 1) / 2))
    }
    
    fileprivate func childIndexForLeastChild(_ parentIndex: Int) -> Int?
    {
        var childIndex : Int?
        
        let leftChildIndex = 2 * parentIndex + 1
        
        if leftChildIndex < heap.endIndex
        {
            childIndex = leftChildIndex
        }
        
        let rightChildIndex = leftChildIndex + 1
        
        if rightChildIndex < heap.endIndex
        {
            if isOrderedBefore(heap[rightChildIndex], heap[leftChildIndex])
            {
                childIndex = rightChildIndex
            }
        }
        
        return childIndex
    }
    
    /// Moves the top of the heap "down" to its proper position
    fileprivate mutating func siftDown()
    {
        guard heap.endIndex > 1 else { return }
        
        var parentIndex = heap.startIndex
        
        while let leastChildIndex = childIndexForLeastChild(parentIndex)
        {
            if isOrderedBefore(heap[parentIndex], heap[leastChildIndex]) { break }
            
            swap(&heap[leastChildIndex], &heap[parentIndex])
            
            parentIndex = leastChildIndex
        }
    }
    
    // Moves the bottom/last element "up" through the heap to its proper position
    fileprivate mutating func siftUp()
    {
        guard heap.endIndex > 1 else { return }
        
        var childIndex = heap.endIndex - 1
        
        while let parentIndex = parentIndexForChildIndex(childIndex)
        {
            if isOrderedBefore(heap[parentIndex], heap[childIndex]) { break }

            swap(&heap[childIndex], &heap[parentIndex])
                
            childIndex = parentIndex
        }
    }
}

// MARK: - Comparable

extension Heap where Element : Comparable
{
    public init()
    {
        self.init(isOrderedBefore: <)
    }
    
    public init<S: Sequence>(elements: S) where S.Iterator.Element == Element
    {
        self.init(elements: elements, isOrderedBefore: <)
    }
}

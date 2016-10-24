//
//  OperationQueue+Block.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Completion

extension BlockOperation
{
    public convenience init(block: @escaping () -> (), completion: ((_ cancelled: Bool) -> ())?)
    {
        self.init(block: block)
        
        if let completion = completion
        {
            completionBlock = { completion(self.isCancelled) }
        }
    }
}

// MARK: - Convenience Add

extension OperationQueue
{
    public func addOperationWithBlock(_ block: @escaping () -> (), completion: ((_ cancelled: Bool) -> ())?)
    {
        addOperation(BlockOperation(block: block, completion: completion))
    }
}

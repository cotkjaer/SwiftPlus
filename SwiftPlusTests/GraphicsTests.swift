//
//  GraphicsTests.swift
//  GraphicsTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
import CoreGraphics
@testable import SwiftPlus

class GraphicsTests: XCTestCase
{
    func test_CGFloat_pow()
    {
        let f = CGFloat(3)
        
        XCTAssertEqual(f.pow(2), 9)
    }
    
    func test_plus_CGPoint_CGVector()
    {
        let p = CGPoint(x: 2, y: 4)
        let v = CGVector(dx: 2, dy: 4)
                
        XCTAssertEqual(p + v, CGPoint(4, 8))
    }
    
    func test_vector_plus()
    {
        let v1 = CGVector(dx: 2, dy: 4)
        let v2 = CGVector(dx: -1, dy: 0)
        
        XCTAssertEqual(CGVector(dx: 1, dy:4), v1 + v2)
    }
}

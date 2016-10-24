//
//  InterpolationTests.swift
//  ArithmeticTests
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class InterpolationTests: XCTestCase
{
    func test_Float()
    {
        let f1 = Float(1)
        let f2 = Float(2)
        
        XCTAssertEqual((f1, f2) ◊ 0.5, 1.5)
    }

    func test_Double()
    {
        let d1 = Double(1)
        let d2 = Double(2)
        
        XCTAssertEqual((d1, d2) ◊ 0.5, 1.5)
    }
}

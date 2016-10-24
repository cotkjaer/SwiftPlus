//
//  OddEvenTests.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class IntTests: XCTestCase
{
    func test_even()
    {
        let negative10 = -10
        
        XCTAssert(negative10.even)
        XCTAssert(2.even)
        XCTAssert(0.even)
        XCTAssertFalse(129398121.even)
    }
    
    func test_odd()
    {
        let negativeFive = -5
        
        XCTAssert(negativeFive.odd)
        XCTAssert((-71).odd)
        XCTAssertFalse(80.odd)
        XCTAssertFalse(0.odd)
    }
}

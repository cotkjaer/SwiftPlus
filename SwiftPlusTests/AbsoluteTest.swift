//
//  AbsoluteTest.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 20/05/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class AbsoluteTest: XCTestCase
{
    func test_abs()
    {
        let f : Float = -89
 
        XCTAssertEqual(abs(f), 89)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//
//  FormatTests.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 20/05/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest

class FormatTests: XCTestCase
{
    func test_CGFloat()
    {
        var f : CGFloat = 0
        
        XCTAssertEqual(f.formatted(), "0.00")
        
        f = 12.012345
        
        XCTAssertEqual(f.formatted(), "12.01")
        XCTAssertEqual(f.formatted(5), "12.01234")
    }
    
    func test_Float()
    {
        var f : Float = 0
        
        XCTAssertEqual(f.formatted(), "0.000")
        
        f = 12.012345
        
        XCTAssertEqual(f.formatted(), "12.012")
        XCTAssertEqual(f.formatted(4), "12.0123")
    }
    func test_Double()
    {
        var f : Double = 0
        
        XCTAssertEqual(f.formatted(), "0.0000")
        
        f = 12.012345
        
        XCTAssertEqual(f.formatted(), "12.0123")
        XCTAssertEqual(f.formatted(5), "12.01234")
        XCTAssertEqual(f.formatted(0), "12")
    }

}

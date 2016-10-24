//
//  OperatorsTests.swift
//  Silverback
//
//  Created by Christian Otkjær on 16/09/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import XCTest

@testable import SwiftPlus

class OperatorsTests: XCTestCase
{
    func test_pow_operator()
    {
        XCTAssertEqual(256, 4 ** 4)
        XCTAssertEqual(1.0/256.0, 4 ** -4)
        XCTAssertEqual(256, -4 ** 4)
        XCTAssertEqual(1.0/256.0, -4 ** -4)
        
        XCTAssertEqual(1, 4 ** 0)
        XCTAssertEqual(4, 4 ** 1)
        XCTAssertEqual(1.0/4.0, 4 ** -1)
        XCTAssertEqual(-1.0/4.0, -4 ** -1)
    }    
}

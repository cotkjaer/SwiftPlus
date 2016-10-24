//
//  RoundingTests.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 05/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class RoundingTests: XCTestCase
{
    func test_round_to_decimals()
    {
        let d = 0.005

        XCTAssertEqual(round(d), d.rounded())
        XCTAssertEqual(round(d, toDecimals: 1), d.rounded(toDecimals: 1))
        XCTAssertEqual(round(d, toDecimals: 2), d.rounded(toDecimals: 2))
        XCTAssertEqual(round(d, toDecimals: 5), d.rounded(toDecimals: 5))
        XCTAssertEqual(round(d, toDecimals: 4), d.rounded(toDecimals: 12))


        XCTAssertEqual(round(d), 0)
        
        XCTAssertEqual(round(-d), 0)

        XCTAssertEqual(round(d, toDecimals: 1), 0)
        
        XCTAssertEqual(round(-d, toDecimals: 1), 0)

        XCTAssertEqual(round(d, toDecimals: 2), 0.01)

        XCTAssertEqual(round(-d, toDecimals: 2), -0.01)

        XCTAssertEqual(round(d, toDecimals: 7), d)
        
        XCTAssertEqual(round(-d, toDecimals: 7), -d)
    }
}

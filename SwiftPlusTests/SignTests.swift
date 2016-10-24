//
//  SignTests.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class SignTests: XCTestCase
{
    func test_Comparable_sign()
    {
        XCTAssertEqual(-3.5.sign, -1)
        XCTAssertEqual(-3.sign, -1)
        XCTAssertEqual(Float(3.5).sign, 1)
        XCTAssertEqual(Float(0).sign, 1)
    }
}

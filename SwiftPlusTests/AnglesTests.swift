//
//  AnglesTests.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 05/10/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class AnglesTests: XCTestCase
{
    func test_normalized()
    {
        let theta = Double.π
        
        let thetaN = theta.normalized()
        
        XCTAssertEqual(theta, thetaN)
    }
}

//
//  EpsilonTests.swift
//  Arithmetic
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

class EpsilonTests: XCTestCase
{
    func test_Double_epsilon()
    {
        XCTAssertGreaterThan(Double.epsilon, 0)
        
        let one = Double(1)
        
        XCTAssertGreaterThan(one + Double.epsilon, one)
        XCTAssert(one + Double.epsilon * 0.5 == one)
    }
    
    func test_Float_epsilon()
    {
        XCTAssertGreaterThan(Float.epsilon, 0)
        
        let one = Float(1)
        
        XCTAssertGreaterThan(one + Float.epsilon, one)
        XCTAssert(one + Float.epsilon * 0.5 == one)
    }    
}

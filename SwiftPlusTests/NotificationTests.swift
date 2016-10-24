//
//  NotificationTests.swift
//  NotificationTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest

@testable import SwiftPlus

class NotificationTests: XCTestCase
{
    func test_when()
    {
        let nhm = NotificationHandlerManager()
        
        let expectation = self.expectation(description: "Notification Received")
        
        
        nhm.when("TestNotification") {
            expectation.fulfill()
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestNotification"), object: nil)
        
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func test_on()
    {
        let nhm = NotificationHandlerManager()
        
        let expectation = self.expectation(description: "Notification Received")
        
        
        nhm.onAny(from: self) { expectation.fulfill() }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestNotification"), object: self)
        
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertNil(error)
            
        }
    }
    
}

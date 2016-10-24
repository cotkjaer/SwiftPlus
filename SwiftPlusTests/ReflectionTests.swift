//
//  ReflectionTests.swift
//  ReflectionTests
//
//  Created by Christian Otkjær on 04/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import SwiftPlus

enum ReflectionTestEnum
{
    case one, two
}

class ReflectionTests: XCTestCase
{
    func test_typeName_base_types()
    {
        XCTAssertEqual(typeName(String.self), "String")
        XCTAssertEqual(typeName(Int.self), "Int")
        XCTAssertEqual(typeName(Float.self), "Float")
        XCTAssertEqual(typeName(Double.self), "Double")
        XCTAssertEqual(typeName([String].self), "Array<String>")
    }
    
    func test_typeName_custom_types()
    {
        XCTAssertEqual(typeName(NSObject.self), "NSObject")
        XCTAssertEqual(typeName(ReflectionTests.self), "ReflectionTests")
        XCTAssertEqual(typeName(ReflectionTestEnum.self), "ReflectionTestEnum")
        XCTAssertEqual(typeName(CGPoint.self), "CGPoint")
    }
    
    func test_typeName_base_values()
    {
        XCTAssertEqual(typeName("s"), "String")
        XCTAssertEqual(typeName(1), "Int")
        XCTAssertEqual(typeName(Float(1)), "Float")
        XCTAssertEqual(typeName(0.33), "Double")
        XCTAssertEqual(typeName(Double(0.5)), "Double")
        XCTAssertEqual(typeName(["s"]), "Array<String>")
    }

    typealias Func = (())->()
    
    func test_typeName_custom_values()
    {
        XCTAssertEqual(typeName(NSObject()), "NSObject")
        XCTAssertEqual(typeName(CGPoint(x: 0, y: 1)), "CGPoint")
        XCTAssertEqual(typeName(self), "ReflectionTests")
        XCTAssertEqual(typeName(Func.self), "(()) -> ()")
        XCTAssertEqual(typeName(ReflectionTestEnum.two), "ReflectionTestEnum")
    }

}

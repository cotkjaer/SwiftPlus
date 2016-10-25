//
//  FileManagerTests.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 25/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import XCTest

class FileManagerTests: XCTestCase
{
    func test_documents_folder()
    {
        let fm = FileManager.default
        
        XCTAssertNotNil(fm.documentsFolderURL())
        XCTAssertNotNil(fm.documentsFolderPath())
    }
    
    func test_copy_resource()
    {
        let fm = FileManager.default
        
        let documentsFolderPath = fm.documentsFolderPath()
        
        XCTAssertNotNil(documentsFolderPath)
        
        let bundle = Bundle(for: FileManagerTests.self)
        
        let filePath = try! fm.copy(resourceNamed: "mosaic_sun", ofType: "jpg", inBundle: bundle, toFolder: documentsFolderPath!)
        
        XCTAssertNotNil(filePath)
        
        XCTAssertNil(try fm.copy(resourceNamed: "mosaic_sun", ofType: "jpg", inBundle: bundle, toFolder: documentsFolderPath!))
        
        XCTAssertNotNil(fm.documentURL(forFile: "mosaic_sun", fileExtension: "jpg"))
        
        try! fm.removeItem(atPath: filePath!)
        
    }
}

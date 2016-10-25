//
//  FileManager.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 25/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

public extension FileManager
{
    func copy(resourceNamed name: String, ofType: String, inBundle bundle: Bundle = Bundle.main, toFolder folderPath: String) throws -> Bool
    {
        //            let pathToDocumentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        
        let pathToFile = folderPath.appending("/\(name).\(ofType)")
        
        guard !FileManager.default.fileExists(atPath: pathToFile) else { return false }
        
        guard let pathToBundledResource = bundle.path(forResource: name, ofType: ofType) else { return false }
        
        try FileManager.default.copyItem(atPath: pathToBundledResource, toPath: pathToFile)
        
        return true
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error? ) -> ())
    {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    class func documentsDirectoryURL() -> URL?
    {
        guard let path = documentDirectoryPath() else { return nil }
        
        return URL(fileURLWithPath: path, isDirectory: true)
    }
    
    class func documentURLFor(_ fileName: String, fileExtension: String) -> URL?
    {
        return documentsDirectoryURL()?.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    
    class func documentDirectoryPath() -> String?
    {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    }
}

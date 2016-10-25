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
    func copy(resourceNamed name: String, ofType: String, inBundle bundle: Bundle = Bundle.main, toFolder folderPath: String) throws -> String?
    {
        //            let pathToDocumentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        
        let pathToFile = folderPath.appending("/\(name).\(ofType)")
        
        guard !FileManager.default.fileExists(atPath: pathToFile) else { return nil }
        
        guard let pathToBundledResource = bundle.path(forResource: name, ofType: ofType) else { return nil }
        
        try FileManager.default.copyItem(atPath: pathToBundledResource, toPath: pathToFile)
        
        return pathToFile
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error? ) -> ())
    {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func documentsFolderURL() -> URL?
    {
        guard let path = documentsFolderPath() else { return nil }
        
        return URL(fileURLWithPath: path, isDirectory: true)
    }
    
    func documentURL(forFile fileName: String, fileExtension: String) -> URL?
    {
        return documentsFolderURL()?.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    
    func documentsFolderPath() -> String?
    {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    }
}

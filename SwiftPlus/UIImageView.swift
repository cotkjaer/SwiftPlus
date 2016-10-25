//
//  UIImageView.swift
//  SwiftPlus
//
//  Created by Christian Otkjær on 25/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import UIKit

// MARK: - Load

extension UIImageView
{
    func load(imageNamed name: String, ofType type: String)
    {
        if let filePath = Bundle.main.path(forResource: name, ofType: type),
            let image = UIImage(contentsOfFile: filePath)
        {
            self.contentMode = .scaleAspectFit
            self.image = image
        }
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit)
    {
        guard let url = URL(string: link) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data,// error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.contentMode = mode
                self.image = image
            }
            }.resume()
    }
}


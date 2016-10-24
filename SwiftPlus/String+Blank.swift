//
//  String+Blank.swift
//  Text
//
//  Created by Christian Otkjær on 16/10/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

import Foundation

extension String
{
    /// `true` if this string contains any non-whitespace characters.
    public var isBlank: Bool { return stripped().isEmpty }
}

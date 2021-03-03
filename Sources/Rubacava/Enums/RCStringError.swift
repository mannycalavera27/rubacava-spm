//
//  File.swift
//  
//
//  Created by Tiziano Cialfi on 03/03/21.
//

import Foundation

public enum RCStringError: Error {
    case dataConverting(message: String)
    case attributedStringConverting
}

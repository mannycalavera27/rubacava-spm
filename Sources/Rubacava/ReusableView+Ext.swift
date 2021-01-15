//
//  File.swift
//  
//
//  Created by Tiziano Cialfi on 15/01/21.
//

import Foundation

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

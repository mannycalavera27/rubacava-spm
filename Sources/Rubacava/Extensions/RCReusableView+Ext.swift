//
//  RCReusableView+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 15/01/21.
//

import Foundation

extension RCReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

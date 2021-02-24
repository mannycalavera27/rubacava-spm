//
//  NSLayoutConstraint+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 24/02/21.
//

import UIKit

extension NSLayoutConstraint {
    static func deactivateConstraint(_ constraints: NSLayoutConstraint?...) {
        constraints.forEach{ constraint in
            constraint?.isActive = false
        }
    }
    
    static func activeConstraint(_ constraints: NSLayoutConstraint?...) {
        constraints.forEach{ constraint in
            constraint?.isActive = true
        }
    }
}

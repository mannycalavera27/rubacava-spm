//
//  UIView+StackExt.swift
//  
//
//  Created by Tiziano Cialfi on 27/01/21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func stackView(axis: NSLayoutConstraint.Axis,
                   views: UIView...,
                   distribution: UIStackView.Distribution = .fill,
                   alignment: UIStackView.Alignment = .fill,
                   spacing: CGFloat = 0) throws -> UIStackView {
        
        return try _stackView(axis: axis,
                      distribution: distribution,
                      alignment: alignment,
                      spacing: spacing,
                      views: views)
    }
    
    fileprivate func _stackView(axis: NSLayoutConstraint.Axis,
                                distribution: UIStackView.Distribution,
                                alignment: UIStackView.Alignment,
                                spacing: CGFloat,
                                views: [UIView]) throws -> UIStackView {
        let sv = UIStackView(arrangedSubviews: views)
        sv.axis = axis
        sv.distribution = distribution
        sv.alignment = alignment
        sv.spacing = spacing
        addSubview(sv)
        sv.fill(superview: self)
        return sv
    }
    
}

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
        try sv.fillSuperview()
        return sv
    }
    
    @discardableResult
    func size(_ size: CGSize) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
}

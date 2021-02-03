//
//  UIView+AutolayoutExt.swift
//  
//
//  Created by Tiziano Cialfi on 27/01/21.
//

import UIKit

public extension UIView {
    @discardableResult
    func fill(superview: UIView, padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        removeFromSuperview()
        superview.addSubview(self)
        return anchor(top: self.superview!.topAnchor,
                      leading: self.superview!.leadingAnchor,
                      bottom: self.superview!.bottomAnchor,
                      trailing: self.superview!.trailingAnchor,
                      padding: padding)
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func fillSafeArea(superview: UIView, padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        removeFromSuperview()
        superview.addSubview(self)
        return anchor(top: self.superview!.safeAreaLayoutGuide.topAnchor,
                      leading: self.superview!.safeAreaLayoutGuide.leadingAnchor,
                      bottom: self.superview!.safeAreaLayoutGuide.bottomAnchor,
                      trailing: self.superview!.safeAreaLayoutGuide.trailingAnchor,
                      padding: padding)
    }
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?,
                leading: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top,
         anchoredConstraints.leading,
         anchoredConstraints.bottom,
         anchoredConstraints.trailing,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @discardableResult
    func centerInSuperview(size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        if let superviewCenterX = superview?.centerXAnchor {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superviewCenterX)
        }
        if let superviewCenterY = superview?.centerYAnchor {
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superviewCenterY)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.centerX,
         anchoredConstraints.centerY,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @discardableResult
    func centerXToSuperview() -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        if let superviewCenterX = superview?.centerXAnchor {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superviewCenterX)
        }
        anchoredConstraints.centerX?.isActive = true
        
        return anchoredConstraints
    }
    
    @discardableResult
    func centerYToSuperview() -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let superviewCenterY = superview?.centerYAnchor {
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superviewCenterY)
        }
        anchoredConstraints.centerY?.isActive = true
        return anchoredConstraints
    }
    
    
    @discardableResult
    func constraintWidth(_ widthAnchor: NSLayoutDimension) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalTo: widthAnchor)
        anchoredConstraints.width?.isActive = true
        
        return anchoredConstraints
    }
    
    @discardableResult
    func constraintHeight(_ heightAnchor: NSLayoutDimension) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.height = heightAnchor.constraint(equalTo: heightAnchor)
        anchoredConstraints.height?.isActive = true
        
        return anchoredConstraints
    }
    
    @discardableResult
    func constraintSize(_ size: CGSize) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        anchoredConstraints.width?.isActive = true
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        anchoredConstraints.height?.isActive = true
        
        return anchoredConstraints
    }
    
    @discardableResult
    func constraintWidth(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.width?.isActive = true
        
        return anchoredConstraints
    }
    
    @discardableResult
    func constraintHeight(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.height?.isActive = true
        
        return anchoredConstraints
    }
    
}

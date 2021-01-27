//
//  UIStack+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 27/01/21.
//

import UIKit

public extension UIStackView {
    
    @discardableResult
    func margins(_ margin: CGFloat) -> UIStackView {
        layoutMargins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func margins(_ margins: UIEdgeInsets) -> UIStackView {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padTop(_ top: CGFloat = 16.0) -> UIStackView {
        layoutMargins.top = top
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padLeft(_ left: CGFloat = 16.0) -> UIStackView {
        layoutMargins.left = left
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padRight(_ right: CGFloat = 16.0) -> UIStackView {
        layoutMargins.right = right
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padBottom(_ bottom: CGFloat = 16.0) -> UIStackView {
        layoutMargins.bottom = bottom
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padVertical(_ vertical: CGFloat = 16.0) -> UIStackView {
        layoutMargins.top = vertical
        layoutMargins.bottom = vertical
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padHorizontal(_ horizontal: CGFloat = 16.0) -> UIStackView {
        layoutMargins.left = horizontal
        layoutMargins.right = horizontal
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func pad(_ padding: CGFloat = 16.0) -> UIStackView {
        layoutMargins.top = padding
        layoutMargins.bottom = padding
        layoutMargins.left = padding
        layoutMargins.right = padding
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
}

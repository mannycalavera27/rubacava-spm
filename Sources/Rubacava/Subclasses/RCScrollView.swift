//
//  RCScrollView.swift
//  
//
//  Created by Tiziano Cialfi on 03/02/21.
//

import UIKit

public final class RCScrollView: UIScrollView {
    
    public let stackView: UIStackView
    
    public init(stackView: UIStackView) {
        self.stackView = stackView
        super.init(frame: .zero)
        stackView.fill(superview: self)
        
        if stackView.axis == .vertical {
            stackView.constraintWidth(widthAnchor)
        } else {
            stackView.constraintHeight(heightAnchor)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

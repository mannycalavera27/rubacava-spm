//
//  RCImageView.swift
//  
//
//  Created by Tiziano Cialfi on 19/01/21.
//

import UIKit

public final class RCImageView: UIImageView {
    public init(contentMode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
        set(contentMode: contentMode)
        set(cornerRadius: cornerRadius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func set(contentMode: UIView.ContentMode) {
        self.contentMode = contentMode
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    private func set(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
    }
}

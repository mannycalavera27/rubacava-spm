//
//  RCImageView.swift
//  
//
//  Created by Tiziano Cialfi on 19/01/21.
//

import UIKit
import SDWebImage

public final class RCImageView: UIImageView {
    
    public typealias RCSetImageCompletion = (UIImage?, Error?, SDImageCacheType?, URL?) -> ()
    
    init(contentMode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0) {
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
    
    public func setImage(from url: URL?,
                         placeholder: UIImage? = nil,
                         completion: RCSetImageCompletion? = nil) {
        sd_setImage(with: url, placeholderImage: placeholder) { (img, err, cacheType, url) in
            completion?(img, err, cacheType, url)
        }
    }
}

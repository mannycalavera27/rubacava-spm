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
    
    init(parameters: RCImageViewParameters) {
        super.init(frame: .zero)
        set(parameters: parameters)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func set(parameters: RCImageViewParameters) {
        set(contentMode: parameters.contentMode)
        set(cornerRadius: parameters.cornerRadius)
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
    
    public final class RCImageViewParameters {
        let contentMode: UIView.ContentMode
        let cornerRadius: CGFloat
        
        init(contentMode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0) {
            self.contentMode = contentMode
            self.cornerRadius = cornerRadius
        }
    }
}

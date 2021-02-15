//
//  RCCollectionViewController.swift
//  
//
//  Created by Tiziano Cialfi on 15/02/21.
//

import UIKit

open class RCCollectionViewController: UICollectionViewController {
    
    public init(scrollDirection: UICollectionView.ScrollDirection = .vertical) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

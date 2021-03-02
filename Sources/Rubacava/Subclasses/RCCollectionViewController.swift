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
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func refreshControlEndRefreshing() {
        guard let refreshControl = collectionView.refreshControl else { return }
        DispatchQueue.main.async {
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
        }
    }
    
}

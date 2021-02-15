//
//  UICollectionView+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 15/02/21.
//

import UIKit

extension UICollectionView {
    func register(cell: UICollectionViewCell.Type) {
        register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    func register(reusableView: UICollectionReusableView.Type, of kind: String) {
        register(reusableView, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableView.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable collection view cell")
        }
        return cell
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(of kind: String, for indexPath: IndexPath) -> T {
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable collection view reusable view")
        }
        return reusableView
    }
}

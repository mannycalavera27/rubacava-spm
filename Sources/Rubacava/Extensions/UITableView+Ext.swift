//
//  UITableView+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 15/01/21.
//

import UIKit

public extension UITableView {
    func register(cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func register(headerFooter: UITableViewHeaderFooterView.Type) {
        register(headerFooter, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable table view cell")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to dequeue reusable table view header or footer")
        }
        return headerFooterView
    }
}

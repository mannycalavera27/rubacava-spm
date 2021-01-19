//
//  File.swift
//  
//
//  Created by Tiziano Cialfi on 15/01/21.
//

import UIKit

extension UITableView {
    public func register(cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    public func register(headerFooter: UITableViewHeaderFooterView.Type) {
        register(headerFooter, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable table view cell")
        }
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to dequeue reusable table view header or footer")
        }
        return headerFooterView
    }
}

//
//  File.swift
//  
//
//  Created by Tiziano Cialfi on 15/01/21.
//

import UIKit

extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable table view cell")
        }
        return cell
    }
}

//
//  DateFormatter+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 27/01/21.
//

import Foundation

public extension DateFormatter {
    static let standardWithTSeparator: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return df
    }()
    
    static let acf: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return df
    }()
}

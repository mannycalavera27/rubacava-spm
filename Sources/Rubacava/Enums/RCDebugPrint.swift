//
//  RCDebugPrint.swift
//  
//
//  Created by Tiziano Cialfi on 15/02/21.
//

import Foundation

public enum RCDebugPrint {
    #if DEBUG
    public static func location(_ message: String,
                         filePath: String = #filePath,
                         function: String = #function,
                         line: Int = #line,
                         column: Int = #column) {
        let fileName = (filePath as NSString).lastPathComponent
        print("""
            \(message)
            \(fileName)
            \(function)
            line: \(line), col: \(column)
        """)
    }
    #endif
}

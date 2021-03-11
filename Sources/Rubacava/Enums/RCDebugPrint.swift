//
//  RCDebugPrint.swift
//  
//
//  Created by Tiziano Cialfi on 15/02/21.
//

import Foundation

public enum RCDebugPrint {
    
    public static func location(_ message: Any,
                         filePath: String = #filePath,
                         function: String = #function,
                         line: Int = #line,
                         column: Int = #column) {
        #if DEBUG
        let fileName = (filePath as NSString).lastPathComponent
        print("\(message)\n\t\(fileName)\n\t\(function)\n\tline: \(line), column: \(column)")
        #endif
    }

}

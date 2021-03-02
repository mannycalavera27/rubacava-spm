//
//  String+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 02/03/21.
//

import UIKit

public extension String {
    
    func htmlAttributedString(font: UIFont, color: UIColor) -> NSAttributedString? {
        
        let htmlTemplate = """
        <!doctype html>
        <html>
          <head>
            <style>
              body {
                color: \(color.hexString!);
                font-family: \(font.familyName);
                font-size: \(font.pointSize * 1.2)px;
              }
            </style>
          </head>
          <body>
            \(self)
          </body>
        </html>
        """
        
        guard let data = htmlTemplate.data(using: .utf8) else {
            return nil
        }
        
        guard let attributedString = try? NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil) else {
            return nil
        }
        
        return attributedString
    }
    
}

//
//  Bundle+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 19/01/21.
//

import Foundation

public extension Bundle {
    
    private static let nameKey = "CFBundleName"
    private static let versionKey = "CFBundleShortVersionString"
    private static let buildKey = "CFBundleVersion"
    
    enum BundleError: Error {
        case valueNotFoundInInfoDictionary(String)
    }
    
    static func appBundleName() throws -> String {
        return try infoDictionaryValue(from: nameKey)
    }
    
    static func appVersion() throws -> String {
        return try infoDictionaryValue(from: versionKey)
    }
    
    static func appBuild() throws -> String {
        return try infoDictionaryValue(from: buildKey)
    }
    
    private static func infoDictionaryValue(from key: String) throws -> String {
        guard
            let dictionary = Bundle.main.infoDictionary,
            let value = dictionary[key] as? String
        else {
            throw BundleError.valueNotFoundInInfoDictionary(buildKey)
        }
        return value
    }
    
}

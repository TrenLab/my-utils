//
//  String+extension.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Convert

public extension String {
    public var int: Int? {
        return Int(self)
    }
    
    public var uint: UInt? {
        return UInt(self)
    }
    
    public var ns_string: NSString {
        return NSString(string: self)
    }
    
    public var length: UInt {
        return UInt(characters.count)
    }
}

// MARK: - Random

public extension String {
    public static func random(wihtLength length: Int) -> String {
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        
        for _ in 0 ..< length {
            let randNum   = arc4random_uniform(UInt32(letters.length))
            var nextChar  = letters.character(at: Int(randNum))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}

// MARK: - Modify

public extension String {
    public func dropLast() -> String {
        return substring(to: index(before: endIndex))
    }
}

// MARK: - Encode

public extension String {
    public var URLEncodedString: String {
        var new = encodedString(with: .urlQueryAllowed)
        new = new.replacingOccurrences(of: "?", with: "")
        return new
    }
    
    public func encodedString(with characterSet: CharacterSet) -> String {
        guard let rez = addingPercentEncoding(withAllowedCharacters: characterSet) else {
            return ""
        }
        return rez
    }
}

// MARK: - Decode

public extension String {
    public var URLDecodedString: String {
        return self.removingPercentEncoding!
    }
}

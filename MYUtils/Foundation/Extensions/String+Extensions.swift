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
}

// MARK: - Random

public extension String {
    public static func random(wihtLength length: Int) -> String {
        return random(wihtLength: length, fromLetters: standardAlphabet())
    }
    
    public static func random(wihtLength length: Int, fromLetters letters: String) -> String {
        var randomString = ""

        let ns_stringLetters = letters.ns_string
        for _ in 0 ..< length {
            let randNum = arc4random_uniform(UInt32(letters.length))
            var nextChar = ns_stringLetters.character(at: Int(randNum))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    public static func standardAlphabet() -> String {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    }
}

// MARK: - Size

public extension String {
    public var length: Int {
        return characters.count
    }
}

// MARK: - Encode

public extension String {
    public var URLEncodedString: String {
        return URLEncodedString(with: .urlQueryAllowed)
    }
    
    public func URLEncodedString(with characterSet: CharacterSet) -> String {
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

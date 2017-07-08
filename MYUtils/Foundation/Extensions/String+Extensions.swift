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
    
    /**
     Returns the result of converting the reciever to integer.
     */
    public var int: Int? {
        return Int(self)
    }
    
    /**
     Returns the result of converting the reciever to unsigned integer.
     */
    public var uint: UInt? {
        return UInt(self)
    }
    
    /**
     Returns the result of converting the reciever to NSString.
     */
    public var ns_string: NSString {
        return NSString(string: self)
    }
}

// MARK: - Random

public extension String {
    
    /**
     Returns random the string of the specified length and from the standard alphabet.
     */
    public static func random(wihtLength length: Int) -> String {
        return random(wihtLength: length, fromLetters: standardAlphabet)
    }
    
    /**
     Returns random the string of the specified length and letters.
     */
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
    
    /**
     Standard alphabet. abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
     */
    public static var standardAlphabet:  String {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    }
}

// MARK: - Size

public extension String {
    
    /**
     Returns length of the receiver.
     */
    public var length: Int {
        return characters.count
    }
}

// MARK: - Encode

public extension String {
    
    /**
     Returns encoded string by adding percent encoded method with CharacterSet.urlQueryAllowed character set.
    */
    public var URLEncodedString: String {
        return URLEncodedString(with: .urlQueryAllowed)
    }
    
    /**
     Returns encoded string by adding percent encoded method with specific character set.
     - Parameters:
        - characterSet: A character set.
     */
    public func URLEncodedString(with characterSet: CharacterSet) -> String {
        guard let rez = addingPercentEncoding(withAllowedCharacters: characterSet) else {
            return ""
        }
        return rez
    }
}

// MARK: - Decode

public extension String {
    
    /**
     Returns encoded string by removing percent encoding.
     */
    public var URLDecodedString: String {
        return self.removingPercentEncoding!
    }
}

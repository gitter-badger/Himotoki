//
//  Decodable.swift
//  Himotoki
//
//  Created by Syo Ikeda on 5/2/15.
//  Copyright (c) 2015 Syo Ikeda. All rights reserved.
//

public protocol Decodable {
    typealias DecodedType = Self
    static func decode(e: Extractor) -> DecodedType?
}

public func decode<T: Decodable where T.DecodedType == T>(object: AnyObject) -> T? {
    let extractor = Extractor(object)
    return T.decode(extractor)
}

extension String: Decodable {
    public static func decode(e: Extractor) -> String? {
        return e.rawValue as? String
    }
}

extension Int: Decodable {
    public static func decode(e: Extractor) -> Int? {
        return e.rawValue as? Int
    }
}

extension Int64: Decodable {
    public static func decode(e: Extractor) -> Int64? {
        if let value = e.rawValue as? NSNumber {
            return value.longLongValue
        } else {
            return nil
        }
    }
}

extension Double: Decodable {
    public static func decode(e: Extractor) -> Double? {
        return e.rawValue as? Double
    }
}

extension Float: Decodable {
    public static func decode(e: Extractor) -> Float? {
        return e.rawValue as? Float
    }
}

extension Bool: Decodable {
    public static func decode(e: Extractor) -> Bool? {
        return e.rawValue as? Bool
    }
}

extension NSNumber: Decodable {
    public static func decode(e: Extractor) -> NSNumber? {
        return e.rawValue as? NSNumber
    }
}

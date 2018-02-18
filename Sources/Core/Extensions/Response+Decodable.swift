//
//  Response+Decodable.swift
//  Moya-Decodable
//
//  Created by chanju Jeon on 2017. 6. 19..
//

import Foundation
import Moya

public extension Response {

    public func mapObject<T: Decodable>() throws -> T {
        guard let jsonDictionary = try mapJSON() as? NSDictionary else {
            throw MoyaError.jsonMapping(self)
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }

    public func mapObject<T: Decodable>(withKeyPath keyPath: String?) throws -> T {
        guard let keyPath = keyPath else {
            return try mapObject()
        }

        guard let jsonDictionary = try mapJSON() as? NSDictionary, let objectDictionary = jsonDictionary.value(forKeyPath: keyPath) as? NSDictionary else {
            throw MoyaError.jsonMapping(self)
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: objectDictionary, options: .prettyPrinted)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }

    public func mapArray<T: Decodable>() throws -> [T] {
        guard let jsonArray = try mapJSON() as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }

    public func mapArray<T: Decodable>(withKeyPath keyPath: String?) throws -> [T] {
        guard let keyPath = keyPath else {
            return try mapArray()
        }

        guard let jsonDictionary = try mapJSON() as? NSDictionary, let objectArray = jsonDictionary.value(forKeyPath: keyPath) as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: objectArray, options: .prettyPrinted)
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
}

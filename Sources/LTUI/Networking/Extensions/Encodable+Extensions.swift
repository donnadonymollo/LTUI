//
//  Encodable+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public extension Encodable {

    func jsonEncoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func json() -> [String: String] {
        do {
            let data = try self.jsonEncoded()
            let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: String]
            return dict ?? [:]
        } catch {
            return [:]
        }
    }

}

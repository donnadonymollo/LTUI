//
//  Data+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

extension Data {

    func jsonDecoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }

}

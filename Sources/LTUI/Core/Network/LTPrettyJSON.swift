//
//  LTPrettyJSON.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

final public class LTPrettyJSON {
    
    public static func prettyJson(from bodyData: Data) -> String? {
        guard
            let object = try? JSONSerialization.jsonObject(with: bodyData, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
            let string = String(data: data, encoding: .utf8)
        else { return nil }
        return string
    }
    
}


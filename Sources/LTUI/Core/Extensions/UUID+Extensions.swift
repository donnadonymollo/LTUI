//
//  UUID+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public extension UUID {
    
    static var randomUUIDString: String {
        UUID().uuidString.lowercased()
    }
    
}

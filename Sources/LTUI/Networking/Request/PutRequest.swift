//
//  PutRequest.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol PutRequest: EncodableRequest {}

public extension PutRequest {
    
    var method: HTTPMethod { .put }
    
}

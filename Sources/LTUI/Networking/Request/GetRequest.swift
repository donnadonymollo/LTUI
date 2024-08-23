//
//  GetRequest.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol GetRequest: DecodableRequest {}

public extension GetRequest {
    
    var method: HTTPMethod { .get }
    
}

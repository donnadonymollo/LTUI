//
//  DeleteRequest.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol DeleteRequest: EncodableRequest {}

public extension DeleteRequest {
    
    var method: HTTPMethod { .delete }
    
}

//
//  PostRequest.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol PostRequest: EncodableRequest {}

public extension PostRequest {
    
    var method: HTTPMethod { .post }
    
}

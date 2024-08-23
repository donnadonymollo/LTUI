//
//  EncodableRequestOperation.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

final class EncodableRequestOperation<Delegate: NetworkRequestManager, Request: EncodableRequest>: DecodableRequestOperation<Delegate, Request> {
    
    // MARK: - Functions
    
    override func createURLRequest() -> URLRequest {
        URLRequest(encodableRequest: request)
    }
    
}

//
//  DecodableRequestOperation.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

class DecodableRequestOperation<Delegate: NetworkRequestManager, Request: DecodableRequest>: RequestOperation<Delegate, Request> {
    
    // MARK: - Functions
    
    override func processSuccess(data: Data) {
        do {
            let response: Request.Response = try data.jsonDecoded()
            self.completion(.success((response, data)))
        } catch let error {
            #if DEBUG
            print("decode error: \(error)")
            #endif
            self.completion(.failure(.decodeError))
        }
    }
    
}

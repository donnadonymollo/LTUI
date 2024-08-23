//
//  BaseRequest.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol BaseRequest {
    
    associatedtype Response
    
    var baseURL: String { get }
    var service: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var baseHeaders: [String: String] { get }
    var timeoutInterval: Double? { get }
    var parameters: [String: String] { get }
    
}

public extension BaseRequest {
    
    var timeoutInterval: Double? { nil }
    
    var parameters: [String: String] { [:] }
    
}

public protocol DecodableRequest: BaseRequest where Response: Decodable {}

public protocol EncodableRequest: DecodableRequest {
    
    associatedtype Body: Encodable
    
    var body: Body { get }
    
}

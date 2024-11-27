//
//  LTPostRequest.swift
//  LTUI
//
//  Created by Donnadony Mollo Quicaño on 27/11/24.
//

public protocol LTDecodableRequest: DecodableRequest, LTHeadersMapper where Response == InternalResponse {
    
    associatedtype InternalResponse: Decodable
    
    var shouldDelegateManageExpireSession: Bool { get }
    
}

public extension LTDecodableRequest {
    
    var timeoutInterval: Double? { 30 }
    
    var shouldDelegateManageExpireSession: Bool { false }
    
}

public protocol LTEncodableRequest: EncodableRequest, LTHeadersMapper where Response == InternalResponse {
    
    associatedtype InternalResponse: Decodable
    
    var shouldDelegateManageExpireSession: Bool { get }
    
}

public extension LTEncodableRequest {
    
    var timeoutInterval: Double? { 30 }
    
    var shouldDelegateManageExpireSession: Bool { false }
    
}

public protocol LTPostRequest: LTEncodableRequest, PostRequest {}

public protocol LTPutRequest: LTEncodableRequest, PutRequest {}

public protocol LTDeleteRequest: LTEncodableRequest, DeleteRequest {}

public protocol LTGetRequest: LTEncodableRequest, GetRequest {}

//
//  LTResponse.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public struct LTResponse<T: Decodable>: Decodable {
    
    public let code: String
    public let info: T?
    public let message: String?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "codRpta"
        case info = "detRpta"
        case message = "desRpta"
    }
    
    public init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: CodingKeys.self)
        code = try root.decode(String.self, forKey: .code)
        message = try root.decodeIfPresent(String.self, forKey: .message)
        if T.self is LTEmptyResponse.Type {
            info = LTEmptyResponse() as? T
        } else {
            info = try root.decodeIfPresent(T.self, forKey: .info)
        }
    }
    
}

// MARK: - IBKApiResult

public extension LTResponse {
    
    var apiResult: LTApiResult<T> {
        guard let codeInt = Int(code) else {
            return .failure(error: .serverError(code: code, message: message.orEmpty()))
        }
        switch codeInt {
        case 0:
            guard let info = info else {
                return .failure(error: .serverError(code: code, message: message.orEmpty()))
            }
            return .success(response: info)
        case 7000, 7001:
            return .failure(error: .timeoutSession(code: codeInt, message: message.orEmpty()))
        default:
            return .failure(error: .serverError(code: code, message: message.orEmpty()))
        }
    }
    
}


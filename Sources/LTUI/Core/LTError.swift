//
//  LTError.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public enum LTError: Error, Equatable {
    
    case serverError(code: String, message: String)
    case connectionError
    case timeoutSession(code: Int, message: String)
    case jarvisServerError(code: String, message: String)
    case genericError(httpCode: Int? = nil)
    
    public var message: String {
        switch self {
        case .serverError(_, let message):
            return message
        case .connectionError:
            return "Ocurrió un problema al conectarse con Interbank. Por favor, inténtalo nuevamente."
        case .timeoutSession(_, let message):
            return message
        case .jarvisServerError(_, let message):
            return message
        case .genericError:
            return "No hemos podido realizar tu operación. Estamos trabajando para solucionar el inconveniente."
        }
    }
    
    public var code: String {
        switch self {
        case .serverError(let code, _):
            return code
        case .connectionError:
            return "500"
        case .timeoutSession(let code, _):
            return "\(code)"
        case .jarvisServerError(let code, _):
            return "\(code)"
        case .genericError:
            return "9999"
        }
    }
    
    public var responseCode: String {
        switch self {
        case .serverError(let code, _):
            return code
        case .connectionError:
            return "CE01"
        case .timeoutSession(let code, _):
            return "\(code)"
        case .jarvisServerError(let code, _):
            return "\(code)"
        case .genericError:
            return "9999"
        }
    }
    
    public var httpCode: Int? {
        switch self {
        case .genericError(let httpCode):
            return httpCode
        case .jarvisServerError:
            return 209
        default:
            return nil
        }
    }
    
    public static func == (lhs: LTError, rhs: LTError) -> Bool {
        switch (lhs, rhs) {
        case (serverError (_, _), serverError (_, _)):
            return true
        case (connectionError, connectionError):
            return true
        case (timeoutSession (_, _), timeoutSession (_, _)):
            return true
        default:
            return false
        }
    }
}


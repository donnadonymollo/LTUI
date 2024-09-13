//
//  LTLogs.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public class LTLogs {
    
    // MARK: - Properties
    
    public static let shared = LTLogs()
    
    public var arrayLogs: [LTLogItem] = []
    
    // MARK: - Functions
    
    public func addRequest(_ urlRequest: URLRequest) {
        let headersString: String
        if let headersList = urlRequest.allHTTPHeaderFields {
            headersString = headersList.map({ "\($0): \($1)" }).joined(separator: "\n")
        } else {
            headersString = "No headers"
        }
        let bodyString: String
        if let bodyData = urlRequest.httpBody, let prettyJson = LTPrettyJSON.prettyJson(from: bodyData) {
            bodyString = prettyJson
        } else {
            bodyString = "No body"
        }
        let logItem: LTLogItem = .init(
            url: urlRequest.url,
            type: .request,
            methodType: urlRequest.httpMethod ?? "No method",
            headers: headersString,
            body: bodyString
        )
        arrayLogs.append(logItem)
    }
    
    public func addRequest<Request: EncodableRequest>(_ request: Request) {
        let urlRequest = URLRequest(encodableRequest: request)
        addRequest(urlRequest)
    }
    
    public func addRequest<Request: BaseRequest>(_ request: Request) {
        let urlRequest = URLRequest(request)
        addRequest(urlRequest)
    }
    
    public func addResponse<Request: EncodableRequest>(with request: Request, body: Data?) {
        let urlRequest = URLRequest(encodableRequest: request)
        addResponse(with: urlRequest, body: body)
    }
    
    public func addResponse<Request: BaseRequest>(with request: Request, body: Data?) {
        let urlRequest = URLRequest(request)
        addResponse(with: urlRequest, body: body)
    }
    
    public func addResponse<Request: EncodableRequest>(with request: Request, error: RequestError) {
        let urlRequest = URLRequest(encodableRequest: request)
        addResponse(with: urlRequest, errorMessage: error.description)
    }
    
    public func addResponse<Request: BaseRequest>(with request: Request, error: RequestError) {
        let urlRequest = URLRequest(request)
        addResponse(with: urlRequest, errorMessage: error.description)
    }
    
    public func addResponse(with urlRequest: URLRequest, body: Data?) {
        let bodyString: String
        if let data = body, let prettyJson = LTPrettyJSON.prettyJson(from: data) {
            bodyString = prettyJson
        } else {
            bodyString = "No body"
        }
        let logItem: LTLogItem = .init(
            url: urlRequest.url,
            type: .response,
            methodType: urlRequest.httpMethod ?? "No method",
            headers: "No headers",
            body: bodyString
        )
        arrayLogs.append(logItem)
    }
    
    public func addResponse(with urlRequest: URLRequest, errorMessage: String) {
        let logItem: LTLogItem = .init(
            url: urlRequest.url,
            type: .response,
            methodType: urlRequest.httpMethod ?? "No method",
            headers: "No headers",
            body: errorMessage
        )
        arrayLogs.append(logItem)
    }
    
    public func clearAll() {
        arrayLogs.removeAll()
    }
    
    private func addResponseError(with urlRequest: URLRequest, error: RequestError) {
        let logItem: LTLogItem = .init(
            url: urlRequest.url,
            type: .response,
            methodType: urlRequest.httpMethod ?? "No method",
            headers: "No headers",
            body: error.description
        )
        arrayLogs.append(logItem)
    }
    
}

public struct LTLogItem {
    
    public let url: URL?
    public let type: LogType
    public let methodType: String
    public let headers: String
    public let body: String
    
}

public extension LTLogItem {
    
    enum LogType {
        
        case request
        case response
        
    }
    
}

private extension RequestError {
    
    var description: String {
        switch self {
        case .connectionError:
            return "Sin conexión a internet"
        case .noResponse:
            return "Sin respuesta"
        case .statusNoOk(let statusCode, _):
            return "Status code no OK: \(statusCode)"
        case .noContent:
            return "Sin contenido"
        case .decodeError:
            return "Error decodificando"
        case .savingFileError:
            return "Error guardando el archivo"
        }
    }
    
}


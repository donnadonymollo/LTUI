//
//  LTDataTaskValidator.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public class LTDataTaskValidator: DataTaskHeadersValidatorProtocol {
    
    // MARK: - Lifecycle
    
    public init() {}
    
    // MARK: - Functions
    
    public func dataTaskValidate(
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) -> URLSession.DataTaskResult {
        if error != nil {
            logResult(success: false, data: data, response: response, error: error)
            return .failure(error: .connectionError)
        }
        guard let response = response as? HTTPURLResponse else {
            logResult(success: false, data: data, response: response, error: error)
            return .failure(error: .noResponse)
        }
        guard response.statusCode == 200 else {
            logResult(success: false, data: data, response: response, error: error)
            return .failure(error: .statusNoOk(statusCode: response.statusCode, data: data))
        }
        guard let data = data else {
            logResult(success: false, data: data, response: response, error: error)
            return .failure(error: .noContent(statusCode: response.statusCode))
        }
        logResult(success: true, data: data, response: response, error: error)
        return .success(data: data)
    }
    
    public func printLogs(request: URLRequest, data: Data?) {
        #if DEBUG
        LTLogs.shared.addResponse(with: request, body: data)
        #endif
    }
    
    fileprivate func logResult(
        success: Bool,
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) {
        #if DEBUG
        var responseUrl = "Undefined"
        if let response = response?.url {
            responseUrl = String(describing: response)
        }
        let dateFormat = DateFormatter()
        dateFormat.locale = .current
        dateFormat.dateFormat = "MM-dd-yyyy h:mm:ss a Z"
        let date = dateFormat.string(from: Date())
        if
            let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted, .withoutEscapingSlashes])
        {
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            if let httpResponse = response as? HTTPURLResponse {
                print("""
              \(success ? "🟢":"🔴") Date: \(date)
              \(success ? "🟢":"🔴") Url: \(responseUrl)
              \(success ? "🟢":"🔴") StatusCode: \(httpResponse.statusCode)
              \(success ? "🟢":"🔴") Response: \(jsonString)
              \(success ? "🟢":"🔴") Error: \(String(describing: error))
              """)
            }else{
                print("""
              \(success ? "🟢":"🔴") Date: \(date)
              \(success ? "🟢":"🔴") Url: \(responseUrl)
              \(success ? "🟢":"🔴") Response: \(jsonString)
              \(success ? "🟢":"🔴") Error: \(String(describing: error))
              """)
            }

        } else {
            if let httpResponse = response as? HTTPURLResponse {
                print("""
                  \(success ? "🟢":"🔴") Date: \(date)
                  \(success ? "🟢":"🔴") Url: \(responseUrl)
                  \(success ? "🟢":"🔴") StatusCode: \(httpResponse.statusCode)
                  \(success ? "🟢":"🔴") Response no data
                  \(success ? "🟢":"🔴") Error: \(String(describing: error))
                  """)
            }else{
                print("""
                  \(success ? "🟢":"🔴") Date: \(date)
                  \(success ? "🟢":"🔴") Url: \(responseUrl)
                  \(success ? "🟢":"🔴") Response no data
                  \(success ? "🟢":"🔴") Error: \(String(describing: error))
                  """)
            }
        }
        #endif
    }
    
}


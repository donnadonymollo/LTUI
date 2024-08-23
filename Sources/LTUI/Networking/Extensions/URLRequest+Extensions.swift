//
//  URLRequest+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public extension URLRequest {

    init<Request: BaseRequest>(_ request: Request) {
        let url = URL(request)
        self.init(url: url)
        httpMethod = request.method.rawValue
        let headers = Dictionary(uniqueKeysWithValues: request.baseHeaders.map { key, value in (key, value) })
        allHTTPHeaderFields = headers
        if let timeoutInterval = request.timeoutInterval {
            self.timeoutInterval = timeoutInterval
        }
        #if DEBUG
        var headerPrint = ""
        let dateFormat = DateFormatter()
        dateFormat.locale = .current
        dateFormat.dateFormat = "MM-dd-yyyy h:mm:ss a Z"
        let date = dateFormat.string(from: Date())
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: headers, options: [.prettyPrinted, .withoutEscapingSlashes])
            headerPrint = "\(String(data: jsonData, encoding: .utf8) ?? "{}")"
        } catch {
            headerPrint = "\(headers)"
        }
        print("""
        *NewRequest*
        🔵 Date: \(date)
        🔵 Url: \(url)
        🔵 HttpMethod: \(request.method.rawValue)
        🔵 AllHTTPHeaderFields:\(headerPrint)
        """)
        #endif
    }

    init<Request: EncodableRequest>(encodableRequest request: Request) {
        do {
            self.init(request)
            let data = try request.body.jsonEncoded()
            httpBody = data
            #if DEBUG
            let dateFormat = DateFormatter()
            dateFormat.locale = .current
            dateFormat.dateFormat = "MM-dd-yyyy h:mm:ss a Z"
            let date = dateFormat.string(from: Date())
            if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
               let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted, .withoutEscapingSlashes] ) {
                let jsonString = String(decoding: jsonData, as: UTF8.self)
                print("""
                🔵 Date: \(date)
                🔵 Url: \(String(describing: URL(request)))
                🔵 BodyRequest: \(jsonString)
                """)
            } else {
                let bodyString = String(data: data, encoding: .utf8) ?? ""
                print("""
                🔵 Date: \(date)
                🔵 Url: \(String(describing: URL(request)))
                🔵 BodyString: \(bodyString)
                """)
            }
            #endif
        } catch {
            fatalError("Encode failed")
        }
    }

}


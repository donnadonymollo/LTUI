//
//  URL+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public extension URL {

    init<Request: BaseRequest>(_ request: Request) {
        let allowedChars = CharacterSet.urlPathAllowed.union(.urlQueryAllowed)
        guard let encodedService = request.service.addingPercentEncoding(withAllowedCharacters: allowedChars) else {
            fatalError("Invalid service")
        }
        guard let encodedPath = request.path.addingPercentEncoding(withAllowedCharacters: allowedChars) else {
            fatalError("Invalid path")
        }
        let raw = request.baseURL + encodedService + encodedPath
        guard var urlComponents = URLComponents(string: raw) else {
            fatalError("Malformed url")
        }
        if !request.parameters.isEmpty {
            urlComponents.queryItems = request.parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents.url else {
            fatalError("Malformed url")
        }
        self = url
    }

}

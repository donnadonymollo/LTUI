//
//  URLSession+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

extension URLSession {
    
    func downloadTask(
        for request: URLRequest,
        _ completion: @escaping (DownloadTaskResult) -> Void
    ) -> URLSessionDownloadTask {
        let dataTask = self.downloadTask(with: request) { (url, response, error) in
            if error != nil {
                return completion(.failure(error: .connectionError))
            }
            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(error: .noResponse))
            }
            guard response.statusCode == 200 else {
                return completion(.failure(error: .statusNoOk(statusCode: response.statusCode, data: nil)))
            }
            guard let url = url else {
                return completion(.failure(error: .noContent(statusCode: response.statusCode)))
            }
            completion(.success(url: url))
        }
        return dataTask
    }
    
    func dataTask(
        for request: URLRequest,
        validator: DataTaskHeadersValidatorProtocol,
        metricsResponse: @escaping (Bool, Data?, URLResponse?, Error?) -> Void,
        completionDataTask: @escaping (DataTaskResult) -> Void,
        completionHeadersTask: @escaping ([String: Any]) -> Void
    ) -> URLSessionDataTask {
        var request = request
        if request.httpMethod == HTTPMethod.get.rawValue {
            request.httpBody = nil
        }
        let dataTask = self.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self else { return }
            completionHeadersTask(self.getResponseHeaders(from: response))
            validator.printLogs(request: request, data: data)
            let resultValidator = validator.dataTaskValidate(data: data, response: response, error: error)
            switch resultValidator {
            case .success(let sucessData):
                metricsResponse(true, data, response, error)
                completionDataTask(.success(data: sucessData))
            case .failure(let failureError):
                metricsResponse(false, data, response, error)
                completionDataTask(.failure(error: failureError))
            }
        }
        return dataTask
    }
    
    private func getResponseHeaders(from response: URLResponse?) -> [String: Any] {
        guard
            let httpUrlResponse = response as? HTTPURLResponse,
            let headers = httpUrlResponse.allHeaderFields as? [String: Any]
        else {
            return [:]
        }
        return headers
    }
    
}

public extension URLSession {

    enum DataTaskResult {

        case success(data: Data)
        case failure(error: RequestError)

    }
    
    enum DownloadTaskResult {

        case success(url: URL)
        case failure(error: RequestError)

    }
    
}

public protocol DataTaskHeadersValidatorProtocol: AnyObject {
    
    func dataTaskValidate(
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) -> URLSession.DataTaskResult
    func printLogs(request: URLRequest, data: Data?)
    
}

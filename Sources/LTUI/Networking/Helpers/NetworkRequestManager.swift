//
//  NetworkRequestManager.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol NetworkRequestManager: AnyObject {
    
    var requestQueue: OperationQueue { get }
    var urlSession: URLSession { get }
    
}

public extension NetworkRequestManager {
    
    func operation<AnyRequest: DecodableRequest>(
        for request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void
    ) -> Operation {
        DecodableRequestOperation(delegate: self, request: request, validator: validator, completion: completion)
    }
    
    func operation<AnyRequest: EncodableRequest>(
        for request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void
    ) -> Operation {
        EncodableRequestOperation(delegate: self, request: request, validator: validator, completion: completion)
    }
    
    func downloadOperation<AnyRequest: DownloadRequest>(
        for request: AnyRequest,
        fileName: String?,
        directory: FileManager.SearchPathDirectory? = nil,
        completion: @escaping (Result<AnyRequest.Response, RequestError>) -> Void
    ) -> Operation {
        DownloadOperation(
            delegate: self,
            request: request,
            fileName: fileName,
            directory: directory,
            completion: completion
        )
    }
    
    func load<AnyRequest: DecodableRequest>(
        _ request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void
    ) {
        requestQueue.addOperation(operation(for: request, validator: validator, completion: completion))
    }
    
    func load<AnyRequest: EncodableRequest>(
        _ request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void
    ) {
        requestQueue.addOperation(operation(for: request, validator: validator, completion: completion))
    }

    func load<AnyRequest: DownloadRequest>(
        _ request: AnyRequest,
        fileName: String?,
        directory: FileManager.SearchPathDirectory? = nil,
        completion: @escaping (Result<AnyRequest.Response, RequestError>) -> Void
    ) {
        requestQueue.addOperation(
            downloadOperation(
                for: request,
                fileName: fileName,
                directory: directory,
                completion: completion
            )
        )
    }
    
}

// MARK: - Jarvis

public extension NetworkRequestManager {
    
    func getMetricsOperation<AnyRequest: DecodableRequest>(
        for request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void,
        metricsCompletion: @escaping (Data?, URLResponse?, Error?) -> Void,
        headersCompletion: @escaping ([String:Any]) -> Void) -> Operation
    {
        DecodableRequestOperation(
            delegate: self,
            request: request,
            validator: validator,
            completion: completion,
            metricsCompletion: metricsCompletion,
            headersCompletion: headersCompletion
        )
    }
    
    func postMetricsOperation<AnyRequest: EncodableRequest>(
        for request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void,
        metricsCompletion: @escaping (Data?, URLResponse?, Error?) -> Void,
        headersCompletion: @escaping ([String: Any]) -> Void
    ) -> Operation {
        EncodableRequestOperation(
            delegate: self,
            request: request,
            validator: validator,
            completion: completion,
            metricsCompletion: metricsCompletion,
            headersCompletion: headersCompletion
        )
    }
    
    // MARK: - Metrics functions

    func metricsLoad<AnyRequest: EncodableRequest>(
        _ request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void,
        metricsCompletion: @escaping (Data?, URLResponse?, Error?) -> Void,
        headersCompletion: @escaping ([String: Any]) -> Void
    ) {
        requestQueue.addOperation(
            postMetricsOperation(
                for: request,
                validator: validator,
                completion: completion,
                metricsCompletion: metricsCompletion,
                headersCompletion: headersCompletion
            )
        )
    }

    func metricsGetLoad<AnyRequest: DecodableRequest>(
        _ request: AnyRequest,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(AnyRequest.Response, Data?), RequestError>) -> Void,
        metricsCompletion: @escaping (Data?, URLResponse?, Error?) -> Void,
        headersCompletion: @escaping ([String:Any]) -> Void
    ) {
        requestQueue.addOperation(
            getMetricsOperation(
                for: request,
                validator: validator,
                completion: completion,
                metricsCompletion: metricsCompletion,
                headersCompletion: headersCompletion
            )
        )
    }
    
}

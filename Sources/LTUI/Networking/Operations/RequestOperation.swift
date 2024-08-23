//
//  RequestOperation.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

class RequestOperation<Delegate: NetworkRequestManager, Request: BaseRequest>: AsyncOperation {
    
    // MARK: - Properties
    
    weak var delegate: Delegate?
    let request: Request
    let completion: (Result<(Request.Response, Data?), RequestError>) -> Void
    let metricsCompletion: ((Data?, URLResponse?, Error?) -> Void)?
    let headersCompletion: (([String:Any]) -> Void)?
    var dataTask: URLSessionDataTask?
    var validator: DataTaskHeadersValidatorProtocol
    
    // MARK: - Lifecycle
    
    init(
        delegate: Delegate,
        request: Request,
        validator: DataTaskHeadersValidatorProtocol,
        completion: @escaping (Result<(Request.Response, Data?), RequestError>) -> Void,
        metricsCompletion: ((Data?, URLResponse?, Error?) -> Void)? = nil,
        headersCompletion: (([String:Any]) -> Void)? = nil
    ) {
        self.delegate = delegate
        self.request = request
        self.completion = completion
        self.metricsCompletion = metricsCompletion
        self.validator = validator
        self.headersCompletion = headersCompletion
    }
    
    // MARK: - Functions

    override func main() {
        let urlRequest = createURLRequest()
        dataTask = delegate?.urlSession.dataTask(
            for: urlRequest,
            validator: validator,
            metricsResponse: { [weak self] (success, data, response, error) in
                self?.metricsCompletion?(
                    data,
                    response,
                    error
                )
            },
            completionDataTask: { [weak self] (dataTaskResult) in
                print("*NewResponse*")
                guard let self = self else { return }
                defer {
                    self.finish()
                }
                guard !self.isCancelled && !self.isFinished else { return }
                switch dataTaskResult {
                case .failure(let error):
                    self.completion(.failure(error))
                case .success(let data):
                    #if DEBUG
                    let responseString = String(data: data, encoding: .utf8) ?? ""
                    print("responseString: \(responseString)")
                    #endif
                    self.processSuccess(data: data)
                }
            },
            completionHeadersTask: {[weak self] (headers) in
                self?.headersCompletion?(headers)
            }
        )
        dataTask?.resume()
    }

    override func cancel() {
        super.cancel()
        dataTask?.cancel()
    }
    
    func processSuccess(data: Data) {
        fatalError("processSuccess should be override")
    }

    func createURLRequest() -> URLRequest {
        URLRequest(request)
    }
    
}

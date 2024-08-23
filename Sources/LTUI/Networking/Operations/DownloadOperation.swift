//
//  DownloadOperation.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

final class DownloadOperation<Delegate: NetworkRequestManager, Request: DownloadRequest>: AsyncOperation {
    
    // MARK: - Properties
    
    weak var delegate: Delegate?
    let request: Request
    let completion: (Result<Request.Response, RequestError>) -> Void
    let fileName: String?
    let directory: FileManager.SearchPathDirectory?
    var dataTask: URLSessionDownloadTask?
    
    // MARK: - Lifecycle

    init(
        delegate: Delegate,
        request: Request,
        fileName: String?,
        directory: FileManager.SearchPathDirectory? = nil,
        completion: @escaping (Result<Request.Response, RequestError>) -> Void
    ) {
        self.delegate = delegate
        self.request = request
        self.fileName = fileName
        self.directory = directory
        self.completion = completion
    }
    
    // MARK: - Functions

    override func main() {
        let urlRequest = createURLRequest()
        dataTask = delegate?.urlSession.downloadTask(for: urlRequest, { [weak self] (downloadTaskResult) in
            guard let self = self else { return }
            defer {
                self.finish()
            }
            guard !self.isCancelled && !self.isFinished else { return }
            switch downloadTaskResult {
            case .failure(let error):
                self.completion(.failure(error))
            case .success(let url):
                let fileName = self.fileName ?? url.lastPathComponent
                let filePath: String
                if let directory {
                    let basePath = FileManager.default.urls(for: directory, in: .userDomainMask).first?.path ?? NSTemporaryDirectory()
                    filePath = String(format: "%@/%@", basePath, fileName)
                } else {
                    filePath = String(format: "%@%@", NSTemporaryDirectory(), fileName)
                }
                let fileUrl = URL(fileURLWithPath: filePath)
                do {
                    if FileManager.default.fileExists(atPath: filePath) {
                        try FileManager.default.removeItem(atPath: filePath)
                    }
                    try FileManager.default.copyItem(at: url, to: fileUrl)
                    self.completion(.success(filePath))
                } catch {
                    self.completion(.failure(.savingFileError))
                }
            }
        })
        dataTask?.resume()
    }

    override func cancel() {
        super.cancel()
        dataTask?.cancel()
    }

    func createURLRequest() -> URLRequest {
        URLRequest(request)
    }
    
}

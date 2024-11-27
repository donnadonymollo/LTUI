//
//  LTNetworkApi.swift
//  LTUI
//
//  Created by Donnadony Mollo Quicaño on 27/11/24.
//

import Foundation

public protocol LTNetworkApi {
    
    func loadLTRequest<AnyRequest: LTEncodableRequest>(
        _ request: AnyRequest,
        completion: @escaping (LTApiResult<AnyRequest.InternalResponse>) -> Void
    )
    func loadLTRequest<AnyRequest: LTDecodableRequest>(
        _ request: AnyRequest,
        completion: @escaping (LTApiResult<AnyRequest.InternalResponse>) -> Void
    )
    func loadDownloadRequest<AnyRequest: DownloadRequest>(
        _ request: AnyRequest,
        fileName: String,
        directory: FileManager.SearchPathDirectory?,
        completion: ((LTApiResult<AnyRequest.Response>) -> Void)?
    ) -> Void
    func loadLTRequestAsync<AnyRequest: LTEncodableRequest>(_ request: AnyRequest) async -> LTApiResult<AnyRequest.InternalResponse>

}

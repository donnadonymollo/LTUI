//
//  DownloadRequest.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol DownloadRequest: BaseRequest where Response == String {}

public extension DownloadRequest {
    
    var baseHeaders: [String: String] { [:] }
    
    var method: HTTPMethod { .get }
    
}

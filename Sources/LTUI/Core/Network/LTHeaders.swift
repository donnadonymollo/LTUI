//
//  LTHeaders.swift
//  LTUI
//
//  Created by Donnadony Mollo Quicaño on 27/11/24.
//

import UIKit

public protocol LTHeadersMapper {
    
    var headers: [HeaderKey: String] { get }
    
}

public extension LTHeadersMapper {
    
    var baseHeaders: [String: String] {
        var finalHeaders: [String: String] = [:]
        for (key, value) in headers {
            finalHeaders[key.rawValue] = value
        }
        return finalHeaders
    }
    
}


public class LTHeaders {
    
    public enum HeadersType {
        
        case agent
        case device
        case agentDevice
        
    }
    
    private static var userAgent: String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        return String(
            format: "iOS:%@:%@:%@",
            UIDevice.current.systemVersion,
            Bundle.main.bundleIdentifier ?? "",
            appVersion
        )
    }
    
}

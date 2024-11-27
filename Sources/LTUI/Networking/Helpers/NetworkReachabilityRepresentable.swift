//
//  NetworkReachability.swift
//  LTUI
//
//  Created by Donnadony Mollo Quicaño on 27/11/24.
//

import Network

public protocol NetworkReachabilityRepresentable {
    
    var isConnected: Bool { get }
    
}

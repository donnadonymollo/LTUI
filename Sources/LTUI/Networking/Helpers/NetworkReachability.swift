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

final public class NetworkReachability: NetworkReachabilityRepresentable {
    
    public static let shared = NetworkReachability()
    
    private let monitor = NWPathMonitor()
    private var isMonitoring = false
    
    public var isConnected: Bool { monitor.currentPath.status == .satisfied }
    public var didChangeStatus: ((Bool) -> Void)?
    
    private init() { }
    
    public func startMonitoring() {
        if isMonitoring { return }
        isMonitoring = true
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.didChangeStatus?(path.status == .satisfied)
        }
    }
    
    func stopMonitoring() {
        if isMonitoring {
            monitor.cancel()
            isMonitoring = false
        }
    }
    
}

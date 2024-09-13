//
//  AsyncOperation.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

class AsyncOperation: Operation {
    
    // MARK: - Properties
    
    private let stateQueue = DispatchQueue(label: (Bundle.main.bundleIdentifier ?? "") + ".rw.state", attributes: .concurrent)
    private var _state: OperationState = .ready
    
    // MARK: - Properties with Observers
    
    @objc dynamic var state: OperationState {
        get {
            stateQueue.sync { _state }
        }
        set {
            stateQueue.sync(flags: .barrier, execute: { _state = newValue })
        }
    }
    
    // MARK: - Computed properties
    
    override var isReady: Bool { super.isReady && state == .ready }
    
    override var isExecuting: Bool { state == .executing }
    
    override var isFinished: Bool { state == .finished }
    
    override var isAsynchronous: Bool { true }
    
    // MARK: - Functions
    
    override class func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        if ["isReady", "isExecuting", "isFinished"].contains(key) {
            return [#keyPath(state)]
        }
        return super.keyPathsForValuesAffectingValue(forKey: key)
    }
    
    override func start() {
        guard !isCancelled && !isFinished else {
            state = .finished
            return
        }
        state = .executing
        main()
    }
    
    override func cancel() {
        state = .finished
    }
    
    func finish() {
        guard !isFinished else { return }
        state = .finished
    }
    
}

// MARK: - OperationState

extension AsyncOperation {
    
    @objc enum OperationState: Int {
        
        case ready
        case executing
        case finished
        
    }
    
}

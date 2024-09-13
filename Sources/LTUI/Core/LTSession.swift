//
//  LTSession.swift
//
//
//  Created by Mollo Quicaño Donnadony on 12/09/24.
//

import Foundation

open class LTSession {
    
    // MARK: - Properties
    
    public static var shared = LTSession()
    
    public var user: LTUser = .init()
    
    // MARK: - Funciones
    
    public func clearSession() {
        user = .init()
    }
    
    public func setUser(with user: LTUser) {
        self.user = user
    }
    
}

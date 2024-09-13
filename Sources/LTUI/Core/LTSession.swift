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
    
    open var user: LTUser = .init()
    
    // MARK: - Funciones
    
    open func clearSession() {
        user = .init()
    }
    
    open func setUser(with user: LTUser) {
        self.user = user
    }
    
}

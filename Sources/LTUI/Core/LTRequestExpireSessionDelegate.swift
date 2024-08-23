//
//  LTRequestExpireSessionDelegate.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public protocol LTRequestExpireSessionDelegate: AnyObject {
    
    func didExpireSession(with message: String)
    
}


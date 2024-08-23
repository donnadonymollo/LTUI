//
//  LTApiResult.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public enum LTApiResult<T: Decodable> {
    
    case success(response: T)
    case failure(error: LTError)
    
}

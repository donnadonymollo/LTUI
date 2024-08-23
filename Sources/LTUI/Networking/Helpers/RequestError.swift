//
//  RequestError.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public enum RequestError: Error {
    
    case connectionError
    case noResponse // HttpResponse null
    case noContent(statusCode: Int)
    case decodeError
    case savingFileError
    case statusNoOk(statusCode: Int, data: Data?)
    
}

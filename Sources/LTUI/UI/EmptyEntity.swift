//
//  EmptyEntity.swift
//  LTUI
//
//  Created by Donnadony Mollo on 16/02/26.
//

public protocol EmptyResponse {
    /// Empty value for the conforming type.
    ///
    /// - Returns: Value of `Self` to use for empty values.
    static func emptyValue() -> Self
}

// MARK: - EmptyEntity

public struct EmptyEntity: Codable, EmptyResponse {

    // MARK: - Lifecycle

    public init() {}

    // MARK: - Functions

    public static func emptyValue() -> EmptyEntity {
        return EmptyEntity.init()
    }

}

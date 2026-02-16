//
//  UIScreenStateProtocol.swift
//  LTUI
//
//  Created by Donnadony Mollo on 16/02/26.
//

public protocol UIScreenStateProtocol {

    associatedtype M

    // MARK: - Properties

    /// BusinessError needs to be manage inside the protocol implementation on each screen state

    ///This case conform a .Init or .Loading
    static var loading: Self { get }

    /// Success event that conform .Loaded(.Success(let data)) from Resource
    /// - Parameter _:  UIModel
    static func success(_: M) -> Self

    /// Success event that conform .Loaded(.Empty) from Resource
    static var empty: Self { get }

    ///This case conform a ConnectionError o NoNetworkError from ErrorEntity
    /// - Parameter _:  Error message
    /// - Returns:UIScreenStateProtocol
    static var noNetworkError: Self { get }

    ///This case conform a ApiError
    /// - Parameter _:  Error message
    /// - Returns:UIScreenStateProtocol
    static var genericError: Self { get }

}

//
//  BottomSheetState.swift
//  LTUI
//
//  Created by Donnadony Mollo on 16/02/26.
//

import Foundation

public struct BottomSheetState {

    // MARK: - Properties

    public var isShowing: Bool
    public var autoClose: Bool

    // MARK: - Lifecycle

    public init(
        isShowing: Bool = false,
        autoClose: Bool = true
    ) {
        self.isShowing = isShowing
        self.autoClose = autoClose
    }

}

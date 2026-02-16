//
//  ModalBottomSheet.swift
//  LTUI
//
//  Created by Donnadony Mollo on 16/02/26.
//

import Foundation
import SwiftUI

public struct ModalBottomSheet<Content: View>: View {

    // MARK: - Properties

    @Binding var state: BottomSheetState
    public let content: Content
    public let height: CGFloat

    // MARK: - Lifecycle

    public init(
        state: Binding<BottomSheetState>,
        height: CGFloat = 535,
        @ViewBuilder content: () -> Content
    ) {
        self._state = state
        self.height = height
        self.content = content()
    }

    public var body: some View {
        BottomSheet(
            isShowing: $state.isShowing,
            height: self.height
        ) {
            content
        }
        .background(Color.clear)
        .padding([.bottom], 0.1)
    }
    
}

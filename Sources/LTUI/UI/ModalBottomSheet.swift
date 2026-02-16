//
//  ModalBottomSheet.swift
//  LTUI
//
//  Created by Donnadony Mollo on 16/02/26.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
struct ModalBottomSheet<Content: View>: View {

    // MARK: - Properties

    @Binding var state: BottomSheetState
    let content: Content
    let height: CGFloat

    // MARK: - Lifecycle

    init(
        state: Binding<BottomSheetState>,
        height: CGFloat = 535,
        @ViewBuilder content: () -> Content
    ) {
        self._state = state
        self.height = height
        self.content = content()
    }

    var body: some View {
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

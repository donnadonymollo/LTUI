//
//  BottomSheet.swift
//  LTUI
//
//  Created by Donnadony Mollo on 16/02/26.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
struct BottomSheet<Content:View>: View {

    // MARK: - Properties

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isShowing: Bool
    
    private let autoClose: Bool
    private let content: Content
    private let height: CGFloat
    // MARK: - Lifecycle

    init(
        isShowing: Binding<Bool>,
        autoClose: Bool = true,
        height: CGFloat,
        @ViewBuilder content: () -> Content
    ) {
        self._isShowing = isShowing
        self.autoClose = autoClose
        self.height = height
        self.content = content()
    }

    // MARK: - Body

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GeometryReader { _ in
                EmptyView()
            }
            VStack {
                content
            }
            .frame(alignment: .bottom)
            .background(
                RoundedCornersShape(corners: [.topLeft, .topRight], radius: 20)
                    .fill(Color(.white))
            )
        }
        .ignoresSafeArea()
        .background(
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .opacity(isShowing ? 1 : 0)
                .onTapGesture(perform: {
                    withAnimation {
                        if autoClose {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                })
        )
        .onChange(of: isShowing) { _ in
            if !isShowing {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

@available(iOS 14.0, *)
struct RoundedCornersShape: Shape {

    // MARK: - Properties

    let corners: UIRectCorner
    let radius: CGFloat

    // MARK: - Functions

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )
        return Path(path.cgPath)
    }

}

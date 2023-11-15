//
//  YDSBottomSheet.swift
//  YDS-SwiftUI
//
//  Created by 정지혁 on 2023/10/31.
//

import SwiftUI

struct YDSBottomSheet<ViewType>: ViewModifier where ViewType: View {
    @Binding var isPresent: Bool

    @State var offset: CGFloat = .zero

    let content: () -> ViewType

    func body(content: Content) -> some View {
        ZStack {
            content

            ZStack(alignment: .bottom) {
                if isPresent {
                    YDSColor.dimNormal
                        .onTapGesture {
                            isPresent = false
                        }
                    self.content()
                        .padding(.bottom, 40)
                        .frame(maxWidth: .infinity, minHeight: 88)
                        .background(
                            YDSColor.bgNormal
                        )
                        .cornerRadius(YDSConstant.Rounding.r8)
                        .transition(.move(edge: .bottom))
                        .offset(y: offset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation {
                                        offset = value.translation.height > 0 ? value.translation.height : offset
                                    }
                                }
                                .onEnded { _ in
                                    if offset > 40 {
                                        isPresent = false
                                        offset = .zero
                                    } else {
                                        offset = .zero
                                    }
                                }
                        )
                }
            }
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 0.3), value: isPresent)
        }
    }
}

extension View {
    public func ydsBottomSheet(
        isPresent: Binding<Bool>,
        content: @escaping () -> some View
    ) -> some View {
        self
            .modifier(
                YDSBottomSheet(
                    isPresent: isPresent,
                    content: {
                        content()
                    }
                )
            )
    }
}

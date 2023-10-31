//
//  YDSBottomSheet.swift
//  YDS-SwiftUI
//
//  Created by 정지혁 on 2023/10/31.
//

import SwiftUI

struct YDSBottomSheet: ViewModifier {
    @State var height = CGFloat.zero

    @Binding var isPresent: Bool

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresent) {
                Text("Hello")
                    .presentationDetents([.medium])
            }
    }
}

extension View {
    public func ydsBottomSheet(
        isPresent: Binding<Bool>
    ) -> some View {
        self
            .modifier(YDSBottomSheet(isPresent: isPresent))
    }
}

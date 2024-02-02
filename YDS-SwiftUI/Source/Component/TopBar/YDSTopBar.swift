//
//  YDSTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/28/23.
//

import SwiftUI

struct YDSTopBarModifier: ViewModifier {
    @Binding var isLeftButtonSelected: Bool
    @Binding var isRightButtonSelected: Bool
    @Binding public var topBar: YDSTopBar

    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement:
                        .topBarLeading) {
                            Button(action: {isLeftButtonSelected.toggle()}, label: {
                                isLeftButtonSelected ? YDSIcon.starFilled : YDSIcon.starLine
                            })
                }
                ToolbarItem(placement: .principal) {
                    Text(topBar.title)
                        .font(YDSFont.subtitle2)
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            Text(isRightButtonSelected ? "완료" : "편집")
                                .onTapGesture {
                                    isRightButtonSelected.toggle()
                                }
                        }
            }
    }
}

public struct YDSTopBar: Equatable {
    let title: String
}

extension View {
    // swiftlint:disable line_length
    public func ydsTopBar(_ title: Binding<String?>, isLeftButtonSelected: Binding<Bool>, isRightButtonSelected: Binding<Bool>) -> some View {
        let topBar = YDSTopBar(title: title.wrappedValue ?? "")
        let modifier = YDSTopBarModifier(
            isLeftButtonSelected: isLeftButtonSelected,
            isRightButtonSelected: isRightButtonSelected,
            topBar: .constant(topBar)
        )
        return self.modifier(modifier)
    }
    // swiftlint:enable line_length
}

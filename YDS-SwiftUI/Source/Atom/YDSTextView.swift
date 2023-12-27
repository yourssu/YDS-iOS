//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 12/26/23.
//

import SwiftUI

public struct YDSTextView: View {
    @Binding var text: String
    @State var size = CGSize(width: 0.0, height: 0.0)

    let textColor: Color
    let placeholderText: String?
    let placeholderTextColor: Color
    let style: String.SwiftUITypoStyle
    let multilineTextAlignment: TextAlignment
    let minHeight: CGFloat
    let maxHeight: CGFloat?

    public init(text: Binding<String>,
                textColor: Color = YDSColor.textPrimary,
                placeholderText: String? = "댓글을 입력해주세요.",
                placeholderTextColor: Color = YDSColor.textTertiary,
                style: String.SwiftUITypoStyle,
                multilineTextAlignment: TextAlignment = .leading,
                minHeight: CGFloat,
                maxHeight: CGFloat? = nil) {
        self._text = text
        self.textColor = textColor
        self.placeholderText = placeholderText
        self.placeholderTextColor = placeholderTextColor
        self.style = style
        self.multilineTextAlignment = multilineTextAlignment
        self.minHeight = minHeight
        self.maxHeight = maxHeight
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .foregroundColor(textColor)
                .font(style.font)
                .multilineTextAlignment(multilineTextAlignment)
                .frame(minHeight: minHeight, maxHeight: maxHeight)
                .fixedSize(horizontal: false, vertical: true)

            if text.isEmpty {
                Text(placeholderText ?? "")
                    .foregroundColor(placeholderTextColor)
                    .font(style.font)
                    .allowsHitTesting(false)
                    .padding(.top, 7)
                    .padding(.leading, 5)
            }
        }
    }
}

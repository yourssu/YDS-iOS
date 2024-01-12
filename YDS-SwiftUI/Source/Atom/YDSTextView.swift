//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 12/26/23.
//

import SwiftUI

public struct YDSTextView: View {
    @Binding var text: String

    let textColor: Color
    let placeholderText: String?
    let placeholderTextColor: Color
    let typoStyle: String.SwiftUITypoStyle
    let multilineTextAlignment: TextAlignment
    let maxHeight: CGFloat?

    public init(text: Binding<String>,
                textColor: Color = YDSColor.textPrimary,
                placeholderText: String? = nil,
                placeholderTextColor: Color = YDSColor.textTertiary,
                typoStyle: String.SwiftUITypoStyle = .body1,
                multilineTextAlignment: TextAlignment = .leading,
                maxHeight: CGFloat? = nil
                ) {
        self._text = text
        self.textColor = textColor
        self.placeholderText = placeholderText
        self.placeholderTextColor = placeholderTextColor
        self.typoStyle = typoStyle
        self.multilineTextAlignment = multilineTextAlignment
        self.maxHeight = maxHeight
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            TextEditor(text: $text)
                .foregroundColor(textColor)
                .font(typoStyle.font)
                .multilineTextAlignment(multilineTextAlignment)
                .frame(minHeight: 35, maxHeight: maxHeight)
                .fixedSize(horizontal: false, vertical: true)

            if text.isEmpty {
                Text(placeholderText ?? "")
                    .foregroundColor(placeholderTextColor)
                    .font(typoStyle.font)
                    .allowsHitTesting(false)
                    .padding(.leading, 5)
            }
        }
    }
}

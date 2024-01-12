//
//  TextViewPageView.swift
//  YDS-Storybook
//
//  Created by 오동규 on 12/27/23.
//

import SwiftUI
import YDS_SwiftUI

struct TextViewPageView: View {
    let title: String = "TextView"

    @State var text: String = ""
    @State var textColorSelectedIndex: Int = 0
    @State var placeholderText: String? = "댓글을 입력해주세요."
    @State var placeholderTextColorSelectedIndex: Int = 2
    @State var multilineTextAlignmentSelectedIndex: Int = 0

    var selectedTextColor: Color {
        return YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color ?? YDSColor.textPrimary
    }

    var selectedPlaceholderTextColor: Color {
        return YDSSwiftUIColorWrapper.textColors.items[placeholderTextColorSelectedIndex].color ?? YDSColor.textTertiary
    }

    var selectedMultilineTextAlignment: TextAlignment {
        return TextAlignment.allCases[multilineTextAlignmentSelectedIndex]
    }

    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                Spacer()
                HStack {
                    YDSProfileImageView(image: Image("profileImageSample1"),
                                        size: .medium)
                    Spacer()
                    YDSTextView(
                        text: $text,
                        textColor: selectedTextColor,
                        placeholderText: placeholderText,
                        placeholderTextColor: selectedPlaceholderTextColor,
                        typoStyle: .body1,
                        multilineTextAlignment: selectedMultilineTextAlignment,
                        maxHeight: 150
                    )
                    .clipped()
                    Spacer()
                    YDSPlainButton(rightIcon: YDSIcon.penFilled,
                                   size: .medium)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
                Text("TextView.text.isEmpty")
                    .font(YDSFont.subtitle2)
                    .foregroundColor(YDSColor.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                Text(text.isEmpty ? "true" : "false")
                    .font(YDSFont.body2)
                    .foregroundColor(YDSColor.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
            }
            .padding(.bottom, 10)
            .background(YDSColor.inputFieldElevated)
        }, options: [
            Option.enum(
                description: "textColor",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $textColorSelectedIndex),
            Option.optionalString(
                description: "placeholderText",
                text: $placeholderText),
            Option.enum(
                description: "placeholderTextColor",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $placeholderTextColorSelectedIndex),
            Option.enum(
                description: "multilineTextAlignment",
                cases: TextAlignment.allCases,
                selectedIndex: $multilineTextAlignmentSelectedIndex)
        ])
    }
}

#Preview {
    TextViewPageView()
}

//
//  TextViewPageView.swift
//  YDS-Storybook
//
//  Created by 오동규 on 11/13/23.
//

import SwiftUI
import YDS_SwiftUI

@frozen public struct TextViewPageView: View {
    let title: String = "TextView"

    @State var text = ""
    @State var height: CGFloat = 0
    @State var styleSelectedIndex = 0
    @State var maxHeight: CGFloat = 150
    @State var textColorSelectedIndex: Int = 0
    @State var lineBreakModeSelectedIndex: Int = 0
    @State var lineBreakStrategySelectedIndex: Int = 2
    @State var placeholderColorSelectedIndex: Int = 2
    @State var placeholderText: String? = "댓글을 입력해주세요."

    @State var stateLabel: YDSLabel = YDSLabel(text: "true",
                                               typoStyle: .body2,
                                               textColor: YDSColor.textSecondary)

    var selectedStyle: Font {
        return Font(String.TypoStyle.allCases[styleSelectedIndex].font)
    }

    var selectedTextColor: Color {
        return YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color ?? YDSColor.textPrimary
    }

    var selectedPlaceholderColor: Color {
        return YDSSwiftUIColorWrapper.textColors.items[placeholderColorSelectedIndex].color ?? YDSColor.textTertiary
    }

    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                GeometryReader { geometry in
                    YDSTextView(text: $text,
                                height: $height,
                                style: YDSTextView.TypoStyle.allCases[styleSelectedIndex],
                                maxHeight: maxHeight,
                                maxWidth: geometry.size.width - 32,
                                textColor: selectedTextColor,
                                lineBreakMode: NSLineBreakMode.allCases[lineBreakModeSelectedIndex],
                                lineBreakStrategy:
                                    NSParagraphStyle.LineBreakStrategy.allCases[lineBreakStrategySelectedIndex],
                                placeholderColor: selectedPlaceholderColor,
                                placeholderText: placeholderText)
                    .frame(height: height)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 100)
                    .clipped()
                }
            }
        }, options: [
            Option.enum(
                description: "style",
                cases: String.TypoStyle.allCases,
                selectedIndex: $styleSelectedIndex),
            Option.enum(
                description: "textColor",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $textColorSelectedIndex),
            Option.enum(
                description: "lineBreakMode",
                cases: NSLineBreakMode.allCases,
                selectedIndex: $lineBreakModeSelectedIndex),
            Option.enum(
                description: "lineBreakStrategy",
                cases: NSParagraphStyle.LineBreakStrategy.allCases,
                selectedIndex: $lineBreakStrategySelectedIndex),
            Option.enum(
                description: "placeholderColor",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $placeholderColorSelectedIndex),
            Option.optionalString(
                description: "placeholderText", text: $placeholderText)
        ])
        .navigationTitle(title)
    }
}

#Preview {
    TextViewPageView()
}

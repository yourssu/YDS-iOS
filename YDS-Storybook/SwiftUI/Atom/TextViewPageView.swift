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
    @State var stateLabel: YDSLabel = YDSLabel(text: "true",
                                               typoStyle: .body2,
                                               textColor: YDSColor.textSecondary)
    @State var textColorSelectedIndex: Int = 0
    @State var lineBreakModeSelectedIndex: Int = 0
    @State var lineBreakStrategySelectedIndex: Int = 2
    @State var placeholderSelectedIndex: Int = 2

    var selectedTextColor: Color {
        return YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color ?? YDSColor.textPrimary
    }

    var selectedPlaceholder: Color {
        return YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color ?? YDSColor.textTertiary
    }

    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                GeometryReader { geometry in
                    YDSTextView(text: $text,
                                textColor: selectedTextColor,
                                lineBreakMode: NSLineBreakMode.allCases[lineBreakModeSelectedIndex],
                                lineBreakStrategy:
                                    NSParagraphStyle.LineBreakStrategy.allCases[lineBreakStrategySelectedIndex],
                                placeholderColor: selectedPlaceholder,
                    placeholderComment: "댓글을 입력ㅗㅗ해주세요.")
                    .frame(height: YDSScreenSize.width * 3/4 - 32)
//                    .frame(height: 20)
                    .padding(16)
                    .clipped()
                }
            }
        }, options: [
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
                description: "placeholder",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $placeholderSelectedIndex)
        ])
        .navigationTitle(title)
    }
}

#Preview {
    TextViewPageView()
}

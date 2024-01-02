//
//  LabelPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/09/11.
//

import SwiftUI
import YDS_SwiftUI

@frozen public struct LabelPageView: View {
    let title: String = "Label"

    @State var text: String? = "Label"
    @State var int: Int = 0
    @State var typoStyleSelectedIndex = 0
    @State var textColorSelectedIndex: Int = 0
    @State var lineBreakModeSelectedIndex: Int = 0
    @State var alignmentSelectedIndex: Int = 1
    @State var lineBreakStrategySelectedIndex: Int = 2

    var selectedColor: Color { return YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color
        ?? .black }
    var selectedTypoStyle: Font { return Font(String.TypoStyle.allCases[typoStyleSelectedIndex].font) }

    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                GeometryReader { geometry in
                    YDSLabel(
                        text: text ?? "",
                        typoStyle: YDSLabel.TypoStyle.allCases[typoStyleSelectedIndex],
                        textColor: selectedColor,
                        maxWidth: geometry.size.width - 32,
                        numberOfLines: int,
                        lineBreakMode: NSLineBreakMode.allCases[lineBreakModeSelectedIndex],
                        alignment: NSTextAlignment.allCases[alignmentSelectedIndex],
                        lineBreakStrategy: NSParagraphStyle.LineBreakStrategy.allCases[lineBreakStrategySelectedIndex]
                    )
                    .frame(height: YDSScreenSize.width * 3/4 - 32)
                    .padding(16)
                    .clipped()
                }
            }
        }, options: [
            Option.optionalString(
                description: "text",
                text: $text),
            Option.enum(
                description: "style",
                cases: String.TypoStyle.allCases,
                selectedIndex: $typoStyleSelectedIndex),
            Option.int(description: "numberOfLines", value: $int),
            Option.enum(
                description: "textColor",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $textColorSelectedIndex),
            Option.enum(
                description: "lineBreakMode",
                cases: NSLineBreakMode.allCases,
                selectedIndex: $lineBreakModeSelectedIndex),
            Option.enum(
                description: "alignment",
                cases: NSTextAlignment.allCases,
                selectedIndex: $alignmentSelectedIndex),
            Option.enum(
                description: "lineBreakStrategy",
                cases: NSParagraphStyle.LineBreakStrategy.allCases,
                selectedIndex: $lineBreakStrategySelectedIndex)
        ])
        .navigationTitle(title)
    }
}

struct LabelPageView_Previews: PreviewProvider {
    static var previews: some View {
        LabelPageView()
    }
}

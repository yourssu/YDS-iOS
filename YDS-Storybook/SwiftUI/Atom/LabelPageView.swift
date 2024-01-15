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
    @State var typoStyleSelectedIndex = 0
    @State var lineLimit: Int? = nil
    @State var textColorSelectedIndex: Int = 0
    @State var alignmentSelectedIndex: Int = 1
    @State var truncationModeSelectedIndex: Int = 2
    @State var isAllowsTightening: Bool = false

    var selectedTypoStyle: Font {
        return Font(String.TypoStyle.allCases[typoStyleSelectedIndex].font)
    }
    var selectedColor: Color {
        return YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color
        ?? .black
    }
    var selectedAlignment: TextAlignment {
        return TextAlignment.allCases[alignmentSelectedIndex]
    }
    var selectedTruncationMode: Text.TruncationMode {
        return Text.TruncationMode.allCases[truncationModeSelectedIndex]
    }

    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                YDSLabel(
                    text: text,
                    style: selectedTypoStyle,
                    lineLimit: lineLimit,
                    textColor: selectedColor,
                    alignment: selectedAlignment,
                    truncationMode: selectedTruncationMode,
                    allowsTightening: isAllowsTightening
                )
            }
        }, options: [
            Option.optionalString(
                description: "text",
                text: $text),
            Option.enum(
                description: "style",
                cases: String.TypoStyle.allCases,
                selectedIndex: $typoStyleSelectedIndex),
            Option.optionalInt(
                description: "lineLimit",
                value: $lineLimit),
            Option.enum(
                description: "textColor",
                cases: YDSSwiftUIColorWrapper.textColors.items,
                selectedIndex: $textColorSelectedIndex),
            Option.enum(
                description: "alignment",
                cases: TextAlignment.allCases,
                selectedIndex: $alignmentSelectedIndex),
            Option.enum(
                description: "truncationMode",
                cases: Text.TruncationMode.allCases,
                selectedIndex: $truncationModeSelectedIndex),
            Option.bool(
                description: "allowsTightening",
                isOn: $isAllowsTightening)
        ])
        .navigationTitle(title)
    }
}

#Preview {
    LabelPageView()
}

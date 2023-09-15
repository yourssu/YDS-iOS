//
//  LabelPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/09/11.
//
import SwiftUI
import YDS_SwiftUI

struct LabelPageView: View {
    let title: String = "Label"

    @State var typoStyleSelectedIndex: Int = 0
    @State var textColorSelectedIndex: Int = 0
    @State var truncationModeSelectedIndex: Int = 0

    @State var text: String? = "Label"
    @State var int: Int = 0
    @State var textColor: WrappedSwiftUIColor? = YDSSwiftUIColorWrapper.textColors.items[0]

    var body: some View {
        StorybookPageView(sample: {
            VStack {
                textColor?.color.map {
                    YDSLabelView(
                        text: Text(text ?? "")
                            .font(Font(String.TypoStyle.allCases[typoStyleSelectedIndex].font))
                            .foregroundColor($0)
                    )
                    .lineLimit(int == 0 ? nil : int)
                    .truncationMode(Text.TruncationMode.allCases[truncationModeSelectedIndex])
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
            Option.optionalTextColor(
                description: "textColor",
                textColor: YDSSwiftUIColorWrapper.textColors.items,
                selectedTextColor: $textColor),
            Option.enum(
                description: "truncationMode",
                cases: Text.TruncationMode.allCases,
                selectedIndex: $truncationModeSelectedIndex)
        ])
        .navigationTitle(title)
    }
}

extension Text.TruncationMode: CaseIterable {
    public static var allCases: [Text.TruncationMode] = [.head,
                                                           .tail,
                                                           .middle]
}

struct LabelPageView_Previews: PreviewProvider {
    static var previews: some View {
        LabelPageView()
    }
}

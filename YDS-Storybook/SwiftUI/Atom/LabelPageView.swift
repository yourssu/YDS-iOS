//
//  LabelPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/09/11.
//
import SwiftUI
import YDS_SwiftUI

struct YDSLabel: UIViewRepresentable {
    let text: String
    let typoStyle: UIFont
    let textColor: UIColor?

    var maxWidth: CGFloat

    let numberOfLines: Int
    let lineBreakMode: NSLineBreakMode
    let alignment: NSTextAlignment
    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = typoStyle
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.textAlignment = alignment
        label.lineBreakStrategy = lineBreakStrategy
        label.preferredMaxLayoutWidth = maxWidth

        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.font = typoStyle
        uiView.textColor = textColor
        uiView.numberOfLines = numberOfLines
        uiView.lineBreakMode = lineBreakMode
        uiView.textAlignment = alignment
        uiView.lineBreakStrategy = lineBreakStrategy
    }
}

struct LabelPageView: View {
    let title: String = "Label"

    @State var typoStyleSelectedIndex = 0
    @State var textColorSelectedIndex: Int = 0
    @State var lineBreakModeSelectedIndex: Int = 0
    @State var alignmentSelectedIndex: Int = 1
    @State var lineBreakStrategySelectedIndex: Int = 2

    @State var text: String? = "Label"
    @State var int: Int = 0

    var body: some View {
        StorybookPageView(sample: {
            VStack {
                GeometryReader { geometry in
                    let UITextColor = UIColor(YDSSwiftUIColorWrapper.textColors.items[textColorSelectedIndex].color ?? .black)
                    YDSLabel(
                        text: text ?? "",
                        typoStyle: String.TypoStyle.allCases[typoStyleSelectedIndex].font,
                        textColor: UITextColor,
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

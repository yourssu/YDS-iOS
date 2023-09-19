//
//  YDSLabel.swift
//  YDS-SwiftUI
//
//  Created by 박지윤 on 2023/09/11.
//
import SwiftUI
import YDS_Essential

public struct YDSLabel: UIViewRepresentable {
    let text: String
    let typoStyle: UIFont
    let textColor: UIColor?

    var maxWidth: CGFloat

    let numberOfLines: Int
    let lineBreakMode: NSLineBreakMode
    let alignment: NSTextAlignment
    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy

    public init(text: String,
                typoStyle: UIFont,
                textColor: UIColor?,
                maxWidth: CGFloat,
                numberOfLines: Int,
                lineBreakMode: NSLineBreakMode,
                alignment: NSTextAlignment,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) {
        self.text = text
        self.typoStyle = typoStyle
        self.textColor = textColor
        self.maxWidth = maxWidth
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.alignment = alignment
        self.lineBreakStrategy = lineBreakStrategy
    }

    public func makeUIView(context: Context) -> UILabel {
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

    public func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.font = typoStyle
        uiView.textColor = textColor
        uiView.numberOfLines = numberOfLines
        uiView.lineBreakMode = lineBreakMode
        uiView.textAlignment = alignment
        uiView.lineBreakStrategy = lineBreakStrategy
    }
}

//
//  YDSLabel.swift
//  YDS-SwiftUI
//
//  Created by 박지윤 on 2023/09/11.
//

import SwiftUI
import YDS_Essential

public struct YDSLabel: UIViewRepresentable {
    let text: String?
    let typoStyle: UIFont?
    let textColor: Color?
    let maxWidth: CGFloat?
    let numberOfLines: Int?
    let lineBreakMode: NSLineBreakMode?
    let alignment: NSTextAlignment?
    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy?

    public init(text: String,
                typoStyle: UIFont = UIFont.systemFont(ofSize: 17),
                textColor: Color = Color.black,
                maxWidth: CGFloat = .greatestFiniteMagnitude,
                numberOfLines: Int = 0,
                lineBreakMode: NSLineBreakMode = .byWordWrapping,
                alignment: NSTextAlignment = .center,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy = .hangulWordPriority) {
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
        label.textColor = UIColor(textColor ?? .black)
        label.numberOfLines = numberOfLines ?? 0
        label.lineBreakMode = lineBreakMode ?? .byWordWrapping
        label.textAlignment = alignment ?? .center
        label.lineBreakStrategy = lineBreakStrategy ?? .hangulWordPriority
        label.preferredMaxLayoutWidth = maxWidth ?? .greatestFiniteMagnitude

        return label
    }

    public func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.font = typoStyle
        uiView.textColor = UIColor(textColor ?? .black)
        uiView.numberOfLines = numberOfLines ?? 0
        uiView.lineBreakMode = lineBreakMode ?? .byWordWrapping
        uiView.textAlignment = alignment ?? .center
        uiView.lineBreakStrategy = lineBreakStrategy ?? .hangulWordPriority
    }
}

//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 11/3/23.
//

import SwiftUI
import UIKit
import SnapKit
import YDS_Essential

public struct YDSTextView: UIViewRepresentable {
    let text: String?
    let attributedText: NSAttributedString?
    let textColor: Color?
    let style: String.TypoStyle?
    let lineBreakMode: NSLineBreakMode?
    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy?
    let placeholder: String?
    let placeholderColor: Color?
    let placeholderLabel: YDSLabel?
    let maxHeight: CGFloat?

    public init(text: String,
                attributedText: NSAttributedString?,
                textColor: Color?,
                style: String.TypoStyle?,
                lineBreakMode: NSLineBreakMode?,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy?,
                placeholder: String?,
                placeholderColor: Color?,
                placeholderLabel: YDSLabel?,
                maxHeight: CGFloat?) {
        self.text = text
        self.attributedText = attributedText
        self.textColor = textColor
        self.style = style
        self.lineBreakMode = lineBreakMode
        self.lineBreakStrategy = lineBreakStrategy
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.placeholderLabel = placeholderLabel
        self.maxHeight = maxHeight
    }
}




#Preview {
    YDSTextView()
}

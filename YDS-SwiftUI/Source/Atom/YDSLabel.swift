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

    public enum LabelTypoStyle: CaseIterable {
        case display1
        case display2

        case title1
        case title2
        case title3

        case subtitle1
        case subtitle2
        case subtitle3

        case body1
        case body2

        case button0
        case button1
        case button2
        case button3
        case button4

        case caption0
        case caption1
        case caption2

        var uiFont: UIFont {
            switch self {
            case .display1:
                return UIFont.systemFont(ofSize: 40, weight: .bold )
            case .display2:
                return UIFont.systemFont(ofSize: 32, weight: .bold )
            case .title1:
                return UIFont.systemFont(ofSize: 28, weight: .bold )
            case .title2:
                return UIFont.systemFont(ofSize: 24, weight: .bold )
            case .title3:
                return UIFont.systemFont(ofSize: 20, weight: .bold )
            case .subtitle1:
                return UIFont.systemFont(ofSize: 20, weight: .semibold )
            case .subtitle2:
                return UIFont.systemFont(ofSize: 16, weight: .semibold )
            case .subtitle3:
                return UIFont.systemFont(ofSize: 14, weight: .semibold )
            case .body1:
                return UIFont.systemFont(ofSize: 15, weight: .regular )
            case .body2:
                return UIFont.systemFont(ofSize: 14, weight: .regular )
            case .button0:
                return UIFont.systemFont(ofSize: 16, weight: .medium )
            case .button1:
                return UIFont.systemFont(ofSize: 16, weight: .semibold )
            case .button2:
                return UIFont.systemFont(ofSize: 14, weight: .semibold )
            case .button3:
                return UIFont.systemFont(ofSize: 14, weight: .regular )
            case .button4:
                return UIFont.systemFont(ofSize: 12, weight: .medium )
            case .caption0:
                return UIFont.systemFont(ofSize: 12, weight: .semibold )
            case .caption1:
                return UIFont.systemFont(ofSize: 12, weight: .regular )
            case .caption2:
                return UIFont.systemFont(ofSize: 11, weight: .regular )
            }
        }
    }

    public init(text: String,
                typoStyle: LabelTypoStyle = .body1,
                textColor: Color = Color.black,
                maxWidth: CGFloat = .greatestFiniteMagnitude,
                numberOfLines: Int = 0,
                lineBreakMode: NSLineBreakMode = .byWordWrapping,
                alignment: NSTextAlignment = .center,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy = .hangulWordPriority) {
        self.text = text
        self.typoStyle = typoStyle.uiFont
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
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

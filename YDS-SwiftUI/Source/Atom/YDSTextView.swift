//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 11/3/23.
//

import SwiftUI
import YDS_Essential
import YDS
 import SnapKit

public struct YDSTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat

    var style: UIFont
    var maxHeight: CGFloat?
    var maxWidth: CGFloat
    var textColor: Color
    var lineBreakMode: NSLineBreakMode
    var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy
    var placeholderColor: Color
    var placeholderText: String?

    public enum TypoStyle: CaseIterable {
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

    public init(text: Binding<String>,
                height: Binding<CGFloat>,
                style: TypoStyle = .body1,
                maxHeight: CGFloat? = nil,
                maxWidth: CGFloat,
                textColor: Color = YDSColor.textPrimary,
                lineBreakMode: NSLineBreakMode = .byWordWrapping,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy = .hangulWordPriority,
                placeholderColor: Color = YDSColor.textTertiary,
                placeholderText: String? = "댓글을 입력해주세요.d") {
        self._text = text
        self._height = height
        self.style = style.uiFont
        self.maxHeight = maxHeight
        self.maxWidth = maxWidth
        self.textColor = textColor
        self.lineBreakMode = lineBreakMode
        self.lineBreakStrategy = lineBreakStrategy
        self.placeholderColor = placeholderColor
        self.placeholderText = placeholderText
    }

    public func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.textColor = UIColor(textColor)
        textView.font = style
        textView.textContainer.lineBreakMode = lineBreakMode
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.gray
        textView.textContainer.lineFragmentPadding = 0

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        textView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]

        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholderText
        placeholderLabel.textColor = UIColor(placeholderColor)
        placeholderLabel.font = style
        placeholderLabel.backgroundColor = .clear

        textView.snp.makeConstraints {
            $0.width.equalTo(maxWidth)
        }

        textView.addSubview(placeholderLabel)
            placeholderLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.left.equalToSuperview()
            }
        context.coordinator.placeholderLabel = placeholderLabel

        self.height = textView.frame.height
//        self.height = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: .infinity)).height

        return textView
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textColor = UIColor(textColor)
        uiView.font = style
        uiView.textContainer.lineBreakMode = lineBreakMode
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        uiView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]

        context.coordinator.placeholderLabel?.text = placeholderText
        context.coordinator.placeholderLabel?.textColor = UIColor(placeholderColor)
        context.coordinator.placeholderLabel?.font = style
        context.coordinator.placeholderLabel?.isHidden = !uiView.text.isEmpty

        DispatchQueue.main.async {
            self.height = uiView.sizeThatFits(CGSize(width: uiView.bounds.width, height: .infinity)).height
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject, UITextViewDelegate {
        var parent: YDSTextView
        var placeholderLabel: UILabel?

        init(_ parent: YDSTextView) {
            self.parent = parent
        }

        public func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text

            DispatchQueue.main.async {
                self.parent.height = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: .infinity)).height
            }
        }
    }
}

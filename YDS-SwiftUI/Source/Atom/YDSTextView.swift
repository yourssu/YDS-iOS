//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 11/3/23.
//

import SwiftUI
import YDS_Essential

public struct YDSTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat

    let placeholderLabel: UILabel
    let textColor: Color
    let lineBreakMode: NSLineBreakMode
    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy
    let placeholderColor: Color
    let placeholderComment: String?

    public init(text: Binding<String>,
                height: Binding<CGFloat>,
                textColor: Color = YDSColor.textPrimary,
                lineBreakMode: NSLineBreakMode = .byWordWrapping,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy = .hangulWordPriority,
                placeholderColor: Color = YDSColor.textTertiary,
                placeholderComment: String? = "댓글을 입력해주세요.") {
        self._text = text
        self._height = height
        self.textColor = textColor
        self.lineBreakMode = lineBreakMode
        self.lineBreakStrategy = lineBreakStrategy
        self.placeholderColor = placeholderColor
        self.placeholderComment = placeholderComment
        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholderComment
        placeholderLabel.textColor = UIColor(placeholderColor)
        self.placeholderLabel = placeholderLabel
    }

    public func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.textColor = UIColor(textColor)
        textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.textContainer.lineBreakMode = lineBreakMode
        textView.isScrollEnabled = false

        self.height = placeholderLabel.frame.height

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        textView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        textView.addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false

        // 긴급추가
//        placeholderLabel.text = placeholderComment
//        placeholderLabel.textColor = UIColor(placeholderColor)
        // 여기까지

        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 8),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -5),
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            placeholderLabel.bottomAnchor.constraint(lessThanOrEqualTo: textView.bottomAnchor, constant: -8)
        ])
        return textView
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textColor = UIColor(textColor)
        uiView.font = UIFont.systemFont(ofSize: 17.0)
        uiView.textContainer.lineBreakMode = lineBreakMode
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        uiView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        placeholderLabel.isHidden = !uiView.text.isEmpty

        DispatchQueue.main.async {
//            self.height = max(uiView.contentSize.height, self.height)
//            self.height = uiView.contentSize.height
            self.height = uiView.sizeThatFits(CGSize(width: uiView.bounds.width, height: .infinity)).height
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject, UITextViewDelegate {
        var parent: YDSTextView

        init(_ parent: YDSTextView) {
            self.parent = parent
        }

        public func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
            self.parent.placeholderLabel.isHidden = !textView.text.isEmpty
//            self.parent.height = max(textView.contentSize.height, self.parent.height)
//            self.parent.height = textView.contentSize.height
            DispatchQueue.main.async {
                            self.parent.height = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: .infinity)).height
            }
        }
    }
}

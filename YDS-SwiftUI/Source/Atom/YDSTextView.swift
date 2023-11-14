//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 11/3/23.
//

import SwiftUI
import YDS_Essential

//public struct YDSTextView: UIViewRepresentable {
//    @Binding var text: String
//    let placeholderComment: String
//    let textColor: Color
//    let lineBreakMode: NSLineBreakMode
//    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy
//    let placeholderColor: Color
//
//    public init(text: Binding<String>,
//                placeholderComment: String = "댓글을 입력해주세요.",
//                textColor: Color = YDSColor.textPrimary,
//                lineBreakMode: NSLineBreakMode = .byWordWrapping,
//                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy = .hangulWordPriority,
//                placeholderColor: Color = YDSColor.textTertiary) {
//        self._text = text
//        self.placeholderComment = placeholderComment
//        self.textColor = textColor
//        self.lineBreakMode = lineBreakMode
//        self.lineBreakStrategy = lineBreakStrategy
//        self.placeholderColor = placeholderColor
//    }
//
//    public func makeUIView(context: Context) -> UITextView {
//        let textView = UITextView()
//        textView.delegate = context.coordinator
//        textView.textColor = UIColor(textColor)
//        textView.textContainer.lineBreakMode = lineBreakMode
//        textView.textContainer.lineFragmentPadding = 0 // default : 5.0
//        textView.textContainerInset = .zero  //default : (8, 0, 8, 0)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineBreakStrategy = lineBreakStrategy
//        textView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
//        return textView
//    }
//
//    public func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//        uiView.textColor = UIColor(textColor)
//        uiView.textContainer.lineBreakMode = lineBreakMode
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineBreakStrategy = lineBreakStrategy
//        uiView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
//        if uiView.text.isEmpty {
//            uiView.text = placeholderComment
//            uiView.textColor = UIColor(placeholderColor)
//        } else if uiView.textColor == UIColor(placeholderColor) && !uiView.text.isEmpty {
//            uiView.textColor = UIColor(textColor)
//        }
//    }
//
//    public func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    public class Coordinator: NSObject, UITextViewDelegate {
//        var parent: YDSTextView
//
//        init(_ parent: YDSTextView) {
//            self.parent = parent
//        }
//
//        public func textViewDidBeginEditing(_ textView: UITextView) {
//            if textView.textColor == UIColor(parent.placeholderColor) {
//                    textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//                }
//                textView.isSelectable = true
//        }
//
//        public func textViewDidChange(_ textView: UITextView) {
//            self.parent.text = textView.text
//            if textView.text.isEmpty {
//                textView.text = parent.placeholderComment
//                textView.textColor = UIColor(parent.placeholderColor)
//                textView.isSelectable = true
//            }
//        }
//
//        public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//            if textView.textColor == UIColor(parent.placeholderColor) {
//                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//            }
//            return true
//        }
//    }
//}
//
//
//
//struct ContentView: View {
//    @State private var text: String = ""
//    var body: some View {
//        VStack {
//            YDSTextView(text: $text,
//                        placeholderComment: "여기에 댓글을 남겨주세요.",
//                        textColor: .black,
//                        lineBreakMode: .byWordWrapping,
//                        lineBreakStrategy: .hangulWordPriority,
//                        placeholderColor: .gray)
//            .frame(height: 200)
//            .padding()
//
//            Button(action: {
//                print("입력된 텍스트: \(text)")
//            }) {
//                Text("텍스트 제출")
//            }
//            .padding()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//

public struct YDSTextView: UIViewRepresentable {
    @Binding var text: String
    let placeholderLabel: UILabel
    let textColor: Color
    let lineBreakMode: NSLineBreakMode
    let lineBreakStrategy: NSParagraphStyle.LineBreakStrategy
    let placeholderColor: Color
    let placeholderComment: String?

    public init(text: Binding<String>,
                textColor: Color = YDSColor.textPrimary,
                lineBreakMode: NSLineBreakMode = .byWordWrapping,
                lineBreakStrategy: NSParagraphStyle.LineBreakStrategy = .hangulWordPriority,
                placeholderColor: Color = YDSColor.textTertiary,
                placeholderComment: String? = "댓글을 입력해주세요.") {
        self._text = text
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
        textView.font = UIFont.systemFont(ofSize: 17.0) // 원하는 텍스트 크기로 변경
        textView.textContainer.lineBreakMode = lineBreakMode
//        textView.textContainer.lineFragmentPadding = 0 // default : 5.0
//        textView.textContainerInset = .zero  //default : (8, 0, 8, 0)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        textView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        textView.addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 8),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -5),
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            placeholderLabel.bottomAnchor.constraint(lessThanOrEqualTo: textView.bottomAnchor, constant: -8),
        ])

        return textView
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textColor = UIColor(textColor)
        uiView.font = UIFont.systemFont(ofSize: 17.0) // 원하는 텍스트 크기로 변경
        uiView.textContainer.lineBreakMode = lineBreakMode
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        uiView.typingAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        placeholderLabel.isHidden = !uiView.text.isEmpty
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
        }
    }
}

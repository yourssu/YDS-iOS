//
//  GrowingTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 11/14/23.
//

import SwiftUI

struct GrowingTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.gray

        let oneLineLabel = UILabel()
        oneLineLabel.text = "Text"
        oneLineLabel.sizeToFit()
        self.height = oneLineLabel.frame.height

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        DispatchQueue.main.async {
//            self.height = max(uiView.contentSize.height, self.height)
//            self.height = uiView.contentSize.height

            self.height = uiView.sizeThatFits(CGSize(width: uiView.bounds.width, height: .infinity)).height


        }
    }

    class Coordinator : NSObject, UITextViewDelegate {
        var parent: GrowingTextView

        init(_ parent: GrowingTextView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
//            self.parent.height = max(textView.contentSize.height, self.parent.height)
//            self.parent.height = textView.contentSize.height
            DispatchQueue.main.async {
                            self.parent.height = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: .infinity)).height
                        }
        }
    }
}


struct ContentView: View {
    @State private var text = ""
    @State private var height: CGFloat = 0

    var body: some View {
        GrowingTextView(text: $text, height: $height)
            .frame(height: height)

    }
}

#Preview {
    ContentView()
}

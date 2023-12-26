//
//  YDSTextView.swift
//  YDS-SwiftUI
//
//  Created by 오동규 on 12/26/23.
//

import SwiftUI

public struct YDSTextView: View {
//    let text: String?
    @State private var text: String? = ""
    let textColor: Color
    let placeholderText: String?
    let placeholderTextColor: Color
    let style: String.TypoStyle
    let multilineTextAlignment: TextAlignment
    let maxHeight: CGFloat?

    public init(text: String? = nil,
    )




        public var body: some View {
            VStack {
                TextEditor(text: $text)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .border(Color.gray) // 선택적으로 테두리 설정 가능
            }
        }
}

#Preview {
    YDSTextView()
}

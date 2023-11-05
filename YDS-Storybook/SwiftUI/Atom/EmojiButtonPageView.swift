//
//  EmojiButtonView.swift
//  YDS-Storybook
//
//  Created by 성현주 on 11/5/23.
//

import SwiftUI
import YDS_SwiftUI

struct EmojiButtonPageView: View {
    let title: String = "EmojiButton"
    
    @State var emoji: String? = "💜"
    @State var text: String? = "3"
    @State var isSelected: Bool = true
    
   
    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                GeometryReader { geometry in
                    YDSEmojiButton(emoji: emoji,
                                   text: text,
                                   isSelected: isSelected)
                    .frame(maxWidth: .infinity, maxHeight: YDSScreenSize.width * 3/4)
                    .background(
                        Rectangle()
                            .fill(.white)
                    )
                }
            }

        }, options: [
            Option.optionalString(
                description: "emoji",
                text: $emoji),
            Option.optionalString(
                description: "text",
                text: $text),
            Option.bool(
                description: "isSelcted",
                isOn: $isSelected)
        ])
        .navigationTitle(title)
    }
}

#Preview {
    EmojiButtonPageView()
}

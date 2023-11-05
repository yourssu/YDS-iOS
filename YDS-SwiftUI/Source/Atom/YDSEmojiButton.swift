//
//  YDSEmojiButton.swift
//  YDS-SwiftUI
//
//  Created by 성현주 on 11/5/23.
//

import SwiftUI
import YDS_Essential

public struct YDSEmojiButton: View {
    let emoji: String?
    let text: String?
    
    public init(emoji: String?, 
                text: String?) {
        self.emoji = emoji
        self.text = text
    }
    
    public var body: some View {
        HStack(spacing:2){
            if let emoji = emoji{
                Text(emoji)
                    .font(YDSFont.button1)
            }
            if let text = text{
                Text(text)
                    .font(YDSFont.button4)
            }
        }
        .frame(height: 32)
        .padding(.horizontal,8)
        .background(RoundedRectangle(cornerRadius: 16).fill(YDSColor.buttonEmojiBG))
    }
}


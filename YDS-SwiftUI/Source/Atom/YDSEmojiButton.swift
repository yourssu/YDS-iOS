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
    @Binding var isSelected: Bool
    
    public init(emoji: String?,
                text: String?,
                isSelected: Binding<Bool>) {
        self.emoji = emoji
        self.text = text
        _isSelected = isSelected
    }
    
    public var body: some View {
        Button {
            
            isSelected.toggle()
        } label: {
            HStack(spacing:2){
                if let emoji {
                    Text(emoji)
                        .font(YDSFont.button1)
                        .foregroundColor(YDSColor.bgNormal)
                }
                if let text {
                    Text(text)
                        .font(YDSFont.button4)
                        .foregroundColor(isSelected ? YDSColor.buttonPoint : YDSColor.buttonNormal)
                }
            }
        }
        .disabled(true)
        .frame(height: 32)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(isSelected ? YDSColor.buttonPointBG : YDSColor.buttonEmojiBG)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(YDSColor.borderNormal, lineWidth: 1))
    }
}



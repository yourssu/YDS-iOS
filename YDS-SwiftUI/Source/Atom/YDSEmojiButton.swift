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
    var isSelected: Bool
    
    public init(emoji: String?, 
                text: String?,
                isSelected: Bool) {
        self.emoji = emoji
        self.text = text
        self.isSelected = isSelected
    }
    
    public var body: some View {
        Button {
        //Button이 눌렸을때,안눌렸을때 처리
        //isSelected.toggle()
        } label: {
            HStack(spacing:2){
                if let emoji = emoji{
                    Text(emoji)
                        .font(YDSFont.button1)
                        .foregroundColor(YDSColor.bgNormal)
                }
                if let text = text{
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



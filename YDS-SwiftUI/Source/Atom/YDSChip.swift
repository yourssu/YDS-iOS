//
//  YDSChip.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 2023/10/31.
//

import SwiftUI
import YDS_Essential

public struct YDSChip: View {
    let text: String?
    var isSelected: Bool
    
    public init(
        text: String?,
        isSelected: Bool) {
        self.text = text
        self.isSelected = isSelected
    }

    public var body: some View {
        Button {
        } label: {
            if let text = text{
                Text(text)
                    .font(YDSFont.caption1)
                    .foregroundColor(isSelected ? YDSColor.textBright : YDSColor.textTertiary)
            }
        }
        .disabled(true)
        .frame(height: 24)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(isSelected ? YDSColor.buttonPoint : YDSColor.buttonBG)
        )
    }
}

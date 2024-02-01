//
//  YDSBadge.swift
//  YDS-SwiftUI
//
//  Created by 성현주 on 10/31/23.
//

import SwiftUI
import YDS_Essential

public struct YDSBadge: View {
    let text: String?
    let icon: Image?
    let color: Color?
    
    public init(text: String?,
                icon: Image?,
                color: Color?) {
        self.text = text
        self.icon = icon
        self.color = color
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            if let icon {
                icon
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            
            if let text {
                Text(text)
                    .font(YDSFont.caption1)
            }
        }
        .frame(height: 24)
        .padding(.horizontal, icon != nil ? 8 : 12)
        .background(RoundedRectangle(cornerRadius: 2).fill(color ?? .white))
    }
}

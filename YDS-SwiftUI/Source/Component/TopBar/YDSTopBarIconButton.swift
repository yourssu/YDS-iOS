//
//  YDSTopBarIconButton.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/28/23.
//

import SwiftUI

struct YDSTopBarIconButton: View {
    let icon: Image?
    var isSelected: Bool = false
    
    public init(
        icon: Image?,
        isSelected: Bool) {
        self.icon = icon
        self.isSelected = isSelected
    }

    
    var body: some View {
        Button {
        } label: {
            icon.disabled(true)
        }
    }
}

#Preview {
    YDSTopBarIconButton(icon: YDSIcon.adbadgeFilled, isSelected: false)
}

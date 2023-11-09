//
//  YDSListItem.swift
//  YDS-SwiftUI
//
//  Created by 김수민 on 2023/11/04.
//

import SwiftUI

struct YDSListItem: View {
    var icon: Bool?
    var toggle: Bool?
    var text: String?
    
    @Binding var isOn: Bool
    
    public init(text: String?, icon: Bool?, toggle: Bool?, isOn: Binding<Bool>) {
        self.text = text
        self.icon = icon
        self.toggle = toggle
        self._isOn = isOn
    }
    public var body: some View {
        HStack {
            if let text = text{
                Text(text)
                    .foregroundColor(YDSColor.textSecondary)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .frame(height: 23)
            }
            Spacer()
            if let icon = icon, icon {
                YDSIcon.arrowRightLine
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
            } else if let toggle = toggle, toggle {
                Toggle("", isOn: $isOn)
                    .labelsHidden()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .tint(YDSColor.buttonPoint)
                
            }
        }
    }
}



struct YDSListItem_Previews: PreviewProvider {
    static var previews: some View {
        YDSListItem(text:"계정관리", icon: false, toggle: true, isOn: .constant(true))
    }
}

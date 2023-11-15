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
    @State var isOn: Bool = true
    
    public init(text: String?, icon: Bool? = nil, toggle: Bool? = nil) {
        self.text = text
        self.icon = icon
        self.toggle = toggle
    }
    public var body: some View {
        HStack {
            if let text {
                Text(text)
                    .foregroundColor(YDSColor.textSecondary)
                    .padding(20)
                    .frame(height: 23)
            }
            Spacer()
            if let icon, icon {
                YDSIcon.arrowRightLine
                    .padding(20)
            } else if let toggle = toggle, toggle {
                Toggle("", isOn: $isOn)
                    .labelsHidden()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .tint(YDSColor.buttonPoint)
                
            }
        }
        .frame(height: 48)
    }
}



struct YDSListItem_Previews: PreviewProvider {
    static var previews: some View {
        YDSListItem(text:"비밀번호 변경", icon: false, toggle: true)
    }
}

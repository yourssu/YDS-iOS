//
//  BoolOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI

import YDS_SwiftUI

struct BoolOptionView: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 8
            static let textSpacing: CGFloat = 4
        }
    }

    @Binding private var isOn: Bool

    private let description: String?

    init(description: String?, isOn: Binding<Bool>) {
        self.description = description
        self._isOn = isOn
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                if let description = description {
                    Text(description)
                        .font(YDSFont.subtitle2)
                }
                Text("Bool")
                    .font(YDSFont.body2)
            }
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
        }
    }
}

struct BoolOptionView_Previews: PreviewProvider {
    static var previews: some View {
        BoolOptionView(description: "isDisabled", isOn: .constant(true))
    }
}

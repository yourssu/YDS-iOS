//
//  IntOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct IntOptionView: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 8
            static let textSpacing: CGFloat = 4
        }
        
        enum Padding {
            static let textField: CGFloat = 16
        }
        
        enum Rectangle {
            static let cornerRadius: CGFloat = 8
        }
    }
    
    @Binding private var value: Int
    
    private let description: String?
    
    init(description: String?, value: Binding<Int>) {
        self.description = description
        self._value = value
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                if let description = description {
                    Text(description)
                        .font(YDSFont.subtitle2)
                }
                Text("Int")
                    .font(YDSFont.body2)
            }
            
            TextField("", value: $value, format: .number)
                .font(YDSFont.body1)
                .tint(YDSColor.textPointed)
                .padding(Dimension.Padding.textField)
                .background(
                    RoundedRectangle(cornerRadius: Dimension.Rectangle.cornerRadius)
                        .fill(YDSColor.inputFieldElevated)
                )
        }
    }
}

struct IntOptionView_Previews: PreviewProvider {
    static var previews: some View {
        IntOptionView(description: "numberOfLines", value: .constant(1))
    }
}

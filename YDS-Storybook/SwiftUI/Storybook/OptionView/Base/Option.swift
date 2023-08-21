//
//  Option.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/21.
//

import SwiftUI

enum Option: View {
    case bool(description: String?, isOn: Binding<Bool>)
    case `enum`, int, optionalString, optionalImage
    
    @ViewBuilder
    var body: some View {
        switch self {
        case .bool(let description, let isOn):
            BoolOptionView(description: description, isOn: isOn)
        case .enum:
            EnumOptionView()
        case .int:
            IntOptionView()
        case .optionalString:
            OptionalStringOptionView()
        case .optionalImage:
            OptionalImageOptionView()
        }
    }
}

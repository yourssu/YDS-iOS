//
//  Option.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/21.
//

import SwiftUI

enum Option: View {
    case bool(description: String?, isOn: Binding<Bool>)
    case `enum`(description: String?, cases: [Any], selectedIndex: Binding<Int>)
    case int(description: String?, value: Binding<Int>)
    case optionalString(description: String?, text: Binding<String?>)
    case optionalIcon(description: String?, icons: [SwiftUIIcon], selectedIcon: Binding<SwiftUIIcon?>, placeholderIndex: Int)
    case optionalImage(description: String?, images: [SwiftUIImage], selectedImage: Binding<SwiftUIImage?>)

    @ViewBuilder
    var body: some View {
        switch self {
        case .bool(let description, let isOn):
            BoolOptionView(description: description, isOn: isOn)
        case .enum(let description, let cases, let selectedIndex):
            EnumOptionView(description: description, cases: cases, selectedIndex: selectedIndex)
        case .int(let description, let value):
            IntOptionView(description: description, value: value)
        case .optionalString(let description, let text):
            OptionalStringOptionView(description: description, text: text)
        case .optionalIcon(let description, let icons, let selectedIcon, let placeholderIndex):
            OptionalIconOptionView(description: description, icons: icons, selectedIcon: selectedIcon, placeholderIndex: placeholderIndex)
        case .optionalImage(let description, let images, let selectedImage):
            OptionalImageOptionView(description: description, images: images, selectedImage: selectedImage)
        }
    }
}

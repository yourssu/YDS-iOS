//
//  OptionalImageOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct OptionalIconOptionView: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 8
            static let textSpacing: CGFloat = 4
        }

        enum Padding {
            static let button: CGFloat = 16
        }

        enum Rectangle {
            static let cornerRadius: CGFloat = 8
        }
    }

    @Binding private var selectedIcon: SwiftUIIcon?

    private let description: String?
    private let icons: [SwiftUIIcon]

    @State private var placeholderIndex: Int
    @State private var isPresentPicker = false

    init(description: String?, icons: [SwiftUIIcon], selectedIcon: Binding<SwiftUIIcon?>, placeholderIndex: Int) {
        self.description = description
        self.icons = icons
        self._selectedIcon = selectedIcon
        self.placeholderIndex = placeholderIndex
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            HStack {
                VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                    if let description = description {
                        Text(description)
                            .font(YDSFont.subtitle2)
                    }
                    Text("Optional<Image>")
                        .font(YDSFont.body2)
                }
                Spacer()
                Toggle("", isOn: Binding(get: {
                    selectedIcon != nil
                }, set: { isOn in
                    isOn ? (selectedIcon = icons[placeholderIndex]) : (selectedIcon = nil)
                }))
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
            }
            
            ShowPickerButton(cases: icons.map({ $0.name }), selectedIndex: Binding(get: {
                placeholderIndex
            }, set: { index in
                placeholderIndex = index
                selectedIcon = icons[index]
            }))
            .disabled(selectedIcon == nil)
        }
    }
}

struct OptionalIconOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalIconOptionView(
            description: "icon",
            icons: YDSSwiftUIIcon.icons,
            selectedIcon: .constant(YDSSwiftUIIcon.icons[0]), placeholderIndex: 0
        )
    }
}

//
//  OptionalTextColorOptionView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/09/12.
//
import SwiftUI
import YDS_SwiftUI

struct OptionalTextColorOptionView: View {
    private enum Dimension {
        enum Spacing {
            static let textSpacing: CGFloat = 4
        }
    }

    private let description: String?
    private let textColor: [WrappedSwiftUIColor]
    @Binding private var selectedTextColor: WrappedSwiftUIColor?
    @State private var placeholderIndex: Int
    @State private var isPresentPicker = false

    init(description: String?, textColor: [WrappedSwiftUIColor], selectedTextColor: Binding<WrappedSwiftUIColor?>) {
        self.description = description
        self.textColor = textColor
        self._selectedTextColor = selectedTextColor
        self.placeholderIndex = 0
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                    if let description = description {
                        Text(description)
                            .font(YDSFont.subtitle2)
                    }
                    Text("Optional<UIColor>")
                        .font(YDSFont.body2)
                }
                Spacer()
                Toggle("", isOn: Binding(get: {
                    selectedTextColor != nil
                }, set: { isOn in
                    isOn ? (selectedTextColor = textColor[placeholderIndex]) : (selectedTextColor = nil)
                }))
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
            }

            ShowPickerButton(cases: textColor.map({ $0.name }), selectedIndex: Binding(get: {
                placeholderIndex
            }, set: { index in
                placeholderIndex = index
                selectedTextColor = textColor[index]
            }))
            .disabled(selectedTextColor == nil)
        }
    }
}

struct OptionalTextColorOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalTextColorOptionView(
            description: "image",
            textColor: YDSSwiftUIColorWrapper.textColors.items,
            selectedTextColor: .constant(YDSSwiftUIColorWrapper.textColors.items[0])
        )
    }
}

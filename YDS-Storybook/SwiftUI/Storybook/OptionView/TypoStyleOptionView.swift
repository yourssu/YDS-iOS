//
//  TypoStyleOptionView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/09/11.
//
import SwiftUI
import YDS_SwiftUI

struct TypoStyleOptionView: View {
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

    @Binding private var selectedStyle: WrappedSwiftUITypo?

    private let description: String?
    private let styles: [WrappedSwiftUITypo]
    private let fonts = YDSSwiftUITypoWrapper.fonts

    @State private var placeholderIndex: Int
    @State private var isPresentPicker = false

    init(description: String?, styles: [WrappedSwiftUITypo], selectedStyle: Binding<WrappedSwiftUITypo?>) {
        self.description = description
        self.styles = styles
        self._selectedStyle = selectedStyle
        self.placeholderIndex = 0
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            HStack {
                VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                    if let description = description {
                        Text(description)
                            .font(YDSFont.subtitle2)
                    }
                    Text("TypoStylefff")
                        .font(YDSFont.body2)
                }
                Spacer()
                Toggle("", isOn: Binding(get: {
                    selectedStyle != nil
                }, set: { isOn in
                    isOn ? (selectedStyle = styles[placeholderIndex]) : (selectedStyle = nil)
                }))
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
            }

            ShowPickerButton(cases: styles.map({ $0.typoStyle }), selectedIndex: Binding(get: {
                placeholderIndex
            }, set: { index in
                placeholderIndex = index
                selectedStyle = styles[index]
            }))
            .disabled(selectedStyle == nil)
        }
    }
}

struct TypoStyleOptionView_Previews: PreviewProvider {
    var fon: String
    static var previews: some View {
        TypoStyleOptionView(
            description: "style",
            styles: YDSSwiftUITypoWrapper.fonts[0].items,
            selectedStyle: .constant(YDSSwiftUITypoWrapper.displayFonts.items[0])
        )
    }
}

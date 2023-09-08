//
//  OptionalImageOptionView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/09/04.
//
// swiftlint:disable line_length

import SwiftUI
import YDS_SwiftUI

struct OptionalImageOptionView: View {
    private enum Dimension {
        enum Spacing {
            static let textSpacing: CGFloat = 4
        }
    }

    private let description: String?
    private let images: [SwiftUIImage]
    @Binding private var selectedImage: SwiftUIImage?
    @State private var placeholderIndex: Int
    @State private var isPresentPicker = false

    init(description: String?, images: [SwiftUIImage], selectedImage: Binding<SwiftUIImage?>) {
        self.description = description
        self.images = images
        self._selectedImage = selectedImage
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
                    Text("Optional<Image>")
                        .font(YDSFont.body2)
                }
                Spacer()
                Toggle("", isOn: Binding(get: {
                    selectedImage != nil
                }, set: { isOn in
                    isOn ? (selectedImage = images[placeholderIndex]) : (selectedImage = nil)
                }))
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
            }

            ShowPickerButton(cases: images.map({ $0.name }), selectedIndex: Binding(get: {
                placeholderIndex
            }, set: { index in
                placeholderIndex = index
                selectedImage = images[index]
            }))
            .disabled(selectedImage == nil)
        }
    }
}

struct OptionalImageOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalImageOptionView(
            description: "image",
            images: YDSSwiftUIImage.images,
            selectedImage: .constant(YDSSwiftUIImage.images[0])
        )
    }
}

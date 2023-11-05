//
//  YDSSearchTextField.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/10/29.
//

import SwiftUI

public struct YDSSearchTextField: View, YDSTextFieldProtocol {
    let isNegative: Bool = false
    let isPositive: Bool = false
    let fieldText: String? = nil
    let helperText: String? = nil

    @Binding var text: String
    let placeholder: String?
    let isDisabled: Bool

    public init(
        placeholder: String? = nil,
        text: Binding<String>,
        isDisabled: Bool = false
    ) {
        self.placeholder = placeholder
        self._text = text
        self.isDisabled = isDisabled
    }

    init?() {
        fatalError("Initialization failed: YDSProfileImageView requires an Image and a size to be initialized.")
    }

    public var body: some View {
        YDSTextFieldBase(
            placeholder: placeholder,
            leading: AnyView(
                Image(systemName: "magnifyingglass")
                    .foregroundColor(YDSColor.textTertiary)
            ),
            text: $text,
            trailing:
                AnyView(
                    Group {
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.secondary)
                            })
                        }
                    }
                ),
            isDisabled: isDisabled
        )
    }
}

struct YDSSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        YDSSearchTextField(
            placeholder: "placeHolder",
            text: .constant(""),
            isDisabled: false
        )
    }
}

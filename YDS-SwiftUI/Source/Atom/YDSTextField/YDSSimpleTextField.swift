//
//  YDSSimpleTextField.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/10/29.
//

import SwiftUI

public struct YDSSimpleTextField: View, YDSTextFieldProtocol {
    var fieldText: String?
    var placeholder: String?
    var helperText: String?
    @Binding var text: String
    var isDisabled: Bool
    var isNegative: Bool
    var isPositive: Bool

    public init(
        fieldText: String? = nil,
        placeholder: String? = nil,
        helperText: String? = nil,
        text: Binding<String>,
        isDisabled: Bool = false,
        isNegative: Bool = false,
        isPositive: Bool = false
    ) {
        self.fieldText = fieldText
        self.placeholder = placeholder
        self.helperText = helperText
        self._text = text
        self.isDisabled = isDisabled
        self.isNegative = isNegative
        self.isPositive = isPositive
    }

    init?() {
        fatalError("Initialization failed: YDSProfileImageView requires an Image and a size to be initialized.")
    }

    public var body: some View {
        YDSTextFieldBase(
            fieldText: fieldText,
            placeholder: placeholder,
            helperText: helperText,
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
                    } else {
                        EmptyView()
                    }
                }
            ),
            isDisabled: isDisabled,
            isNegative: isNegative,
            isPositive: isPositive
         )
    }
}

struct YDSSimpleTextField_Previews: PreviewProvider {
    static var previews: some View {
        YDSSimpleTextField(
            fieldText: "hello world",
            placeholder: "hello world",
            helperText: "helper",
            text: .constant("")
        )
    }
}

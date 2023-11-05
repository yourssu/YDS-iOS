//
//  YDSPasswordTextField.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/10/29.
//

import SwiftUI

public struct YDSPasswordTextField: View, YDSTextFieldProtocol {
    let fieldText: String?
    let placeholder: String?
    let helperText: String?
    @Binding var text: String
    let suffixText: String?
    let isDisabled: Bool
    let isNegative: Bool
    let isPositive: Bool
    let onSubmit: () -> Void

    @State var isSecured: Bool = true

    public init(
        fieldText: String? = nil,
        placeholder: String? = nil,
        helperText: String? = nil,
        text: Binding<String>,
        suffixText: String? = nil,
        isDisabled: Bool = false,
        isNegative: Bool = false,
        isPositive: Bool = false,
        onSubmit: @escaping () -> Void = {}
    ) {
            self.fieldText = fieldText
            self.placeholder = placeholder
            self.helperText = helperText
            self._text = text
            self.suffixText = suffixText
            self.isDisabled = isDisabled
            self.isNegative = isNegative
            self.isPositive = isPositive
            self.onSubmit = onSubmit
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
            trailing: AnyView(
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(YDSColor.buttonNormal)
                        .frame(width: 24, height: 24)
                }
            ),
            isDisabled: isDisabled,
            isNegative: isNegative,
            isPositive: isPositive,
            isSecure: isSecured,
            onSubmit: onSubmit
            )
    }
}

struct YDSPasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        YDSPasswordTextField(
            fieldText: "fieldText",
            placeholder: "placeHolder",
            helperText: "helperText",
            text: .constant("")
        )
    }
}

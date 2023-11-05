//
//  YDSSuffixTextField.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/10/29.
//

import SwiftUI

public struct YDSSuffixTextField: View, YDSTextFieldProtocol {
    let fieldText: String?
    let placeholder: String?
    let helperText: String?
    @Binding var text: String
    let suffixText: String?
    let isDisabled: Bool
    let isNegative: Bool
    let isPositive: Bool
    let onSubmit: () -> Void

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
        fatalError("Initialization failed: YDSSuffixTextField initializing failed.")
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
                        if let suffixText {
                            YDSLabel(
                                text: suffixText,
                                textColor: YDSColor.textTertiary
                            )
                        } else {
                            EmptyView()
                        }
                }
            ),
            isDisabled: isDisabled,
            isNegative: isNegative,
            isPositive: isPositive,
            onSubmit: onSubmit
            )
    }
}

struct YDSSuffixTextField_Previews: PreviewProvider {
    static var previews: some View {
        YDSSuffixTextField(
            fieldText: "hello world",
            placeholder: "hello world",
            helperText: "helper",
            text: .constant(""),
            suffixText: "Hello world",
            isNegative: true
        )
    }
}

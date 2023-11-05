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
    let onSubmit: () -> Void

    public init(
        placeholder: String? = nil,
        text: Binding<String>,
        isDisabled: Bool = false,
        onSubmit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        self._text = text
        self.isDisabled = isDisabled
        self.onSubmit = onSubmit
    }

    init?() {
        fatalError("Initialization failed: YDSSearchTextField initializing failed.")
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
            isDisabled: isDisabled,
            onSubmit: onSubmit
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

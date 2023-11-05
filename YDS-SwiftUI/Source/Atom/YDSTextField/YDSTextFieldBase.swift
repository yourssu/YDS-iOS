//
//  YDSTextFieldBase.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/11/01.
//

import SwiftUI

struct YDSTextFieldBase: View {
    private let fieldText: String?
    private let placeholder: String?
    private let helperText: String?
    private let text: Binding<String>
    private let isDisabled: Bool
    private let isNegative: Bool
    private let isPositive: Bool

    private let leading: AnyView?
    private let trailing: AnyView?

    private var fieldTextColor: Color
    private var borderColor: Color
    private var helperTextColor: Color
    private var textColor: Color

    private let isSecure: Bool

    init(
        fieldText: String? = nil,
        placeholder: String? = nil,
        helperText: String? = nil,
        leading: AnyView? = AnyView(EmptyView()),
        text: Binding<String>,
        trailing: AnyView? = AnyView(EmptyView()),
        isDisabled: Bool = false,
        isNegative: Bool = false,
        isPositive: Bool = false,
        borderColor: Color = .clear,
        isSecure: Bool = false
    ) {
            self.fieldText = fieldText
            self.placeholder = placeholder
            self.helperText = helperText
            self.leading = leading
            self.text = text
            self.trailing = trailing
            self.isDisabled = isDisabled
            self.isNegative = isNegative
            self.isPositive = isPositive

            self.fieldTextColor = YDSColor.textSecondary
            self.borderColor = borderColor
            self.helperTextColor = YDSColor.textTertiary

            self.isSecure = isSecure
            self.textColor = YDSColor.textSecondary

            /// isDisabled > isNegative > isPositive
            if isDisabled {
                self.fieldTextColor = YDSColor.textDisabled
                self.borderColor = .clear
                self.helperTextColor = YDSColor.textDisabled
                self.textColor = YDSColor.textDisabled
                return
            }

            if isNegative {
                self.fieldTextColor = YDSColor.textSecondary
                self.borderColor = YDSColor.textWarned
                self.helperTextColor = YDSColor.textWarned
                return
            }

            if isPositive {
                self.fieldTextColor = YDSColor.textSecondary
                self.borderColor = YDSColor.textPointed
                self.helperTextColor = YDSColor.textTertiary
                return
            }
        }

    init?() {
        fatalError("Initialization failed: YDSTextField requires an Image and a size to be initialized.")
    }

    public var body: some View {
        VStack(alignment: .leading) {
            if let fieldText {
                YDSLabel(
                    text: fieldText,
                    textColor: fieldTextColor,
                    alignment: NSTextAlignment.left
                )
            }

            HStack {
                leading

                if isSecure {
                    SecureField(placeholder ?? "", text: text)
                        .accentColor(YDSColor.textPointed)
                        .foregroundColor(textColor)
                        .disabled(isDisabled)
                } else {
                    TextField(placeholder ?? "", text: text)
                        .accentColor(YDSColor.textPointed)
                        .foregroundColor(textColor)
                        .disabled(isDisabled)
                }

                trailing
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(YDSColor.inputFieldElevated)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor)
            )

            if let helperText {
                YDSLabel(
                    text: helperText,
                    textColor: helperTextColor,
                    alignment: NSTextAlignment.left
                )
                .padding(.horizontal, 8)
            }
        }
    }
}

struct YDSTextFieldBase_Previews: PreviewProvider {
    static var previews: some View {
        YDSTextFieldBase(
            fieldText: "hello world",
            placeholder: "hello world",
            helperText: "helper",
            leading: AnyView(YDSLabel(text: "le")),
            text: .constant(""),
            trailing: AnyView(YDSLabel(text: "tr"))
        ).padding()
    }
}

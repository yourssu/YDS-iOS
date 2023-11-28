//
//  YDSTextFieldBase.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/11/01.
//

import SwiftUI

struct YDSTextFieldBase<Leading: View, Trailing: View>: View {
    private let fieldText: String?
    private let placeholder: String?
    private let helperText: String?
    @Binding private var text: String
    private let isDisabled: Bool
    private let isNegative: Bool
    private let isPositive: Bool

    @ViewBuilder private var leading: () -> Leading?
    @ViewBuilder private var trailing: () -> Trailing?

    private var fieldTextColor: Color
    private var borderColor: Color
    private var helperTextColor: Color
    private var textColor: Color
    private let isSecure: Bool
    private let onSubmit: () -> Void

    init(
        fieldText: String? = nil,
        placeholder: String? = nil,
        helperText: String? = nil,
        @ViewBuilder leading: @escaping () -> Leading? = { EmptyView() },
        text: Binding<String>,
        @ViewBuilder trailing: @escaping () -> Trailing? = { EmptyView() },
        isDisabled: Bool = false,
        isNegative: Bool = false,
        isPositive: Bool = false,
        borderColor: Color = .clear,
        isSecure: Bool = false,
        onSubmit: @escaping () -> Void = {}
    ) {
            self.fieldText = fieldText
            self.placeholder = placeholder
            self.helperText = helperText
            self.leading = leading
            self._text = text
            self.trailing = trailing
            self.isDisabled = isDisabled
            self.isNegative = isNegative
            self.isPositive = isPositive

            self.fieldTextColor = YDSColor.textSecondary
            self.borderColor = borderColor
            self.helperTextColor = YDSColor.textTertiary

            self.isSecure = isSecure
            self.textColor = YDSColor.textSecondary

            self.onSubmit = onSubmit

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
        fatalError("Initialization failed: YDSTextFieldBase initializing failed.")
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
                leading()
                
                if isSecure {
                    SecureField(placeholder ?? "", text: $text)
                        .accentColor(YDSColor.textPointed)
                        .foregroundColor(textColor)
                        .disabled(isDisabled)
                } else {
                    TextField(placeholder ?? "", text: $text)
                        .accentColor(YDSColor.textPointed)
                        .foregroundColor(textColor)
                        .disabled(isDisabled)
                        .onSubmit {
                            onSubmit()
                        }
                }

                trailing()
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
            leading: { YDSLabel(text: "le") },
            text: .constant(""),
            trailing: { YDSLabel(text: "tr") }
        ).padding()
    }
}

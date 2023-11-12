//
//  PasswordTextFieldPageView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/11/05.
//

import SwiftUI
import YDS_SwiftUI

struct PasswordTextFieldPageView: View {
    let title: String = "PasswordTextFieldView"

    @State var fieldText: String? = "비밀번호"
    @State var placeHolder: String? = "1234qwer!@#$"
    @State var helperText: String? = "숫자와 영문자 조합으로 8자 이상 입력해주세요."
    @State var text = ""
    @State var isDisabled: Bool = false
    @State var isNegative: Bool = false
    @State var isPositive: Bool = false

    var body: some View {
        StorybookPageView(sample: {
            YDSPasswordTextField(
                fieldText: fieldText,
                placeholder: placeHolder,
                helperText: helperText,
                text: $text,
                isDisabled: isDisabled,
                isNegative: isNegative,
                isPositive: isPositive
            )
            .padding()
        }, options: [
            Option.optionalString(
                description: "fieldLabelText",
                text: $fieldText),
            Option.optionalString(
                description: "placeholder",
                text: $placeHolder),
            Option.optionalString(
                description: "helperLabelText",
                text: $helperText),
            Option.bool(
                description: "isDisabled",
                isOn: $isDisabled),
            Option.bool(
                description: "isNegative",
                isOn: $isNegative),
            Option.bool(
                description: "isPositive",
                isOn: $isPositive)
        ])
        .navigationTitle(title)
    }
}

struct PasswordTextFieldPageView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldPageView()
    }
}

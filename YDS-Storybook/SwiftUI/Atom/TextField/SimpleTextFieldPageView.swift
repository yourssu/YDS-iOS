//
//  SimpleTextFieldPageView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/10/30.
//

import SwiftUI
import YDS_SwiftUI

struct SimpleTextFieldPageView: View {
    let title: String = "SimpleTextFieldView"

    @State var fieldText: String? = "닉네임"
    @State var placeHolder: String? = "홍길동"
    @State var helperText: String? = "닉네임은 20글자 이하로 해주세요."
    @State var text = ""
    @State var isDisabled: Bool = false
    @State var isNegative: Bool = false
    @State var isPositive: Bool = false

    var body: some View {
        StorybookPageView(sample: {
            YDSSimpleTextField(
                fieldText: fieldText ?? nil,
                placeholder: placeHolder ?? nil,
                helperText: helperText ?? nil,
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

struct SimpleTextFieldPageView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTextFieldPageView()
    }
}

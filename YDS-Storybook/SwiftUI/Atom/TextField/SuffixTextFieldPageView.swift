//
//  SuffixTextFieldPageView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/11/05.
//

import SwiftUI
import YDS_SwiftUI

struct SuffixTextFieldPageView: View {
    let title: String = "SuffixTextFieldView"

    @State var fieldText: String? = "학교 이메일"
    @State var placeHolder: String? = "아이디"
    @State var helperText: String? = "이메일 규칙은 어떠어떠합니다."
    @State var text = ""
    @State var suffixText: String? = "@soongsil.ac.kr"
    @State var isDisabled: Bool = false
    @State var isNegative: Bool = false
    @State var isPositive: Bool = false

    var body: some View {
        StorybookPageView(sample: {
            YDSSuffixTextField(
                fieldText: fieldText ?? nil,
                placeholder: placeHolder ?? nil,
                helperText: helperText ?? nil,
                text: $text,
                suffixText: suffixText,
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
                description: "suffixLabelText",
                text: $suffixText),
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

struct SuffixTextFieldPageView_Previews: PreviewProvider {
    static var previews: some View {
        SuffixTextFieldPageView()
    }
}

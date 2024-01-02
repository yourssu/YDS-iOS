//
//  SearchTextFieldPageView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/11/05.
//

import SwiftUI
import YDS_SwiftUI

struct SearchTextFieldPageView: View {
    let title: String = "SearchTextField"

    @State var placeHolder: String? = "검색어를 입력하세요."
    @State var text = ""

    @State var isDisabled: Bool = false

    var body: some View {
        StorybookPageView(sample: {
            YDSSearchTextField(
                placeholder: placeHolder,
                text: $text,
                isDisabled: isDisabled
            )
            .padding()
        }, options: [
            Option.optionalString(
                description: "placeholder",
                text: $placeHolder),
            Option.bool(
                description: "isDisabled",
                isOn: $isDisabled)
        ])
        .navigationTitle(title)
    }
}

struct SearchTextFieldPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldPageView()
    }
}

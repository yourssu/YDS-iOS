//
//  ListPageView.swift
//  YDS-Storybook
//
//  Created by 김수민 on 2023/10/31.
//

import SwiftUI
import YDS_SwiftUI

struct ListPageView: View {
    @State var isDisabled: Bool = true
    let title: String = "List"

    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                Spacer()
                YDSList(subheader: isDisabled)
                Spacer()
            }
        }, options: [
            Option.bool(description: "List의 Subheader", isOn: $isDisabled)
        ])
        .navigationTitle(title)
    }
}

struct ListPageView_Previews: PreviewProvider {
    static var previews: some View {
        ListPageView()
    }
}

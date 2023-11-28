//
//  ListPageView.swift
//  YDS-Storybook
//
//  Created by 김수민 on 2023/11/24.
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
                YDSList(hasSubHeader: isDisabled, subHeaderText: "MY", items: [YDSListItem(text: "비밀번호 변경"),
                                                          YDSListItem(text: "계정관리", icon: true),
                                                          YDSListItem(text: "알림받기", toggle: true)])
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

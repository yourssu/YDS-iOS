//
//  YDSList.swift
//  YDS-SwiftUI
//
//  Created by 김수민 on 2023/11/24.
//
import SwiftUI
import YDS_Essential

public struct YDSList: View {
    var hasSubHeader: Bool?
    var subHeaderText: String?
    let items: [YDSListItem]

    public init(hasSubHeader: Bool? = nil, subHeaderText: String? = nil, items: [YDSListItem]) {
        self.hasSubHeader = hasSubHeader
        self.subHeaderText = subHeaderText
        self.items = items
    }

    public var body: some View {
        VStack {
            if let hasSubHeader = hasSubHeader, hasSubHeader {
                HStack {
                    Text(subHeaderText ?? "")
                        .fontWeight(.semibold)
                        .foregroundColor(YDSColor.textSecondary)
                        .padding(20)
                    Spacer()
                }
            }
            ForEach(items) { item in
                item
            }
        }.background(.white)
    }
}

struct YDSList_Previews: PreviewProvider {
    static var previews: some View {
        YDSList(hasSubHeader: true, subHeaderText: "MY", items: [YDSListItem(text: "비밀번호 변경"),
                                            YDSListItem(text: "계정관리", icon: true),
                                            YDSListItem(text: "알림받기", toggle: true)])
    }
}

////
////  YDSList.swift
//  YDS-SwiftUI
//
//  Created by 김수민 on 2023/10/31.
//

import SwiftUI
import YDS_Essential

public struct YDSList: View {

    var subheader: Bool?
    let items: [YDSListItem]
    
    public init(hasSubHeader: Bool? = nil, items: [YDSListItem]) {
        self.subheader = hasSubHeader
        self.items = items
    }

    public var body: some View {
        VStack {
            if let subheader = subheader, subheader {
                HStack {
                    Text("MY")
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
        YDSList(hasSubHeader: true, items: [YDSListItem(text: "비밀번호 변경"),
                                            YDSListItem(text: "계정관리", icon: true),
                                            YDSListItem(text: "알림받기", toggle: true)])
    }
}

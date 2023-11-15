//
//  YDSListStackView.swift
//  YDS-SwiftUI
//
//  Created by 김수민 on 2023/11/04.
//

import SwiftUI
import YDS_Essential

struct YDSListStackView: View {
    var body: some View {
        VStack(){
            YDSListItem(text: "비밀번호 변경")
            YDSListItem(text: "계정관리", icon: true)
            YDSListItem(text: "알림받기", toggle: true)
        }
    }
}
struct YDSListStackView_Previews: PreviewProvider {
    static var previews: some View {
        YDSListStackView()
    }
}



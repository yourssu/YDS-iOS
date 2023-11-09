////
////  YDSList.swift
//  YDS-SwiftUI
//
//  Created by 김수민 on 2023/10/31.
//

import SwiftUI
import YDS_Essential

public struct YDSList: View {
    
    let subheader: Bool?
    
    public init(subheader: Bool?) {
        self.subheader = subheader
    }
    
    public var body: some View {
        VStack() {
            if let subheader = subheader, subheader {
                HStack {
                    Text("MY")
                        .fontWeight(.semibold)
                        .foregroundColor(YDSColor.textSecondary)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                    Spacer()
                }
            }
            YDSListStackView()
        }.background(.white)
            .frame(height: 48)
    }
    
}
struct YDSList_Previews: PreviewProvider {
    static var previews: some View {
        YDSList(subheader: true)
    }
}

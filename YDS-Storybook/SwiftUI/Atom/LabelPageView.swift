//
//  LabelPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/09/03.
//

import SwiftUI
import YDS_SwiftUI

struct LabelPageView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(YDSColor.monoItemBG)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 3/4)
                Text("Label")
                    .font(YDSFont.display1)
            }
//            List {
//            }
        }
        .navigationTitle("Label")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LabelPageView_Previews: PreviewProvider {
    static var previews: some View {
        LabelPageView()
    }
}

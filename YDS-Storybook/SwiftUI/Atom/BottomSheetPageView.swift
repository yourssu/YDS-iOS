//
//  BottomSheetPageView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/10/31.
//

import SwiftUI
import YDS_SwiftUI

struct BottomSheetPageView: View {
    private let views = ["zero", "one", "two", "three", "four"]

    @State var selectedIndex = 0
    @State var isPresentBottomSheet = false

    var body: some View {
            StorybookPageView(
                sample: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: YDSScreenSize.width * 3/4 - 32)
                },
                options: [
                    Option.enum(
                        description: "Views",
                        cases: views,
                        selectedIndex: $selectedIndex
                    )
                ]
            )
            .overlay(alignment: .bottom) {
                // TODO: 컴포넌트 버튼으로 수정
                Button(action: {
                    isPresentBottomSheet = true
                }, label: {
                    Text("바텀시트 생성")
                })
                .padding(.bottom, 32)
            }
            .ydsBottomSheet(isPresent: $isPresentBottomSheet)
    }
}

struct BottomSheetPageView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetPageView()
    }
}

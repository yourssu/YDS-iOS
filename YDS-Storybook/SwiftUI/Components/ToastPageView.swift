//
//  ToastPageView.swift
//  YDS-Storybook
//
//  Created by 정종인 on 10/31/23.
//

import SwiftUI
import YDS_SwiftUI

struct ToastPageView: View {
    let title: String = "Toast"

    @State var text: String? = "Toast"
    @State var durationIndex: Int = 0
    @State var hapticIndex: Int = 0

    var body: some View {
        StorybookPageView(
            sample: {
                EmptyView()
            }, options: [
                Option.optionalString(
                    description: "text",
                    text: $text
                ),
                Option.enum(
                    description: "duration",
                    cases: YDSToastModel.ToastDuration.allCases,
                    selectedIndex: $durationIndex
                ),
                Option.enum(
                    description: "haptic",
                    cases: YDSToastModel.HapticType.allCases,
                    selectedIndex: $hapticIndex
                )
            ]
        )
        .navigationTitle(title)
        .overlay(alignment: .bottom) {
            Button(action: { // 버튼은 추후 YDSButton 추가 이후에 수정 예정
                YDSToast(text ?? "", duration: .allCases[durationIndex], haptic: .allCases[hapticIndex])
            }, label: {
                Text("토스트 생성!")
            })
            .padding()
        }
        .registerYDSToast()
    }
}

#Preview {
    NavigationStack {
        ToastPageView()
    }
}

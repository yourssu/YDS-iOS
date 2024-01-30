//
//  SingleTitleTopBarView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 11/22/23.
//

import SwiftUI
import YDS_SwiftUI

struct SingleTitleTopBarView: View {
    let navigationTitle: String = "SingleTitleTopBar"

    @State private var title: String? = "커뮤니티"
    @State private var isPresenting = false

    public var body: some View {
        StorybookPageView(sample: {
            EmptyView()
        }, options: [
            Option.optionalString(description: "title", text: $title)
        ])
        .navigationTitle(navigationTitle)
        .overlay(alignment: .bottom) {
            Button("샘플 페이지 보기") {
                isPresenting.toggle()
            }
        }
        .fullScreenCover(isPresented: $isPresenting) {
            TopBarSingleTitleSampleView(title: title, isPresenting: $isPresenting)
        }
    }
}

#Preview {
    SingleTitleTopBarView()
}

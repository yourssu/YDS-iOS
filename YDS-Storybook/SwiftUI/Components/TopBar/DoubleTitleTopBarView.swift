//
//  DoubleTitleTopBarView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 11/22/23.
//

import SwiftUI
import YDS_SwiftUI

struct DoubleTitleTopBarView: View {
    let navigationTitle: String = "DoubleTitleTopBar"
    
    @State private var title: String? = "시간표(2안)"
    @State private var subtitle: String? = "2021년 2학기"
    @State private var isPresenting = false
    @State private var modalPresentationStyleSelectedIndex = 0
    
    public var body: some View {
        StorybookPageView(sample: {
            EmptyView()
        }, options: [
            Option.optionalString(description: "title", text: $title),
            Option.optionalString(description: "subtitle", text: $subtitle),
            Option.enum(description: "modalpresentationStyle", cases: [modalPresentationStyle.fullScreen, modalPresentationStyle.automatic], selectedIndex: $modalPresentationStyleSelectedIndex)
        ])
        .navigationTitle(navigationTitle)
        .overlay(alignment: .bottom) {
            Button("샘플 페이지 보기") {
                isPresenting.toggle()
            }
            .fullScreenCover(isPresented: $isPresenting) {
                TopBarDoubleTitleSampleView(isPresenting: $isPresenting, title: title, subtitle: subtitle)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea(edges: .all)
            }
        }
    }
}

#Preview {
    DoubleTitleTopBarView()
}

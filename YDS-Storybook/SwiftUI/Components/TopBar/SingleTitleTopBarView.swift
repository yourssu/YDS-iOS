//
//  SingleTitleTopBarView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 11/22/23.
//

import SwiftUI
import YDS_SwiftUI

public enum modalPresentationStyle{
    case fullScreen
    case automatic
}

struct SingleTitleTopBarView: View {
    let navigationTitle: String = "SingleTitleTopBar"
    
    @State private var title: String? = "커뮤니티"
    @State private var isPresenting = false
    @State private var modalPresentationStyleSelectedIndex = 0
    
    public var body: some View {
        StorybookPageView(sample: {
            EmptyView()
        }, options: [
            Option.optionalString(description: "title", text: $title),
            Option.enum(description: "modalpresentationStyle", cases: [modalPresentationStyle.fullScreen, modalPresentationStyle.automatic], selectedIndex: $modalPresentationStyleSelectedIndex)
        ])
        .navigationTitle(navigationTitle)
        .overlay(alignment: .bottom) {
            Button("샘플 페이지 보기") {
                // 이후 YDSBoxButton이 바뀌면 추가하겠습니다
                isPresenting.toggle()
            }
            .fullScreenCover(isPresented: $isPresenting,
                             onDismiss: didDismiss) {
                TopBarSampleView()
                .onTapGesture {
                    isPresenting.toggle()
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea(edges: .all)
            }
        }
    }


    func didDismiss() {
        // dissmising action
    }
}

#Preview {
    SingleTitleTopBarView()
}

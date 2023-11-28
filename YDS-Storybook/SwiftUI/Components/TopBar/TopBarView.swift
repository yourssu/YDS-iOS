//
//  TopBarView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/23.
//

import SwiftUI
import YDS_SwiftUI

public struct TopBarView: View {
    let navigationTitle: String = "Topbar"
    
    @State var title: String? = "Topbar"
    @State private var isPresenting = false
    @State var modalPresentationStyleSelectedIndex = 0
    
    public var body: some View {
        StorybookPageView(
            sample: {
            EmptyView()
        }, options: [
            Option.optionalString(
                description: "title",
                text: $title
            ),
            Option.enum(
                description: "modalPresentationStyle",
                cases: [modalPresentationStyle.fullScreen, modalPresentationStyle.automatic],
                selectedIndex: $modalPresentationStyleSelectedIndex
            )]
        )
        .navigationTitle(navigationTitle)
        .overlay(alignment: .bottom) {
            YDSBoxButton(text: "샘플 페이지 보기")
            .fullScreenCover(isPresented: $isPresenting) {
                TopBarSampleView(title: title)
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
    TopBarView()
}

//
//  TopBarView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/23.
//

import SwiftUI
import YDS_SwiftUI

public enum ModalPresentationStyle {
    case fullScreen
    case automatic
}

public struct TopBarView: View {
    let navigationTitle: String = "Topbar"

    @State var title: String? = "Topbar"
    @State private var isPresenting = false

    public var body: some View {
        StorybookPageView(
            sample: {
            EmptyView()
        }, options: [
            Option.optionalString(
                description: "title",
                text: $title
            )]
        )
        .navigationTitle(navigationTitle)
        .overlay(alignment: .bottom) {
            Button(action: {
                self.isPresenting.toggle()
            }, label: {
                Text("샘플페이지 보기")
            })
            .padding()
            .fullScreenCover(isPresented: $isPresenting) {
                TopBarSampleView(title: title)
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
    TopBarView()
}

//
//  TopBarSampleView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/24.
//

import SwiftUI
import YDS_SwiftUI
import YDS

public struct TopBarSampleView: View {
    @Binding var isPresenting: Bool
    @State var title: String? = "커뮤니티"
    @State var isLeftButtonSelected: Bool = false
    @State var isRightButtonSelected: Bool = false
    
    public var body: some View {
        NavigationStack {
            VStack {
                Text("")
                    .ydsTopBar($title, isLeftButtonSelected: $isLeftButtonSelected, isRightButtonSelected: $isRightButtonSelected)
                Spacer()
                Button(action: {
                    self.isPresenting.toggle()
                }) {
                    Text("닫기")
                }
            }
        }
    }
}


public struct TopBarSingleTitleSampleView: View {
    @Binding var isPresenting: Bool
    @State var title: String? = "커뮤니티"
    @State var isShowing: Bool = false
    
    public var body: some View {
        NavigationStack {
            Text("")
                .ydsSingleTitleTopBar($title, isShowing: $isShowing)
            Spacer()
            Button(action: {
                self.isPresenting.toggle()
            }) {
                Text("닫기")
            }
        }
    }
    
}

public struct TopBarDoubleTitleSampleView: View {
    @Binding var isPresenting: Bool
    @State var title: String? = "커뮤니티"
    @State var subtitle: String? = "커뮤니티"
    @State var isShowing: Bool = false
    
    public var body: some View {
        NavigationStack {
            Text("")
                .ydsDoubleTitleTopBar(title: $title, subtitle: $subtitle, isShowing: $isShowing)
            Spacer()
            Button(action: {
                self.isPresenting.toggle()
            }) {
                Text("닫기")
            }
        }
    }
}

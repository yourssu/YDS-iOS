//
//  TopBarSampleView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/24.
//
// swiftlint:disable multiple_closures_with_trailing_closure
// swiftlint:disable line_length

import SwiftUI
import YDS_SwiftUI
import YDS

public struct TopBarSampleView: View {
    @State var title: String? = "커뮤니티"
    @State var isLeftButtonSelected: Bool = false
    @State var isRightButtonSelected: Bool = false

    @Environment(\.dismiss) var dismiss

    public var body: some View {
        NavigationStack {
            VStack {
                Text("")
                    .ydsTopBar($title, isLeftButtonSelected: $isLeftButtonSelected, isRightButtonSelected: $isRightButtonSelected)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("닫기")
                }
            }
        }
    }
}

public struct TopBarSingleTitleSampleView: View {
    @State var title: String? = "커뮤니티"
    @State var buttonTitle: String? = "button clicked"
    @State private var isShowing: Bool = false
    @Binding var isPresenting: Bool

    public var body: some View {
        NavigationStack {
            VStack {
                Text("")
                    .ydsSingleTitleTopBar($title, isShowing: $isShowing)
                Spacer()
            }
        }
        .overlay(alignment: .bottom) {
            Button(action: {
                isPresenting.toggle()
            }) {
                Text("닫기")
            }
        }
        .registerYDSToast()
    }
}

public struct TopBarDoubleTitleSampleView: View {
    @State var title: String? = "커뮤니티"
    @State var subtitle: String? = "커뮤니티"
    @State var buttonTitle: String? = "button clicked"
    @State private var isShowing: Bool = false
    @Binding var isPresenting: Bool
    @Environment(\.dismiss) var dismiss

    public var body: some View {
        NavigationStack {
            Text("")
                .ydsDoubleTitleTopBar(title: $title, subtitle: $subtitle, isShowing: $isShowing)
            Spacer()
        }
        .overlay(alignment: .bottom) {
            Button(action: {
                isPresenting.toggle()
            }) {
                Text("닫기")
            }
        }
        .registerYDSToast()
    }
}
// swiftlint:enable multiple_closures_with_trailing_closure
// swiftlint:enable line_length

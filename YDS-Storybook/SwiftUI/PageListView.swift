//
//  PageListView.swift
//  YDS-Storybook
//
//  Created by 정종인 on 2023/08/01.
//

import SwiftUI

struct PageView<ViewType: View>: View {
    let title: String
    @ViewBuilder var content: () -> ViewType
    var body: some View {
        NavigationLink {
            content()
        } label: {
            Text(title)
        }

    }
}

struct PageListView: View {

    // MARK: - List에 들어갈 Section과 Row에 대한 정보

    /// List에 보여지는 Item의 기본 정보입니다
    /// title: Item에 표시될 문자열
    /// body: 해당 Row에 표시될 View의 타입

    ///  각 섹션의 타이틀로 사용될 문자열
    let sections: [String] = ["1. Foundation", "2. Atom", "3. Component"]

    //  여기 아래에 각 단계에 맞는 Page를 추가해주세요.
    @ViewBuilder
    var foundationPages: some View {
        PageView(title: "Color") {
            ColorPageView()
        }
        PageView(title: "Empty") {
            EmptyView()
        }
    }

    @ViewBuilder
    var atomPages: some View {
        PageView(title: "Empty") {
            EmptyView()
        }
    }

    @ViewBuilder
    var componentPages: some View {
        PageView(title: "Empty") {
            EmptyView()
        }
    }

    // MARK: - body
    var body: some View {
        NavigationStack {
            List {
                Section(sections[0]) {
                    foundationPages
                }
                Section(sections[1]) {
                    atomPages
                }
                Section(sections[2]) {
                    componentPages
                }
            }
        }
    }
}

struct PageListView_Previews: PreviewProvider {
    static var previews: some View {
        PageListView()
    }
}

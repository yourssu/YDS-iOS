//
//  PageListView.swift
//  YDS-Storybook
//
//  Created by 정종인 on 2023/08/01.
//

import SwiftUI

struct PageListView: View {

    // MARK: - List에 들어갈 Section과 Row에 대한 정보

    /// List에 보여지는 Item의 기본 정보입니다
    /// title: Item에 표시될 문자열
    /// body: 해당 Row에 표시될 View의 타입
    struct Page: Identifiable {
        var id: String {
            self.title
        }

        let title: String
        let body: any View
    }

    ///  각 섹션의 타이틀로 사용될 문자열
    let sections: [String] = ["1. Foundation", "2. Atom", "3. Component"]

    //  여기 아래에 각 단계에 맞는 Page를 추가해주세요.
    let foundationPages: [Page] = [
        Page(title: "Color", body: ColorPageView())
    ]

    let atomPages: [Page] = [
    ]

    let componentPages: [Page] = [
    ]

    // MARK: - body
    var body: some View {
        let sectionPages: [(String, [Page])] = Array(
            zip(
                sections,
                [foundationPages, atomPages, componentPages]
            )
        )
        NavigationStack {
            List {
                ForEach(sectionPages, id: \.0) { sectionTitle, pages in
                    Section(sectionTitle) {
                        ForEach(pages, id: \.id) { page in
                            NavigationLink {
                                AnyView(page.body)
                            } label: {
                                Text(page.title)
                            }
                        }
                    }
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

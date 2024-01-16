//
//  BottomSheetPageView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/10/31.
//

import SwiftUI
import YDS_SwiftUI

struct BottomSheetPageView: View {
    private enum YourssuDevTeam: String, CaseIterable {
        case iOS = "iOS"
        case android = "Android"
        case backend = "Backend"
        case frontend = "Frontend"
    }

    private enum ExampleCase: Int, CaseIterable {
        case zero = 0
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }

    private let title = "BottomSheetPageView"
    private let allViews = ExampleCase.allCases
    private let allTeams = YourssuDevTeam.allCases

    @State var selectedIndex = 0
    @State var isPresentBottomSheet = false

    private var teams: [String] {
        switch selectedIndex {
        case 0...allTeams.count:
            return allTeams[0..<selectedIndex].map { $0.rawValue }
        default:
            return []
        }
    }

    var body: some View {
            StorybookPageView(
                sample: {
                    EmptyView()
                },
                options: [
                    Option.enum(
                        description: "Views",
                        cases: allViews,
                        selectedIndex: $selectedIndex
                    )
                ]
            )
            .overlay(alignment: .bottom) {
                Button(action: { // 컴포넌트 버튼으로 수정 예정
                    isPresentBottomSheet = true
                }, label: {
                    Text("바텀시트 생성")
                })
                .padding(.bottom, 32)
            }
            .ydsBottomSheet(
                isPresent: $isPresentBottomSheet,
                content: {
                    VStack(alignment: .leading) {
                        ForEach(teams, id: \.self) { team in
                            YDSLabel(text: team, typoStyle: .title1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            )
            .navigationTitle(title)
    }
}

struct BottomSheetPageView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetPageView()
    }
}

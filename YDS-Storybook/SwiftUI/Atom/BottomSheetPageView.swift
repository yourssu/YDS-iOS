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

    private let allViews = ExampleCase.allCases
    private let allTeams = YourssuDevTeam.allCases

    @State var selectedIndex = 0
    @State var isPresentBottomSheet = false

    private var teams: [String] {
        allTeams[0..<selectedIndex].map { $0.rawValue }
    }

    var body: some View {
            StorybookPageView(
                sample: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: YDSScreenSize.width * 3/4 - 32)
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
                Button(action: { // TODO: 컴포넌트 버튼으로 수정
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
                            YDSLabel(text: team, typoStyle: String.TypoStyle.title1.font)
                                .frame(height: 36) // TODO: 이슈 해결 후 수정
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            )
    }
}

struct BottomSheetPageView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetPageView()
    }
}

//
//  BadgePageView.swift
//  YDS-Storybook
//
//  Created by 성현주 on 10/31/23.
//

import SwiftUI
import YDS_SwiftUI

struct BadgePageView: View {
    let title: String = "BadgeView"
    
    @State var text: String? = "광고"
    @State var badgeColorSelectedIndex = 6
    @State var icons: SwiftUIIcon? = YDSSwiftUIIcon.icons[0]
    
    var selectedColor: Color {
        return YDSItemColor.allCases[badgeColorSelectedIndex].backgroundColor
    }
    
    public var body: some View {
        StorybookPageView(sample: {
            VStack {
                GeometryReader { geometry in
                    YDSBadge(
                        text: text,
                        icon: icons?.icon,
                        color: selectedColor
                    )
                    /*Text컬러는 이런식으로 추가가능합니다.
                     .foregroundColor(.blue)*/
                    .frame(maxWidth: .infinity, maxHeight: YDSScreenSize.width * 3/4)
                    .background(
                        Rectangle()
                            .fill(.white) //뱃지의 색과 배경색이 같아 임의로 하얀색으로 조정했습니다.
                    )
                }
            }
        }, options: [
            Option.optionalString(
                description: "text",
                text: $text),
            Option.optionalIcon(
                description: "icon",
                icons: YDSSwiftUIIcon.icons,
                selectedIcon: $icons),
            Option.enum(
                description: "color",
                cases: YDSItemColor.allCases,
                selectedIndex: $badgeColorSelectedIndex)
        ])
        .navigationTitle(title)
    }
}

extension YDSItemColor: CaseIterable {
    public static var allCases: [YDSItemColor] = [
        .mono,
        .green,
        .emerald,
        .aqua,
        .blue,
        .indigo,
        .violet,
        .purple,
        .pink
    ]
}

#Preview("Badge") {
    BadgePageView()
}

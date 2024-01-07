//
//  BoxButtonPageView.swift
//  YDS-Storybook
//
//  Created by 이조은 on 2023/10/30.
//

import SwiftUI
import YDS_SwiftUI

public struct BoxButtonPageView: View {
    let title: String = "BoxButtonView"

    @State var text: String? = "재생"
    @State var int: Int = 0
    @State var leftIcon: SwiftUIIcon?
    @State var rightIcon: SwiftUIIcon?
    @State var typeSelectedIndex: Int = 0
    @State var sizeSelectedIndex: Int = 3
    @State var roundingSelectedIndex: Int = 1
    @State var isDisabled: Bool = false
    @State var isWarned: Bool = false

    public var body: some View {
        StorybookPageView(sample: {
            Button(action: {
                print("YDSBoxButton Click!!")
            }, label: {
                YDSBoxButton(
                    text: text,
                    leftIcon: leftIcon?.icon,
                    rightIcon: rightIcon?.icon,
                    type: YDSBoxButton.BoxButtonType.allCases[typeSelectedIndex],
                    size: YDSBoxButton.BoxButtonSize.allCases[sizeSelectedIndex],
                    rounding: YDSBoxButton.BoxButtonRounding.allCases[roundingSelectedIndex],
                    isDisabled: isDisabled,
                    isWarned: isWarned
                )
            })
            .disabled(isDisabled)
            .frame(height: YDSScreenSize.width * 3/4 - 32)
            .padding(16)
            .clipped()
        }, options: [
            Option.optionalString(
                description: "text",
                text: $text),
            Option.optionalIcon(
                description: "leftIcon",
                icons: YDSSwiftUIIcon.icons,
                selectedIcon: $leftIcon, placeholderIndex: 56),
            Option.optionalIcon(
                description: "rightIcon",
                icons: YDSSwiftUIIcon.icons,
                selectedIcon: $rightIcon, placeholderIndex: 56),
            Option.enum(
                description: "type",
                cases: YDSBoxButton.BoxButtonType.allCases,
                selectedIndex: $typeSelectedIndex),
            Option.enum(
                description: "size",
                cases: YDSBoxButton.BoxButtonSize.allCases,
                selectedIndex: $sizeSelectedIndex),
            Option.enum(
                description: "Rounding",
                cases: YDSBoxButton.BoxButtonRounding.allCases,
                selectedIndex: $roundingSelectedIndex),
            Option.bool(
                description: "isDisabled",
                isOn: $isDisabled),
            Option.bool(
                description: "isWarned",
                isOn: $isWarned)
        ])
        .navigationTitle(title)
    }
}

extension YDSBoxButton.BoxButtonType: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonType] =
    [.filled, .tinted, .line]
}

extension YDSBoxButton.BoxButtonSize: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonSize] =
    [.small, .medium, .large, .extraLarge]
}

extension YDSBoxButton.BoxButtonRounding: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonRounding] =
    [.r4, .r8]
}

struct BoxButtonPageView_Previews: PreviewProvider {
    static var previews: some View {
        BoxButtonPageView()
    }
}

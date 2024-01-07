//
//  PlainButtonPageView.swift
//  YDS-Storybook
//
//  Created by 이조은 on 2023/11/13.
//

import SwiftUI
import YDS_SwiftUI

struct PlainButtonPageView: View {
    let title: String = "PlainButtonView"

    @State private var isPressed = false

    @State var text: String? = "재생"
    @State var int: Int = 0
    @State var leftIcon: SwiftUIIcon? = YDSSwiftUIIcon.icons[56]
    @State var rightIcon: SwiftUIIcon?
    @State var sizeSelectedIndex: Int = 1
    @State var isDisabled: Bool = false
    @State var isWarned: Bool = false
    @State var isPointed: Bool = false

    public var body: some View {
        StorybookPageView(sample: {
            Button(action: {
                print("YDSPlainButton Click!!")
            }, label: {
                YDSPlainButton(
                    text: text,
                    leftIcon: leftIcon?.icon,
                    rightIcon: rightIcon?.icon,
                    size: YDSPlainButton.PlainButtonSize.allCases[sizeSelectedIndex],
                    isDisabled: isDisabled,
                    isWarned: isWarned,
                    isPointed: isPointed
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
                description: "size",
                cases: YDSPlainButton.PlainButtonSize.allCases,
                selectedIndex: $sizeSelectedIndex),
            Option.bool(
                description: "isDisabled",
                isOn: $isDisabled),
            Option.bool(
                description: "isWarned",
                isOn: $isWarned),
            Option.bool(
                description: "isPointed",
                isOn: $isPointed)
        ])
        .navigationTitle(title)
    }
}

extension YDSPlainButton.PlainButtonSize: CaseIterable {
    public static var allCases: [YDSPlainButton.PlainButtonSize] =
    [.small, .medium, .large]
}

struct PlainButtonPageView_Previews: PreviewProvider {
    static var previews: some View {
        PlainButtonPageView()
    }
}

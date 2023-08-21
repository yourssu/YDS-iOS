//
//  IconPageView.swift
//  YDS-Storybook
//
//  Created by 김규철 on 2023/08/18.
//
// swiftlint:disable nesting

import SwiftUI
import YDS_SwiftUI

struct IconsListItem: View {
    private enum Dimension {
        enum Padding {
            static let horizontal: CGFloat = 16
            static let listItem: CGFloat = 8
        }
    }

    let iconInfo: SwiftUIIcon
    var body: some View {
        HStack {
            self.iconInfo.icon
            Text(self.iconInfo.name)
                .font(YDSFont.body1)
                .foregroundColor(YDSColor.textSecondary)
                .padding(.horizontal, Dimension.Padding.horizontal)
        }
        .padding(Dimension.Padding.listItem)
    }
}

struct IconPageView: View {
    private let icons = YDSSwiftUIIcon.icons

    var body: some View {
        List {
            ForEach(icons) { icon in
                IconsListItem(iconInfo: icon)
                    .listRowSeparator(.hidden)
            }
        }
        .clipped()
        .listStyle(.plain)
        .navigationTitle("Icon")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct IconPageView_Previews: PreviewProvider {
    static var previews: some View {
        IconPageView()
    }
}

//
//  ColorPageView.swift
//  YDS-Storybook
//
//  Created by 정종인 on 2023/08/01.
//
// swiftlint:disable nesting

import SwiftUI
import YDS_SwiftUI

struct ColorsListItem: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 4
            static let horizontal: CGFloat = 16
            static let listItem: CGFloat = 8
        }
        enum Circle {
            static let diameter: CGFloat = 48
        }
    }
    let colorInfo: WrappedSwiftUIColor
    var body: some View {
        HStack {
            Circle()
                .stroke(YDSColor.borderNormal, lineWidth: YDSConstant.Border.thin)
                .background(Circle().fill(self.colorInfo.color ?? .clear))
                .frame(width: Dimension.Circle.diameter, height: Dimension.Circle.diameter)
            VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
                Text(self.colorInfo.name)
                    .font(YDSFont.subtitle2)
                    .foregroundColor(YDSColor.textPrimary)
                Text(self.colorInfo.basicColorName)
                    .font(YDSFont.body2)
                    .foregroundColor(YDSColor.textTertiary)
            }
            .padding(.horizontal, Dimension.Spacing.horizontal)
        }
        .padding(Dimension.Spacing.listItem)
    }
}

struct ColorPageView: View {
    private let colors = YDSSwiftUIColorWrapper.colors
    var body: some View {
        List {
            ForEach(colors, id: \.id) { wrappedColors in
                Section {
                    ForEach(wrappedColors.items, id: \.id) { color in
                        ColorsListItem(colorInfo: color)
                            .listRowSeparator(.hidden)
                    }
                } header: {
                    Text(wrappedColors.description ?? "")
                }
            }
        }
        .clipped()
        .listStyle(.plain)
        .navigationTitle("Color")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ColorPageView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPageView()
    }
}
// swiftlint:enable nesting

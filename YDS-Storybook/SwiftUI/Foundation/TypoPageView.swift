//
//  TypoPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/08/22.
//
// swiftlint:disable nesting

import SwiftUI
import YDS_SwiftUI

struct TypoListItem: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 16
            static let hstack: CGFloat = 30
            static let textSpacing: CGFloat = 9
            static let listItem: CGFloat = 2
        }

        enum Padding {
            static let id: CGFloat = 10
            static let hstack: CGFloat = 15
        }

        enum Rectangle {
            static let idCornerRadius: CGFloat = 2
            static let idHeight: CGFloat = 24
            static let infoCornerRadius: CGFloat = 8
            static let infoHeight: CGFloat = 95
        }
    }
    let fontInfo: WrappedSwiftUITypo
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            HStack {
                Text(self.fontInfo.id)
                    .font(YDSFont.caption1)
                    .foregroundColor(YDSColor.monoItemText)
                    .padding(.leading, Dimension.Padding.id)
                Spacer()
            }
            .background {
                RoundedRectangle(cornerRadius: Dimension.Rectangle.idCornerRadius)
                    .fill(YDSColor.monoItemBG)
                    .frame(height: Dimension.Rectangle.idHeight)
            }
            .padding(.top, Dimension.Padding.hstack)
            Text(SampleLabel.sampleLabel)
                .font(self.fontInfo.font ?? .title2)
                .foregroundColor(YDSColor.textPrimary)
            HStack(spacing: Dimension.Spacing.hstack) {
                VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                    Group {
                        Text("size")
                        Text("weight")
                        Text("lineHeight")
                    }
                    .font(YDSFont.subtitle3)
                    .foregroundColor(YDSColor.textTertiary)
                }
                .padding(.leading, Dimension.Padding.hstack)
                VStack(alignment: .leading, spacing: Dimension.Spacing.textSpacing) {
                    Group {
                        Text(self.fontInfo.size)
                        Text(self.fontInfo.weight)
                        Text(self.fontInfo.lineHeight)
                    }
                    .font(YDSFont.body2)
                    .foregroundColor(YDSColor.monoItemText)
                }
                Spacer()
            }
            .background {
                RoundedRectangle(cornerRadius: Dimension.Rectangle.infoCornerRadius)
                    .fill(YDSColor.monoItemBG)
                    .frame(height: Dimension.Rectangle.infoHeight)
            }
            .padding(.vertical, Dimension.Padding.hstack)
        }
        .padding(.horizontal, Dimension.Spacing.listItem)
    }
}

struct TypoPageView: View {
    private let fonts = YDSSwiftUITypoWrapper.fonts
    var body: some View {
        List {
            ForEach(fonts) { wrappedFonts in
                Section {
                    ForEach(wrappedFonts.items) { font in
                        TypoListItem(fontInfo: font)
                    }
                } header: {
                    Text(wrappedFonts.description ?? "")
                }
            }
        }
        .clipped()
        .listStyle(.plain)
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TypoPageView_Previews: PreviewProvider {
    static var previews: some View {
        TypoPageView()
    }
}
// swiftlint:enable nesting

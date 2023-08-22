//
//  TypoPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/08/22.
//
// swiftlint:disable nesting
// swiftlint:disable line_length

import SwiftUI
import YDS_SwiftUI

struct TypoListItem: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 16
            static let horizontal: CGFloat = 20
            static let listItem: CGFloat = 2
        }

        enum Description {
            enum Padding {
                static let vertical: CGFloat = 8
                static let horizontal: CGFloat = 20
            }
        }
    }
    let fontInfo: WrappedSwiftUITypo
    var body: some View {
        HStack {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(YDSColor.monoItemBG)
                            .frame(height: 24)
                        HStack {
                            Text(self.fontInfo.id)
                                .font(YDSFont.caption1)
                                .foregroundColor(YDSColor.monoItemText)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    }
                    Text("계절이 지나가는 하늘에는 가을로 가득 차 있습니다.\n나는 아무 걱정도 없이 가을 속의 별들을 다 헬 듯합니다.\n가슴 속에 하나 둘 새겨지는 별을 이제 다 못 헤는 것은 쉬이 아침이 오는 까닭이요, 내일 밤이 남은 까닭이요, 아직 나의 청춘이 다하지 않은 까닭입니다.")
                        .font(self.fontInfo.font ?? .title2)
                        .foregroundColor(YDSColor.textPrimary)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(YDSColor.monoItemBG)
                            .frame(height: 90)
                        VStack(spacing: 7) {
                            HStack {
                                Text("size")
                                    .font(YDSFont.subtitle3)
                                    .foregroundColor(YDSColor.textTertiary)
                                    .padding(.horizontal, -155)
                                Text(self.fontInfo.size)
                                    .font(YDSFont.body2)
                                    .foregroundColor(YDSColor.monoItemText)
                                    .padding(.horizontal, -55)
                            }
                            HStack {
                                Text("weight")
                                    .font(YDSFont.subtitle3)
                                    .foregroundColor(YDSColor.textTertiary)
                                    .padding(.horizontal, -155)
                                Text(self.fontInfo.weight)
                                    .font(YDSFont.body2)
                                    .foregroundColor(YDSColor.monoItemText)
                                    .padding(.horizontal, -55)
                            }
                            HStack {
                                Text("lineHeight")
                                    .font(YDSFont.subtitle3)
                                    .foregroundColor(YDSColor.textTertiary)
                                    .padding(.horizontal, 16)
                                Spacer()
                                Text(self.fontInfo.lineHeight)
                                    .font(YDSFont.body2)
                                    .foregroundColor(YDSColor.monoItemText)
                                    .padding(.horizontal, -225)
                            }
                        }
                    }
                }
            }
        }
        .padding(Dimension.Spacing.listItem)
    }
}

struct TypoPageView: View {
    private let fonts = YDSSwiftUITypoWrapper.fonts
    private let colors = YDSSwiftUIColorWrapper.colors
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
// swiftlint:enable line_length

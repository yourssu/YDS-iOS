//
//  SwiftUIYDSTypoArray.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/08/22.
//
// swiftlint:disable line_length

import SwiftUI
import YDS_SwiftUI

struct WrappedSwiftUITypo {
    let font: Font?
    let typoStyle: String
    let size: String
    let weight: String
    let lineHeight: String
}

extension WrappedSwiftUITypo: CustomStringConvertible {
    var description: String {
        return self.typoStyle
    }
}

extension WrappedSwiftUITypo: Identifiable {
    var id: String {
        return self.typoStyle
    }
}

struct WrappedSwiftUITypos {
    let items: [WrappedSwiftUITypo]
    let description: String?
}

extension WrappedSwiftUITypos: Identifiable {
    var id: UUID {
        UUID()
    }
}

struct YDSSwiftUITypoWrapper {
   static let fonts = [
        displayFonts,
        titleFonts,
        subtitleFonts,
        bodyFonts,
        buttonFonts,
        captionFonts
   ]
    
    static let displayFonts = WrappedSwiftUITypos(
        items: [
            WrappedSwiftUITypo(font: YDSFont.display1, typoStyle: "display1", size: "40pt", weight: "Bold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.display2, typoStyle: "display2", size: "32pt", weight: "Bold", lineHeight: "130%")
        ],
        description: "Display"
    )

    static let titleFonts = WrappedSwiftUITypos(
        items: [
            WrappedSwiftUITypo(font: YDSFont.title1, typoStyle: "title1", size: "28pt", weight: "Bold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.title2, typoStyle: "title2", size: "24pt", weight: "Bold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.title3, typoStyle: "title3", size: "20pt", weight: "Bold", lineHeight: "130%")
        ],
        description: "Title"
    )

    static let subtitleFonts = WrappedSwiftUITypos(
        items: [
            WrappedSwiftUITypo(font: YDSFont.subtitle1, typoStyle: "title1", size: "20pt", weight: "Semibold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.subtitle2, typoStyle: "title2", size: "16pt", weight: "Semibold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.subtitle3, typoStyle: "title3", size: "14pt", weight: "Semibold", lineHeight: "130%")
        ],
        description: "Subtitle"
    )

    static let bodyFonts = WrappedSwiftUITypos(
        items: [
            WrappedSwiftUITypo(font: YDSFont.body1, typoStyle: "body1", size: "15pt", weight: "Regular", lineHeight: "150%"),
            WrappedSwiftUITypo(font: YDSFont.body2, typoStyle: "body2", size: "14pt", weight: "Regular", lineHeight: "150%")
        ],
        description: "Body"
    )

    static let buttonFonts = WrappedSwiftUITypos(
        items: [
            WrappedSwiftUITypo(font: YDSFont.button0, typoStyle: "button0", size: "16pt", weight: "Medium", lineHeight: "140%"),
            WrappedSwiftUITypo(font: YDSFont.button1, typoStyle: "button1", size: "16pt", weight: "Semibold", lineHeight: "140%"),
            WrappedSwiftUITypo(font: YDSFont.button2, typoStyle: "button2", size: "14pt", weight: "Semibold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.button3, typoStyle: "button3", size: "14pt", weight: "Regular", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.button4, typoStyle: "button4", size: "12pt", weight: "Medium", lineHeight: "140%")
        ],
        description: "Button"
    )

    static let captionFonts = WrappedSwiftUITypos(
        items: [
            WrappedSwiftUITypo(font: YDSFont.caption0, typoStyle: "caption0", size: "12pt", weight: "Semibold", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.caption1, typoStyle: "caption1", size: "12pt", weight: "Regular", lineHeight: "130%"),
            WrappedSwiftUITypo(font: YDSFont.caption2, typoStyle: "caption2", size: "11pt", weight: "Regular", lineHeight: "130%")
        ],
        description: "Caption"
    )
}
// swiftlint:enable line_length

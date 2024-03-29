//
//  SwiftUIYDSColorArray.swift
//  YDS-Storybook
//
//  Created by 오동규 on 2023/08/19.
//
// swiftlint:disable line_length

import SwiftUI
import YDS_SwiftUI

struct WrappedSwiftUIColor {
    let color: Color?
    let name: String
    let basicColorName: String
}

extension WrappedSwiftUIColor: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

extension WrappedSwiftUIColor: Identifiable {
    var id: String {
        return self.name
    }
}

struct WrappedSwiftUIColors {
    let items: [WrappedSwiftUIColor]
    let description: String?
}

extension WrappedSwiftUIColors: Identifiable {
    var id: UUID {
        UUID()
    }
}

struct YDSSwiftUIColorWrapper {
    static let colors = [
        backgroundColors,
        textColors,
        dimColors,
        borderColors,
        buttonColors,
        bottomBarColors,
        inputFieldColors,
        toastColors,
        tooltipColors,
        pickerColors,
        pressedColors,
        shadowColors,
        monoItemColors,
        greenItemColors,
        emeraldItemColors,
        aquaItemColors,
        blueItemColors,
        indigoItemColors,
        violetItemColors,
        purpleItemColors,
        pinkItemColors
    ]

    static let backgroundColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.bgNormal, name: "bgNormal", basicColorName: "white000 / black000"),
            WrappedSwiftUIColor(color: YDSColor.bgElevated, name: "bgElevated", basicColorName: "white000 / black000"),
            WrappedSwiftUIColor(color: YDSColor.bgRecomment, name: "bgRecomment", basicColorName: "gray050 / realBlack"),
            WrappedSwiftUIColor(color: YDSColor.bgPressed, name: "bgPressed", basicColorName: "black000A10 / white000A5"),
            WrappedSwiftUIColor(color: YDSColor.bgSelected, name: "bgSelected", basicColorName: "black000A10 / white000A5"),
            WrappedSwiftUIColor(color: YDSColor.bgNormalDark, name: "bgNormalDark", basicColorName: "realBlack / realBlack"),
            WrappedSwiftUIColor(color: YDSColor.bgElevatedDark, name: "bgElevatedDark", basicColorName: "realBlack / realBlack"),
            WrappedSwiftUIColor(color: YDSColor.bgDimDark, name: "bgDimDark", basicColorName: "gray900A30 / black000A30")
        ],
        description: "Background"
    )

    static let textColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.textPrimary, name: "textPrimary", basicColorName: "black000 / gray900"),
            WrappedSwiftUIColor(color: YDSColor.textSecondary, name: "textSecondary", basicColorName: "gray900 / gray800"),
            WrappedSwiftUIColor(color: YDSColor.textTertiary, name: "textTertiary", basicColorName: "gray600 / gray600"),
            WrappedSwiftUIColor(color: YDSColor.textDisabled, name: "textDisabled", basicColorName: "gray500/ gray400"),
            WrappedSwiftUIColor(color: YDSColor.textBright, name: "textBright", basicColorName: "white000 / white000"),
            WrappedSwiftUIColor(color: YDSColor.textPointed, name: "textPointed", basicColorName: "pointColor400 / pointColor400"),
            WrappedSwiftUIColor(color: YDSColor.textWarned, name: "textWarned", basicColorName: "warningRed400 / warningRed400")
        ],
        description: "Text"
    )

    static let dimColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.dimNormal, name: "dimNormal", basicColorName: "gray900A30 / black000A30"),
            WrappedSwiftUIColor(color: YDSColor.dimThick, name: "dimThick", basicColorName: "gray900A70 / black000A70"),
            WrappedSwiftUIColor(color: YDSColor.dimThickBright, name: "dimThickBright", basicColorName: "white000A70 / white000A70")
        ],
        description: "Dim"
    )

    static let borderColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.borderThin, name: "borderThin", basicColorName: "gray100 / gray100"),
            WrappedSwiftUIColor(color: YDSColor.borderNormal, name: "borderNormal", basicColorName: "black000A10 / white000A10"),
            WrappedSwiftUIColor(color: YDSColor.borderThick, name: "borderThick", basicColorName: "gray500 / gray500")
        ],
        description: "Border"
    )

    static let buttonColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.buttonNormal, name: "buttonNormal", basicColorName: "gray700 / gray700"),
            WrappedSwiftUIColor(color: YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColorName: "gray600 / gray600"),
            WrappedSwiftUIColor(color: YDSColor.buttonBG, name: "buttonBG", basicColorName: "gray200 / gray200"),
            WrappedSwiftUIColor(color: YDSColor.buttonEmojiBG, name: "buttonEmojiBG", basicColorName: "gray100 / gray100"),
            WrappedSwiftUIColor(color: YDSColor.buttonBright, name: "buttonBright", basicColorName: "white000 / white000"),
            WrappedSwiftUIColor(color: YDSColor.buttonDisabled, name: "buttonDisabled", basicColorName: "gray500 / gray500"),
            WrappedSwiftUIColor(color: YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColorName: "gray200 / gray200"),
            WrappedSwiftUIColor(color: YDSColor.buttonPoint, name: "buttonPoint", basicColorName: "pointColor400 / pointColor400"),
            WrappedSwiftUIColor(color: YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColorName: "pointColor300 / pointColor300"),
            WrappedSwiftUIColor(color: YDSColor.buttonPointBG, name: "buttonPointBG", basicColorName: "pointColor050 / pointColor050"),
            WrappedSwiftUIColor(color: YDSColor.buttonWarned, name: "buttonWarned", basicColorName: "warningRed400 / warningRed400"),
            WrappedSwiftUIColor(color: YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColorName: "warningRed300 / warningRed300"),
            WrappedSwiftUIColor(color: YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColorName: "warningRed050 / warningRed050")
        ],
        description: "Button"
    )

    static let bottomBarColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColorName: "gray600 / gray600"),
            WrappedSwiftUIColor(color: YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColorName: "gray800 / gray800")
        ],
        description: "BottomBar"
    )

    static let inputFieldColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColorName: "white000 / black000"),
            WrappedSwiftUIColor(color: YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColorName: "gray100 / gray100")
        ],
        description: "InputField"
    )

    static let toastColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.toastBG, name: "toastBG", basicColorName: "gray800 / gray300")
        ],
        description: "Toast"
    )

    static let tooltipColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.tooltipBG, name: "tooltipBG", basicColorName: "gray700 / gray400"),
            WrappedSwiftUIColor(color: YDSColor.tooltipPoint, name: "tooltipPoint", basicColorName: "pointColor400 / pointColor400")
        ],
        description: "Tooltip"
    )

    static let pickerColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.dimPickerReverse, name: "dimPickerReverse", basicColorName: "white000A70 / white000A70")
        ],
        description: "Picker"
    )

    static let pressedColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.pressed, name: "pressed", basicColorName: "black000A10 / white000A10")
        ],
        description: "Pressed"
    )

    static let shadowColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.shadowThin, name: "shadowThin", basicColorName: "gray400"),
            WrappedSwiftUIColor(color: YDSColor.shadowNormal, name: "shadowNormal", basicColorName: "gray500")
        ],
        description: "Shadow"
    )

    static let monoItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColorName: "gray700 / gray700"),
            WrappedSwiftUIColor(color: YDSColor.monoItemBG, name: "monoItemBG", basicColorName: "gray100 / gray100"),
            WrappedSwiftUIColor(color: YDSColor.monoItemText, name: "monoItemText", basicColorName: "gray800 / gray800")
        ],
        description: "MonoItem"
    )

    static let greenItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColorName: "green300"),
            WrappedSwiftUIColor(color: YDSColor.greenItemBG, name: "greenItemBG", basicColorName: "green050"),
            WrappedSwiftUIColor(color: YDSColor.greenItemText, name: "greenItemText", basicColorName: "green800")
        ],
        description: "GreenItem"
    )

    static let emeraldItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColorName: "emerald300 / emerald300"),
            WrappedSwiftUIColor(color: YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColorName: "emerald050 / emerald050"),
            WrappedSwiftUIColor(color: YDSColor.emeraldItemText, name: "emeraldItemText", basicColorName: "emerald800 / emerald800")
        ],
        description: "EmeraldItem"
    )

    static let aquaItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColorName: "aqua300 / aqua300"),
            WrappedSwiftUIColor(color: YDSColor.aquaItemBG, name: "aquaItemBG", basicColorName: "aqua050 / aqua050"),
            WrappedSwiftUIColor(color: YDSColor.aquaItemText, name: "aquaItemText", basicColorName: "aqua700 / aqua700")
        ],
        description: "AquaItem"
    )

    static let blueItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColorName: "blue300 / blue300"),
            WrappedSwiftUIColor(color: YDSColor.blueItemBG, name: "blueItemBG", basicColorName: "blue050 / blue050"),
            WrappedSwiftUIColor(color: YDSColor.blueItemText, name: "blueItemText", basicColorName: "blue700 / blue700")
        ],
        description: "BlueItem"
    )

    static let indigoItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColorName: "indigo300 / indigo300"),
            WrappedSwiftUIColor(color: YDSColor.indigoItemBG, name: "indigoItemBG", basicColorName: "indigo050 / indigo050"),
            WrappedSwiftUIColor(color: YDSColor.indigoItemText, name: "indigoItemText", basicColorName: "indigo400 / indigo400")
        ],
        description: "IndigoItem"
    )

    static let violetItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColorName: "violet300 / violet300"),
            WrappedSwiftUIColor(color: YDSColor.violetItemBG, name: "violetItemBG", basicColorName: "violet050 / violet050"),
            WrappedSwiftUIColor(color: YDSColor.violetItemText, name: "violetItemText", basicColorName: "violet400 / violet400")
        ],
        description: "VioletItem"
    )

    static let purpleItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColorName: "purple300 / purple300"),
            WrappedSwiftUIColor(color: YDSColor.purpleItemBG, name: "purpleItemBG", basicColorName: "purple050 / purple050"),
            WrappedSwiftUIColor(color: YDSColor.purpleItemText, name: "purpleItemText", basicColorName: "purple400 / purple400")
        ],
        description: "PurpleItem"
    )

    static let pinkItemColors = WrappedSwiftUIColors(
        items: [
            WrappedSwiftUIColor(color: YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColorName: "pink300 / pink300"),
            WrappedSwiftUIColor(color: YDSColor.pinkItemBG, name: "pinkItemBG", basicColorName: "pink050 / pink050"),
            WrappedSwiftUIColor(color: YDSColor.pinkItemText, name: "pinkItemText", basicColorName: "pink600 / pink600")
        ],
        description: "PinkItem"
    )
}

// swiftlint:enable line_length

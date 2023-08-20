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
    let color: SwiftUI.Color?
    let name: String
    let basicColorName: String
}

extension WrappedSwiftUIColor: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

struct WrappedSwiftUIColors {
    let items: [WrappedSwiftUIColor]
    let description: String?
}

private let backgroundColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgNormal, name: "bgNormal", basicColorName: "white000 / black000"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgElevated, name: "bgElevated", basicColorName: "white000 / black000"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgRecomment, name: "bgRecomment", basicColorName: "gray050 / realBlack"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgPressed, name: "bgPressed", basicColorName: "black000A10 / white000A5"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgSelected, name: "bgSelected", basicColorName: "black000A10 / white000A5"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgNormalDark, name: "bgNormalDark", basicColorName: "realBlack / realBlack"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgElevatedDark, name: "bgElevatedDark", basicColorName: "realBlack / realBlack"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bgDimDark, name: "bgDimDark", basicColorName: "gray900A30 / black000A30")
    ],
    description: "Background"
)

private let textColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textPrimary, name: "textPrimary", basicColorName: "black000 / gray900"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textSecondary, name: "textSecondary", basicColorName: "gray900 / gray800"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textTertiary, name: "textTertiary", basicColorName: "gray600 / gray600"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textDisabled, name: "textDisabled", basicColorName: "gray500/ gray400"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textBright, name: "textBright", basicColorName: "white000 / white000"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textPointed, name: "textPointed", basicColorName: "pointColor400 / pointColor400"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.textWarned, name: "textWarned", basicColorName: "warningRed400 / warningRed400")
    ],
    description: "Text"
)

private let dimColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.dimNormal, name: "dimNormal", basicColorName: "gray900A30 / black000A30"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.dimThick, name: "dimThick", basicColorName: "gray900A70 / black000A70"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.dimThickBright, name: "dimThickBright", basicColorName: "white000A70 / white000A70")
    ],
    description: "Dim"
)

private let borderColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.borderThin, name: "borderThin", basicColorName: "gray100 / gray100"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.borderNormal, name: "borderNormal", basicColorName: "black000A10 / white000A10"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.borderThick, name: "borderThick", basicColorName: "gray500 / gray500")
    ],
    description: "Border"
)

private let buttonColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonNormal, name: "buttonNormal", basicColorName: "gray700 / gray700"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColorName: "gray600 / gray600"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonBG, name: "buttonBG", basicColorName: "gray200 / gray200"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonEmojiBG, name: "buttonEmojiBG", basicColorName: "gray100 / gray100"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonBright, name: "buttonBright", basicColorName: "white000 / white000"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonDisabled, name: "buttonDisabled", basicColorName: "gray500 / gray500"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColorName: "gray200 / gray200"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonPoint, name: "buttonPoint", basicColorName: "pointColor400 / pointColor400"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColorName: "pointColor300 / pointColor300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonPointBG, name: "buttonPointBG", basicColorName: "pointColor050 / pointColor050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonWarned, name: "buttonWarned", basicColorName: "warningRed400 / warningRed400"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColorName: "warningRed300 / warningRed300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColorName: "warningRed050 / warningRed050")
    ],
    description: "Button"
)

private let bottomBarColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColorName: "gray600 / gray600"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColorName: "gray800 / gray800")
    ],
    description: "BottomBar"
)

private let inputFieldColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColorName: "white000 / black000"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColorName: "gray100 / gray100")
    ],
    description: "InputField"
)

private let toastColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.toastBG, name: "toastBG", basicColorName: "gray800 / gray300")
    ],
    description: "Toast"
)

private let tooltipColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.tooltipBG, name: "tooltipBG", basicColorName: "gray700 / gray400"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.tooltipPoint, name: "tooltipPoint", basicColorName: "pointColor400 / pointColor400")
    ],
    description: "Tooltip"
)

private let pickerColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.dimPickerReverse, name: "dimPickerReverse", basicColorName: "white000A70 / white000A70")
    ],
    description: "Picker"
)

private let pressedColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.pressed, name: "pressed", basicColorName: "black000A10 / white000A10")
    ],
    description: "Pressed"
)

private let shadowColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.shadowThin, name: "shadowThin", basicColorName: "gray400"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.shadowNormal, name: "shadowNormal", basicColorName: "gray500")
    ],
    description: "Shadow"
)

private let monoItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColorName: "gray700 / gray700"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.monoItemBG, name: "monoItemBG", basicColorName: "gray100 / gray100"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.monoItemText, name: "monoItemText", basicColorName: "gray800 / gray800")
    ],
    description: "MonoItem"
)

private let greenItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColorName: "green300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.greenItemBG, name: "greenItemBG", basicColorName: "green050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.greenItemText, name: "greenItemText", basicColorName: "green800")
    ],
    description: "GreenItem"
)

private let emeraldItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColorName: "emerald300 / emerald300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColorName: "emerald050 / emerald050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.emeraldItemText, name: "emeraldItemText", basicColorName: "emerald800 / emerald800")
    ],
    description: "EmeraldItem"
)

private let aquaItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColorName: "aqua300 / aqua300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.aquaItemBG, name: "aquaItemBG", basicColorName: "aqua050 / aqua050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.aquaItemText, name: "aquaItemText", basicColorName: "aqua700 / aqua700")
    ],
    description: "AquaItem"
)

private let blueItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColorName: "blue300 / blue300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.blueItemBG, name: "blueItemBG", basicColorName: "blue050 / blue050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.blueItemText, name: "blueItemText", basicColorName: "blue700 / blue700")
    ],
    description: "BlueItem"
)

private let indigoItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColorName: "indigo300 / indigo300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.indigoItemBG, name: "indigoItemBG", basicColorName: "indigo050 / indigo050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.indigoItemText, name: "indigoItemText", basicColorName: "indigo400 / indigo400")
    ],
    description: "IndigoItem"
)

private let violetItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColorName: "violet300 / violet300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.violetItemBG, name: "violetItemBG", basicColorName: "violet050 / violet050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.violetItemText, name: "violetItemText", basicColorName: "violet400 / violet400")
    ],
    description: "VioletItem"
)

private let purpleItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColorName: "purple300 / purple300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.purpleItemBG, name: "purpleItemBG", basicColorName: "purple050 / purple050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.purpleItemText, name: "purpleItemText", basicColorName: "purple400 / purple400")
    ],
    description: "PurpleItem"
)

private let pinkItemColors = WrappedSwiftUIColors(
    items: [
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColorName: "pink300 / pink300"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.pinkItemBG, name: "pinkItemBG", basicColorName: "pink050 / pink050"),
        WrappedSwiftUIColor(color: YDS_SwiftUI.YDSColor.pinkItemText, name: "pinkItemText", basicColorName: "pink600 / pink600")
    ],
    description: "PinkItem"
)

let wrappedSwiftUIColors = [
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

// swiftlint:enable line_length

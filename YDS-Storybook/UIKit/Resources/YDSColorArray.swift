//
//  YDSColorArray.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/12.
//

// swiftlint:disable line_length

import UIKit
import YDS

struct WrappedUIKitColor {
    let color: UIColor?
    let name: String
    let basicColorName: String
}

extension WrappedUIKitColor: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

struct WrappedUIKitColors {
    let items: [WrappedUIKitColor]
    let description: String?
}

private let backgroundColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.bgNormal, name: "bgNormal", basicColorName: "white000 / black000"),
        WrappedUIKitColor(color: YDSColor.bgElevated, name: "bgElevated", basicColorName: "white000 / black000"),
        WrappedUIKitColor(color: YDSColor.bgRecomment, name: "bgRecomment", basicColorName: "gray050 / realBlack"),
        WrappedUIKitColor(color: YDSColor.bgPressed, name: "bgPressed", basicColorName: "black000A10 / white000A5"),
        WrappedUIKitColor(color: YDSColor.bgSelected, name: "bgSelected", basicColorName: "black000A10 / white000A5"),
        WrappedUIKitColor(color: YDSColor.bgNormalDark, name: "bgNormalDark", basicColorName: "realBlack / realBlack"),
        WrappedUIKitColor(color: YDSColor.bgElevatedDark, name: "bgElevatedDark", basicColorName: "realBlack / realBlack"),
        WrappedUIKitColor(color: YDSColor.bgDimDark, name: "bgDimDark", basicColorName: "gray900A30 / black000A30")
    ],
    description: "Background"
)

private let textColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.textPrimary, name: "textPrimary", basicColorName: "black000 / gray900"),
        WrappedUIKitColor(color: YDSColor.textSecondary, name: "textSecondary", basicColorName: "gray900 / gray800"),
        WrappedUIKitColor(color: YDSColor.textTertiary, name: "textTertiary", basicColorName: "gray600 / gray600"),
        WrappedUIKitColor(color: YDSColor.textDisabled, name: "textDisabled", basicColorName: "gray500/ gray400"),
        WrappedUIKitColor(color: YDSColor.textBright, name: "textBright", basicColorName: "white000 / white000"),
        WrappedUIKitColor(color: YDSColor.textPointed, name: "textPointed", basicColorName: "pointColor400 / pointColor400"),
        WrappedUIKitColor(color: YDSColor.textWarned, name: "textWarned", basicColorName: "warningRed400 / warningRed400")
    ],
    description: "Text"
)

private let dimColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.dimNormal, name: "dimNormal", basicColorName: "gray900A30 / black000A30"),
        WrappedUIKitColor(color: YDSColor.dimThick, name: "dimThick", basicColorName: "gray900A70 / black000A70"),
        WrappedUIKitColor(color: YDSColor.dimThickBright, name: "dimThickBright", basicColorName: "white000A70 / white000A70")
    ],
    description: "Dim"
)

private let borderColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.borderThin, name: "borderThin", basicColorName: "gray100 / gray100"),
        WrappedUIKitColor(color: YDSColor.borderNormal, name: "borderNormal", basicColorName: "black000A10 / white000A10"),
        WrappedUIKitColor(color: YDSColor.borderThick, name: "borderThick", basicColorName: "gray500 / gray500")
    ],
    description: "Border"
)

private let buttonColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.buttonNormal, name: "buttonNormal", basicColorName: "gray700 / gray700"),
        WrappedUIKitColor(color: YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColorName: "gray600 / gray600"),
        WrappedUIKitColor(color: YDSColor.buttonBG, name: "buttonBG", basicColorName: "gray200 / gray200"),
        WrappedUIKitColor(color: YDSColor.buttonEmojiBG, name: "buttonEmojiBG", basicColorName: "gray100 / gray100"),
        WrappedUIKitColor(color: YDSColor.buttonBright, name: "buttonBright", basicColorName: "white000 / white000"),
        WrappedUIKitColor(color: YDSColor.buttonDisabled, name: "buttonDisabled", basicColorName: "gray500 / gray500"),
        WrappedUIKitColor(color: YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColorName: "gray200 / gray200"),
        WrappedUIKitColor(color: YDSColor.buttonPoint, name: "buttonPoint", basicColorName: "pointColor400 / pointColor400"),
        WrappedUIKitColor(color: YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColorName: "pointColor300 / pointColor300"),
        WrappedUIKitColor(color: YDSColor.buttonPointBG, name: "buttonPointBG", basicColorName: "pointColor050 / pointColor050"),
        WrappedUIKitColor(color: YDSColor.buttonWarned, name: "buttonWarned", basicColorName: "warningRed400 / warningRed400"),
        WrappedUIKitColor(color: YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColorName: "warningRed300 / warningRed300"),
        WrappedUIKitColor(color: YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColorName: "warningRed050 / warningRed050")
    ],
    description: "Button"
)

private let bottomBarColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColorName: "gray600 / gray600"),
        WrappedUIKitColor(color: YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColorName: "gray800 / gray800")
    ],
    description: "BottomBar"
)

private let inputFieldColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColorName: "white000 / black000"),
        WrappedUIKitColor(color: YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColorName: "gray100 / gray100")
    ],
    description: "InputField"
)

private let toastColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.toastBG, name: "toastBG", basicColorName: "gray800 / gray300")
    ],
    description: "Toast"
)

private let tooltipColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.tooltipBG, name: "tooltipBG", basicColorName: "gray700 / gray400"),
        WrappedUIKitColor(color: YDSColor.tooltipPoint, name: "tooltipPoint", basicColorName: "pointColor400 / pointColor400")
    ],
    description: "Tooltip"
)

private let pickerColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.dimPickerReverse, name: "dimPickerReverse", basicColorName: "white000A70 / white000A70")
    ],
    description: "Picker"
)

private let pressedColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.pressed, name: "pressed", basicColorName: "black000A10 / white000A10")
    ],
    description: "Pressed"
)

private let shadowColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.shadowThin, name: "shadowThin", basicColorName: "gray400"),
        WrappedUIKitColor(color: YDSColor.shadowNormal, name: "shadowNormal", basicColorName: "gray500")
    ],
    description: "Shadow"
)

private let monoItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColorName: "gray700 / gray700"),
        WrappedUIKitColor(color: YDSColor.monoItemBG, name: "monoItemBG", basicColorName: "gray100 / gray100"),
        WrappedUIKitColor(color: YDSColor.monoItemText, name: "monoItemText", basicColorName: "gray800 / gray800")
    ],
    description: "MonoItem"
)

private let greenItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColorName: "green300"),
        WrappedUIKitColor(color: YDSColor.greenItemBG, name: "greenItemBG", basicColorName: "green050"),
        WrappedUIKitColor(color: YDSColor.greenItemText, name: "greenItemText", basicColorName: "green800")
    ],
    description: "GreenItem"
)

private let emeraldItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColorName: "emerald300 / emerald300"),
        WrappedUIKitColor(color: YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColorName: "emerald050 / emerald050"),
        WrappedUIKitColor(color: YDSColor.emeraldItemText, name: "emeraldItemText", basicColorName: "emerald800 / emerald800")
    ],
    description: "EmeraldItem"
)

private let aquaItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColorName: "aqua300 / aqua300"),
        WrappedUIKitColor(color: YDSColor.aquaItemBG, name: "aquaItemBG", basicColorName: "aqua050 / aqua050"),
        WrappedUIKitColor(color: YDSColor.aquaItemText, name: "aquaItemText", basicColorName: "aqua700 / aqua700")
    ],
    description: "AquaItem"
)

private let blueItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColorName: "blue300 / blue300"),
        WrappedUIKitColor(color: YDSColor.blueItemBG, name: "blueItemBG", basicColorName: "blue050 / blue050"),
        WrappedUIKitColor(color: YDSColor.blueItemText, name: "blueItemText", basicColorName: "blue700 / blue700")
    ],
    description: "BlueItem"
)

private let indigoItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColorName: "indigo300 / indigo300"),
        WrappedUIKitColor(color: YDSColor.indigoItemBG, name: "indigoItemBG", basicColorName: "indigo050 / indigo050"),
        WrappedUIKitColor(color: YDSColor.indigoItemText, name: "indigoItemText", basicColorName: "indigo400 / indigo400")
    ],
    description: "IndigoItem"
)

private let violetItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColorName: "violet300 / violet300"),
        WrappedUIKitColor(color: YDSColor.violetItemBG, name: "violetItemBG", basicColorName: "violet050 / violet050"),
        WrappedUIKitColor(color: YDSColor.violetItemText, name: "violetItemText", basicColorName: "violet400 / violet400")
    ],
    description: "VioletItem"
)

private let purpleItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColorName: "purple300 / purple300"),
        WrappedUIKitColor(color: YDSColor.purpleItemBG, name: "purpleItemBG", basicColorName: "purple050 / purple050"),
        WrappedUIKitColor(color: YDSColor.purpleItemText, name: "purpleItemText", basicColorName: "purple400 / purple400")
    ],
    description: "PurpleItem"
)

private let pinkItemColors = WrappedUIKitColors(
    items: [
        WrappedUIKitColor(color: YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColorName: "pink300 / pink300"),
        WrappedUIKitColor(color: YDSColor.pinkItemBG, name: "pinkItemBG", basicColorName: "pink050 / pink050"),
        WrappedUIKitColor(color: YDSColor.pinkItemText, name: "pinkItemText", basicColorName: "pink600 / pink600")
    ],
    description: "PinkItem"
)

let wrappedUIKitColors = [
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

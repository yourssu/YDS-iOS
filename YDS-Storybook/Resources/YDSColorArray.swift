//
//  YDSColorArray.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/12.
//

import UIKit
import YDS

struct Color {
    let color: UIColor?
    let name: String
    let basicColorName: String
}

extension Color: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

struct Colors {
    let items: [Color]
    let description: String?
}

let backgroundColors = Colors(
    items: [
        Color(color: YDSColor.bgNormal, name: "bgNormal", basicColorName: "white000 / black000"),
        Color(color: YDSColor.bgElevated, name: "bgElevated", basicColorName: "white000 / black000"),
        Color(color: YDSColor.bgRecomment, name: "bgRecomment", basicColorName: "gray050 / realBlack"),
        Color(color: YDSColor.bgPressed, name: "bgPressed", basicColorName: "black000 / white000A5"),
        Color(color: YDSColor.bgSelected, name: "bgSelected", basicColorName: "black000 / white000A5"),
        Color(color: YDSColor.bgNormalDark, name: "bgNormalDark", basicColorName: "realBlack / realBlack"),
        Color(color: YDSColor.bgElevatedDark, name: "bgElevatedDark", basicColorName: "realBlack / realBlack"),
        Color(color: YDSColor.bgDimDark, name: "bgDimDark", basicColorName: "gray900A30 / black000A30"),
    ],
    description: "Background"
)

let textColors = Colors(
    items: [
        Color(color: YDSColor.textPrimary, name: "textPrimary", basicColorName: "black000 / gray900"),
        Color(color: YDSColor.textSecondary, name: "textSecondary", basicColorName: "gray900 / gray800"),
        Color(color: YDSColor.textTertiary, name: "textTertiary", basicColorName: "gray600 / gray600"),
        Color(color: YDSColor.textDisabled, name: "textDisabled", basicColorName: "gray500/ gray400"),
        Color(color: YDSColor.textBright, name: "textBright", basicColorName: "white000 / white000"),
        Color(color: YDSColor.textPointed, name: "textPointed", basicColorName: "pointColor400 / pointColor400"),
        Color(color: YDSColor.textWarned, name: "textWarned", basicColorName: "warningRed400 / warningRed400"),
    ],
    description: "Text"
)

let dimColors = Colors(
    items: [
        Color(color: YDSColor.dimNormal, name: "dimNormal", basicColorName: "gray900A30 / black000A30"),
        Color(color: YDSColor.dimThick, name: "dimThick", basicColorName: "gray900A70 / black000A70"),
        Color(color: YDSColor.dimThickBright, name: "dimThickBright", basicColorName: "white000A70 / white000A70"),
    ],
    description: "Dim"
)

let borderColors = Colors(
    items: [
        Color(color: YDSColor.borderThin, name: "borderThin", basicColorName: "gray100 / gray100"),
        Color(color: YDSColor.borderNormal, name: "borderNormal", basicColorName: "black000A10 / white000A10"),
        Color(color: YDSColor.borderThick, name: "borderThick", basicColorName: "gray500 / gray500"),
    ],
    description: "Border"
)

let buttonColors = Colors(
    items: [
        Color(color: YDSColor.buttonNormal, name: "buttonNormal", basicColorName: "gray700 / gray700"),
        Color(color: YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColorName: "gray600 / gray600"),
        Color(color: YDSColor.buttonBG, name: "buttonBG", basicColorName: "gray200 / gray200"),
        Color(color: YDSColor.buttonEmojiBG, name: "buttonEmojiBG", basicColorName: "gray100 / gray100"),
        Color(color: YDSColor.buttonBright, name: "buttonBright", basicColorName: "white000 / white000"),
        Color(color: YDSColor.buttonDisabled, name: "buttonDisabled", basicColorName: "gray500 / gray500"),
        Color(color: YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColorName: "gray200 / gray200"),
        Color(color: YDSColor.buttonPoint, name: "buttonPoint", basicColorName: "pointColor400 / pointColor400"),
        Color(color: YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColorName: "pointColor300 / pointColor300"),
        Color(color: YDSColor.buttonPointBG, name: "buttonPointBG", basicColorName: "pointColor050 / pointColor050"),
        Color(color: YDSColor.buttonWarned, name: "buttonWarned", basicColorName: "warningRed400 / warningRed400"),
        Color(color: YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColorName: "warningRed300 / warningRed300"),
        Color(color: YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColorName: "warningRed050 / warningRed050"),
    ],
    description: "Button"
)

let bottomBarColors = Colors(
    items: [
        Color(color: YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColorName: "gray600 / gray600"),
        Color(color: YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColorName: "gray800 / gray800"),
    ],
    description: "BottomBar"
)

let inputFieldColors = Colors(
    items: [
        Color(color: YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColorName: "white000 / black000"),
        Color(color: YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColorName: "gray100 / gray100"),
    ],
    description: "InputField"
)

let toastColors = Colors(
    items: [
        Color(color: YDSColor.toastBG, name: "toastBG", basicColorName: "gray800 / gray300"),
    ],
    description: "Toast"
)

let tooltipColors = Colors(
    items: [
        Color(color: YDSColor.tooltipBG, name: "tooltipBG", basicColorName: "gray700 / gray400"),
        Color(color: YDSColor.tooltipPoint, name: "tooltipPoint", basicColorName: "pointColor400 / pointColor400"),
    ],
    description: "Tooltip"
)

let pickerColors = Colors(
    items: [
        Color(color: YDSColor.dimPickerReverse, name: "dimPickerReverse", basicColorName: "white000A70 / white000A70")
    ],
    description: "Picker"
)

let pressedColors = Colors(
    items: [
        Color(color: YDSColor.pressed, name: "pressed", basicColorName: "black000A10 / white000A10"),
    ],
    description: "Pressed"
)

let shadowColors = Colors(
    items: [
        Color(color: YDSColor.shadowThin, name: "shadowThin", basicColorName: "gray400"),
        Color(color: YDSColor.shadowNormal, name: "shadowNormal", basicColorName: "gray500"),
    ],
    description: "Shadow"
)

let monoItemColors = Colors(
    items: [
        Color(color: YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColorName: "gray700 / gray700"),
        Color(color: YDSColor.monoItemBG, name: "monoItemBG", basicColorName: "gray100 / gray100"),
        Color(color: YDSColor.monoItemText, name: "monoItemText", basicColorName: "gray800 / gray800"),
    ],
    description: "MonoItem"
)

let greenItemColors = Colors(
    items: [
        Color(color: YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColorName: "green300"),
        Color(color: YDSColor.greenItemBG, name: "greenItemBG", basicColorName: "green050"),
        Color(color: YDSColor.greenItemText, name: "greenItemText", basicColorName: "green800"),
    ],
    description: "GreenItem"
)

let emeraldItemColors = Colors(
    items: [
        Color(color: YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColorName: "emerald300 / emerald300"),
        Color(color: YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColorName: "emerald050 / emerald050"),
        Color(color: YDSColor.emeraldItemText, name: "emeraldItemText", basicColorName: "emerald800 / emerald800"),
    ],
    description: "EmeraldItem"
)

let aquaItemColors = Colors(
    items: [
        Color(color: YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColorName: "aqua300 / aqua300"),
        Color(color: YDSColor.aquaItemBG, name: "aquaItemBG", basicColorName: "aqua050 / aqua050"),
        Color(color: YDSColor.aquaItemText, name: "aquaItemText", basicColorName: "aqua700 / aqua700"),
    ],
    description: "AquaItem"
)

let blueItemColors = Colors(
    items: [
        Color(color: YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColorName: "blue300 / blue300"),
        Color(color: YDSColor.blueItemBG, name: "blueItemBG", basicColorName: "blue050 / blue050"),
        Color(color: YDSColor.blueItemText, name: "blueItemText", basicColorName: "blue700 / blue700"),
    ],
    description: "BlueItem"
)

let indigoItemColors = Colors(
    items: [
        Color(color: YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColorName: "indigo300 / indigo300"),
        Color(color: YDSColor.indigoItemBG, name: "indigoItemBG", basicColorName: "indigo050 / indigo050"),
        Color(color: YDSColor.indigoItemText, name: "indigoItemText", basicColorName: "indigo400 / indigo400"),
    ],
    description: "IndigoItem"
)

let violetItemColors = Colors(
    items: [
        Color(color: YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColorName: "violet300 / violet300"),
        Color(color: YDSColor.violetItemBG, name: "violetItemBG", basicColorName: "violet050 / violet050"),
        Color(color: YDSColor.violetItemText, name: "violetItemText", basicColorName: "violet400 / violet400"),
    ],
    description: "VioletItem"
)

let purpleItemColors = Colors(
    items: [
        Color(color: YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColorName: "purple300 / purple300"),
        Color(color: YDSColor.purpleItemBG, name: "purpleItemBG", basicColorName: "purple050 / purple050"),
        Color(color: YDSColor.purpleItemText, name: "purpleItemText", basicColorName: "purple400 / purple400"),
    ],
    description: "PurpleItem"
)

let pinkItemColors = Colors(
    items: [
        Color(color: YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColorName: "pink300 / pink300"),
        Color(color: YDSColor.pinkItemBG, name: "pinkItemBG", basicColorName: "pink050 / pink050"),
        Color(color: YDSColor.pinkItemText, name: "pinkItemText", basicColorName: "pink600 / pink600"),
    ],
    description: "PinkItem"
)

let colors = [
    backgroundColors,
    textColors,
    dimColors,
    borderColors,
    buttonColors,
    bottomBarColors,
    inputFieldColors,
    toastColors,
    tooltipColors,
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
    pinkItemColors,
]

//
//  SwiftUIYDSColorArray.swift
//  YDS-Storybook
//
//  Created by 오동규 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct SwiftUIColor {
    let color: SwiftUI.Color?
    let name: String
    let basicColorName: String
}

extension SwiftUIColor: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

struct SwiftUIColors {
    let items: [SwiftUIColor]
    let description: String?
}

let swiftUIBackgroundColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.bgNormal, name: "bgNormal", basicColorName: "white000 / black000"),
        SwiftUIColor(color: YDSColor.bgElevated, name: "bgElevated", basicColorName: "white000 / black000"),
        SwiftUIColor(color: YDSColor.bgRecomment, name: "bgRecomment", basicColorName: "gray050 / realBlack"),
        SwiftUIColor(color: YDSColor.bgPressed, name: "bgPressed", basicColorName: "black000A10 / white000A5"),
        SwiftUIColor(color: YDSColor.bgSelected, name: "bgSelected", basicColorName: "black000A10 / white000A5"),
        SwiftUIColor(color: YDSColor.bgNormalDark, name: "bgNormalDark", basicColorName: "realBlack / realBlack"),
        SwiftUIColor(color: YDSColor.bgElevatedDark, name: "bgElevatedDark", basicColorName: "realBlack / realBlack"),
        SwiftUIColor(color: YDSColor.bgDimDark, name: "bgDimDark", basicColorName: "gray900A30 / black000A30")
    ],
    description: "Background"
)

let swiftUITextColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.textPrimary, name: "textPrimary", basicColorName: "black000 / gray900"),
        SwiftUIColor(color: YDSColor.textSecondary, name: "textSecondary", basicColorName: "gray900 / gray800"),
        SwiftUIColor(color: YDSColor.textTertiary, name: "textTertiary", basicColorName: "gray600 / gray600"),
        SwiftUIColor(color: YDSColor.textDisabled, name: "textDisabled", basicColorName: "gray500/ gray400"),
        SwiftUIColor(color: YDSColor.textBright, name: "textBright", basicColorName: "white000 / white000"),
        SwiftUIColor(color: YDSColor.textPointed, name: "textPointed", basicColorName: "pointColor400 / pointColor400"),
        SwiftUIColor(color: YDSColor.textWarned, name: "textWarned", basicColorName: "warningRed400 / warningRed400")
    ],
    description: "Text"
)

let swiftUIDimColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.dimNormal, name: "dimNormal", basicColorName: "gray900A30 / black000A30"),
        SwiftUIColor(color: YDSColor.dimThick, name: "dimThick", basicColorName: "gray900A70 / black000A70"),
        SwiftUIColor(color: YDSColor.dimThickBright, name: "dimThickBright", basicColorName: "white000A70 / white000A70")
    ],
    description: "Dim"
)

let swiftUIBorderColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.borderThin, name: "borderThin", basicColorName: "gray100 / gray100"),
        SwiftUIColor(color: YDSColor.borderNormal, name: "borderNormal", basicColorName: "black000A10 / white000A10"),
        SwiftUIColor(color: YDSColor.borderThick, name: "borderThick", basicColorName: "gray500 / gray500")
    ],
    description: "Border"
)

let swiftUIButtonColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.buttonNormal, name: "buttonNormal", basicColorName: "gray700 / gray700"),
        SwiftUIColor(color: YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColorName: "gray600 / gray600"),
        SwiftUIColor(color: YDSColor.buttonBG, name: "buttonBG", basicColorName: "gray200 / gray200"),
        SwiftUIColor(color: YDSColor.buttonEmojiBG, name: "buttonEmojiBG", basicColorName: "gray100 / gray100"),
        SwiftUIColor(color: YDSColor.buttonBright, name: "buttonBright", basicColorName: "white000 / white000"),
        SwiftUIColor(color: YDSColor.buttonDisabled, name: "buttonDisabled", basicColorName: "gray500 / gray500"),
        SwiftUIColor(color: YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColorName: "gray200 / gray200"),
        SwiftUIColor(color: YDSColor.buttonPoint, name: "buttonPoint", basicColorName: "pointColor400 / pointColor400"),
        SwiftUIColor(color: YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColorName: "pointColor300 / pointColor300"),
        SwiftUIColor(color: YDSColor.buttonPointBG, name: "buttonPointBG", basicColorName: "pointColor050 / pointColor050"),
        SwiftUIColor(color: YDSColor.buttonWarned, name: "buttonWarned", basicColorName: "warningRed400 / warningRed400"),
        SwiftUIColor(color: YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColorName: "warningRed300 / warningRed300"),
        SwiftUIColor(color: YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColorName: "warningRed050 / warningRed050")
    ],
    description: "Button"
)

let swiftUIBottomBarColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColorName: "gray600 / gray600"),
        SwiftUIColor(color: YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColorName: "gray800 / gray800")
    ],
    description: "BottomBar"
)

let swiftUIInputFieldColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColorName: "white000 / black000"),
        SwiftUIColor(color: YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColorName: "gray100 / gray100")
    ],
    description: "InputField"
)

let swiftUIToastColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.toastBG, name: "toastBG", basicColorName: "gray800 / gray300")
    ],
    description: "Toast"
)

let swiftUITooltipColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.tooltipBG, name: "tooltipBG", basicColorName: "gray700 / gray400"),
        SwiftUIColor(color: YDSColor.tooltipPoint, name: "tooltipPoint", basicColorName: "pointColor400 / pointColor400")
    ],
    description: "Tooltip"
)

let swiftUIPickerColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.dimPickerReverse, name: "dimPickerReverse", basicColorName: "white000A70 / white000A70")
    ],
    description: "Picker"
)

let swiftUIPressedColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.pressed, name: "pressed", basicColorName: "black000A10 / white000A10")
    ],
    description: "Pressed"
)

let swiftUIShadowColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.shadowThin, name: "shadowThin", basicColorName: "gray400"),
        SwiftUIColor(color: YDSColor.shadowNormal, name: "shadowNormal", basicColorName: "gray500")
    ],
    description: "Shadow"
)

let swiftUIMonoItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColorName: "gray700 / gray700"),
        SwiftUIColor(color: YDSColor.monoItemBG, name: "monoItemBG", basicColorName: "gray100 / gray100"),
        SwiftUIColor(color: YDSColor.monoItemText, name: "monoItemText", basicColorName: "gray800 / gray800")
    ],
    description: "MonoItem"
)

let swiftUIGreenItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColorName: "green300"),
        SwiftUIColor(color: YDSColor.greenItemBG, name: "greenItemBG", basicColorName: "green050"),
        SwiftUIColor(color: YDSColor.greenItemText, name: "greenItemText", basicColorName: "green800")
    ],
    description: "GreenItem"
)

let swiftUIEmeraldItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColorName: "emerald300 / emerald300"),
        SwiftUIColor(color: YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColorName: "emerald050 / emerald050"),
        SwiftUIColor(color: YDSColor.emeraldItemText, name: "emeraldItemText", basicColorName: "emerald800 / emerald800")
    ],
    description: "EmeraldItem"
)

let swiftUIAquaItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColorName: "aqua300 / aqua300"),
        SwiftUIColor(color: YDSColor.aquaItemBG, name: "aquaItemBG", basicColorName: "aqua050 / aqua050"),
        SwiftUIColor(color: YDSColor.aquaItemText, name: "aquaItemText", basicColorName: "aqua700 / aqua700")
    ],
    description: "AquaItem"
)

let swiftUIBlueItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColorName: "blue300 / blue300"),
        SwiftUIColor(color: YDSColor.blueItemBG, name: "blueItemBG", basicColorName: "blue050 / blue050"),
        SwiftUIColor(color: YDSColor.blueItemText, name: "blueItemText", basicColorName: "blue700 / blue700")
    ],
    description: "BlueItem"
)

let swiftUIIndigoItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColorName: "indigo300 / indigo300"),
        SwiftUIColor(color: YDSColor.indigoItemBG, name: "indigoItemBG", basicColorName: "indigo050 / indigo050"),
        SwiftUIColor(color: YDSColor.indigoItemText, name: "indigoItemText", basicColorName: "indigo400 / indigo400")
    ],
    description: "IndigoItem"
)

let swiftUIVioletItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColorName: "violet300 / violet300"),
        SwiftUIColor(color: YDSColor.violetItemBG, name: "violetItemBG", basicColorName: "violet050 / violet050"),
        SwiftUIColor(color: YDSColor.violetItemText, name: "violetItemText", basicColorName: "violet400 / violet400")
    ],
    description: "VioletItem"
)

let swiftUIPurpleItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColorName: "purple300 / purple300"),
        SwiftUIColor(color: YDSColor.purpleItemBG, name: "purpleItemBG", basicColorName: "purple050 / purple050"),
        SwiftUIColor(color: YDSColor.purpleItemText, name: "purpleItemText", basicColorName: "purple400 / purple400")
    ],
    description: "PurpleItem"
)

let swiftUIPinkItemColors = SwiftUIColors(
    items: [
        SwiftUIColor(color: YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColorName: "pink300 / pink300"),
        SwiftUIColor(color: YDSColor.pinkItemBG, name: "pinkItemBG", basicColorName: "pink050 / pink050"),
        SwiftUIColor(color: YDSColor.pinkItemText, name: "pinkItemText", basicColorName: "pink600 / pink600")
    ],
    description: "PinkItem"
)

let swiftUIColors = [
    swiftUIBackgroundColors,
    swiftUITextColors,
    swiftUIDimColors,
    swiftUIBorderColors,
    swiftUIButtonColors,
    swiftUIBottomBarColors,
    swiftUIInputFieldColors,
    swiftUIToastColors,
    swiftUITooltipColors,
    swiftUIPressedColors,
    swiftUIShadowColors,
    swiftUIMonoItemColors,
    swiftUIGreenItemColors,
    swiftUIEmeraldItemColors,
    swiftUIAquaItemColors,
    swiftUIBlueItemColors,
    swiftUIIndigoItemColors,
    swiftUIVioletItemColors,
    swiftUIPurpleItemColors,
    swiftUIPinkItemColors
]

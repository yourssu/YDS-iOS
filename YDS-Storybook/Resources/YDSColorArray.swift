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

struct Colors {
    let items: [Color]
    let description: String?
}

let backgroundColors = Colors(
    items: [
        Color(color: YDSColor.bgNormal, name: "bgNormal", basicColorName: "white000"),
        Color(color: YDSColor.bgElevated, name: "bgElevated", basicColorName: "white000"),
        Color(color: YDSColor.bgSelected, name: "bgSelected", basicColorName: "gray100"),
        Color(color: YDSColor.bgPressed, name: "bgPressed", basicColorName: "gray100"),
        Color(color: YDSColor.bgNormalReversed, name: "bgNormalReversed", basicColorName: "realBlack"),
        Color(color: YDSColor.bgElevatedReversed, name: "bgElevatedReversed", basicColorName: "realBlack"),
    ],
    description: "Background"
)

let textColors = Colors(
    items: [
        Color(color: YDSColor.textPrimary, name: "textPrimary", basicColorName: "black000"),
        Color(color: YDSColor.textSecondary, name: "textSecondary", basicColorName: "gray900"),
        Color(color: YDSColor.textTertiary, name: "textTertiary", basicColorName: "gray600"),
        Color(color: YDSColor.textDisabled, name: "textDisabled", basicColorName: "gray500"),
        Color(color: YDSColor.textReversed, name: "textReversed", basicColorName: "white000"),
        Color(color: YDSColor.textPointed, name: "textPointed", basicColorName: "pointColor400"),
        Color(color: YDSColor.textWarned, name: "textWarned", basicColorName: "warningRed400"),
    ],
    description: "Text"
)

let dimColors = Colors(
    items: [
        Color(color: YDSColor.dimNormal, name: "dimNormal", basicColorName: "gray900A30"),
        Color(color: YDSColor.dimThick, name: "dimThick", basicColorName: "gray900A70"),
        Color(color: YDSColor.dimThickReversed, name: "dimThickReversed", basicColorName: "white000A70"),
    ],
    description: "Dim"
)

let borderColors = Colors(
    items: [
        Color(color: YDSColor.borderThin, name: "borderThin", basicColorName: "gray100"),
        Color(color: YDSColor.borderNormal, name: "borderNormal", basicColorName: "black000A10"),
        Color(color: YDSColor.borderThick, name: "borderThick", basicColorName: "gray500"),
    ],
    description: "Border"
)

let buttonColors = Colors(
    items: [
        Color(color: YDSColor.buttonNormal, name: "buttonNormal", basicColorName: "gray700"),
        Color(color: YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColorName: "gray600"),
        Color(color: YDSColor.buttonBG, name: "buttonBG", basicColorName: "gray200"),
        Color(color: YDSColor.buttonReversed, name: "buttonReversed", basicColorName: "white000"),
        Color(color: YDSColor.buttonDisabled, name: "buttonDisabled", basicColorName: "gray500"),
        Color(color: YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColorName: "gray200"),
        Color(color: YDSColor.buttonPoint, name: "buttonPoint", basicColorName: "pointColor400"),
        Color(color: YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColorName: "pointColor300"),
        Color(color: YDSColor.buttonPointBG, name: "buttonPointBG", basicColorName: "pointColor050"),
        Color(color: YDSColor.buttonWarned, name: "buttonWarned", basicColorName: "warningRed400"),
        Color(color: YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColorName: "warningRed300"),
        Color(color: YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColorName: "warningRed050"),
    ],
    description: "Button"
)

let bottomBarColors = Colors(
    items: [
        Color(color: YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColorName: "gray600"),
        Color(color: YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColorName: "gray800"),
    ],
    description: "BottomBar"
)

let inputFieldColors = Colors(
    items: [
        Color(color: YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColorName: "white000"),
        Color(color: YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColorName: "gray100"),
    ],
    description: "InputField"
)


let toastColors = Colors(
    items: [
        Color(color: YDSColor.toastBG, name: "toastBG", basicColorName: "gray800"),
    ],
    description: "Toast"
)

let pressedColors = Colors(
    items: [
        Color(color: YDSColor.pressed, name: "pressed", basicColorName: "black000A10"),
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

let itemColors = Colors(
    items: [
        Color(color: YDSColor.monoItemText, name: "monoItemText", basicColorName: "gray800"),
        Color(color: YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColorName: "gray700"),
        Color(color: YDSColor.monoItemBG, name: "monoItemBG", basicColorName: "gray100"),
        
        Color(color: YDSColor.greenItemText, name: "greenItemText", basicColorName: "green800"),
        Color(color: YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColorName: "green300"),
        Color(color: YDSColor.greenItemBG, name: "greenItemBG", basicColorName: "green050"),
        
        Color(color: YDSColor.emeraldItemText, name: "emeraldItemText", basicColorName: "emerald800"),
        Color(color: YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColorName: "emerald300"),
        Color(color: YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColorName: "emerald050"),
        
        Color(color: YDSColor.aquaItemText, name: "aquaItemText", basicColorName: "aqua700"),
        Color(color: YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColorName: "aqua300"),
        Color(color: YDSColor.aquaItemBG, name: "aquaItemBG", basicColorName: "aqua050"),
        
        Color(color: YDSColor.blueItemText, name: "blueItemText", basicColorName: "blue700"),
        Color(color: YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColorName: "blue300"),
        Color(color: YDSColor.blueItemBG, name: "blueItemBG", basicColorName: "blue050"),
        
        Color(color: YDSColor.indigoItemText, name: "indigoItemText", basicColorName: "indigo400"),
        Color(color: YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColorName: "indigo300"),
        Color(color: YDSColor.indigoItemBG, name: "indigoItemBG", basicColorName: "indigo050"),
        
        Color(color: YDSColor.violetItemText, name: "violetItemText", basicColorName: "violet400"),
        Color(color: YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColorName: "violet300"),
        Color(color: YDSColor.violetItemBG, name: "violetItemBG", basicColorName: "violet050"),
        
        Color(color: YDSColor.purpleItemText, name: "purpleItemText", basicColorName: "purple400"),
        Color(color: YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColorName: "purple300"),
        Color(color: YDSColor.purpleItemBG, name: "purpleItemBG", basicColorName: "purple050"),
        
        Color(color: YDSColor.pinkItemText, name: "pinkItemText", basicColorName: "pink600"),
        Color(color: YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColorName: "pink300"),
        Color(color: YDSColor.pinkItemBG, name: "pinkItemBG", basicColorName: "pink050"),
    ],
    description: "Item"
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
    pressedColors,
    shadowColors,
    itemColors
]

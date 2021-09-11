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
    let name: String?
    let basicColor: String?
}

struct Colors {
    let items: [Color]
    let description: String?
}

let backgroundColors = Colors(
    items: [
        Color(color: YDSColor.bgNormal, name: "bgNormal", basicColor: "white000"),
        Color(color: YDSColor.bgElevated, name: "bgElevated", basicColor: "white000"),
        Color(color: YDSColor.bgSelected, name: "bgSelected", basicColor: "gray100"),
        Color(color: YDSColor.bgPressed, name: "bgPressed", basicColor: "gray100"),
        Color(color: YDSColor.bgNormalReversed, name: "bgNormalReversed", basicColor: "realBlack"),
        Color(color: YDSColor.bgElevatedReversed, name: "bgElevatedReversed", basicColor: "realBlack"),
    ],
    description: "Background"
)

let textColors = Colors(
    items: [
        Color(color: YDSColor.textPrimary, name: "textPrimary", basicColor: "black000"),
        Color(color: YDSColor.textSecondary, name: "textSecondary", basicColor: "gray900"),
        Color(color: YDSColor.textTertiary, name: "textTertiary", basicColor: "gray600"),
        Color(color: YDSColor.textDisabled, name: "textDisabled", basicColor: "gray500"),
        Color(color: YDSColor.textReversed, name: "textReversed", basicColor: "white000"),
        Color(color: YDSColor.textPointed, name: "textPointed", basicColor: "pointColor400"),
        Color(color: YDSColor.textWarned, name: "textWarned", basicColor: "warningRed400"),
    ],
    description: "Text"
)

let dimColors = Colors(
    items: [
        Color(color: YDSColor.dimNormal, name: "dimNormal", basicColor: "gray900A30"),
        Color(color: YDSColor.dimThick, name: "dimThick", basicColor: "gray900A70"),
        Color(color: YDSColor.dimThickReversed, name: "dimThickReversed", basicColor: "white000A70"),
    ],
    description: "Dim"
)

let borderColors = Colors(
    items: [
        Color(color: YDSColor.borderThin, name: "borderThin", basicColor: "gray100"),
        Color(color: YDSColor.borderNormal, name: "borderNormal", basicColor: "black000A10"),
        Color(color: YDSColor.borderThick, name: "borderThick", basicColor: "gray500"),
    ],
    description: "Border"
)

let buttonColors = Colors(
    items: [
        Color(color: YDSColor.buttonNormal, name: "buttonNormal", basicColor: "gray700"),
        Color(color: YDSColor.buttonNormalPressed, name: "buttonNormalPressed", basicColor: "gray600"),
        Color(color: YDSColor.buttonBG, name: "buttonBG", basicColor: "gray200"),
        Color(color: YDSColor.buttonReversed, name: "buttonReversed", basicColor: "white000"),
        Color(color: YDSColor.buttonDisabled, name: "buttonDisabled", basicColor: "gray500"),
        Color(color: YDSColor.buttonDisabledBG, name: "buttonDisabledBG", basicColor: "gray200"),
        Color(color: YDSColor.buttonPoint, name: "buttonPoint", basicColor: "pointColor400"),
        Color(color: YDSColor.buttonPointPressed, name: "buttonPointPressed", basicColor: "pointColor300"),
        Color(color: YDSColor.buttonPointBG, name: "buttonPointBG", basicColor: "pointColor050"),
        Color(color: YDSColor.buttonWarned, name: "buttonWarned", basicColor: "warningRed400"),
        Color(color: YDSColor.buttonWarnedPressed, name: "buttonWarnedPressed", basicColor: "warningRed300"),
        Color(color: YDSColor.buttonWarnedBG, name: "buttonWarnedBG", basicColor: "warningRed050"),
    ],
    description: "Button"
)

let bottomBarColors = Colors(
    items: [
        Color(color: YDSColor.bottomBarNormal, name: "bottomBarNormal", basicColor: "gray600"),
        Color(color: YDSColor.bottomBarSelected, name: "bottomBarSelected", basicColor: "gray800"),
    ],
    description: "BottomBar"
)

let inputFieldColors = Colors(
    items: [
        Color(color: YDSColor.inputFieldNormal, name: "inputFieldNormal", basicColor: "white000"),
        Color(color: YDSColor.inputFieldElevated, name: "inputFieldElevated", basicColor: "gray100"),
    ],
    description: "InputField"
)


let toastColors = Colors(
    items: [
        Color(color: YDSColor.toastBG, name: "toastBG", basicColor: "gray800"),
    ],
    description: "Toast"
)

let pressedColors = Colors(
    items: [
        Color(color: YDSColor.pressed, name: "pressed", basicColor: "black000A10"),
    ],
    description: "Pressed"
)

let shadowColors = Colors(
    items: [
        Color(color: YDSColor.shadowThin, name: "shadowThin", basicColor: "gray400"),
        Color(color: YDSColor.shadowNormal, name: "shadowNormal", basicColor: "gray500"),
    ],
    description: "Shadow"
)

let itemColors = Colors(
    items: [
        Color(color: YDSColor.monoItemText, name: "monoItemText", basicColor: "gray800"),
        Color(color: YDSColor.monoItemPrimary, name: "monoItemPrimary", basicColor: "gray700"),
        Color(color: YDSColor.monoItemBG, name: "monoItemBG", basicColor: "gray100"),
        
        Color(color: YDSColor.greenItemText, name: "greenItemText", basicColor: "green800"),
        Color(color: YDSColor.greenItemPrimary, name: "greenItemPrimary", basicColor: "green300"),
        Color(color: YDSColor.greenItemBG, name: "greenItemBG", basicColor: "green050"),
        
        Color(color: YDSColor.emeraldItemText, name: "emeraldItemText", basicColor: "emerald800"),
        Color(color: YDSColor.emeraldItemPrimary, name: "emeraldItemPrimary", basicColor: "emerald300"),
        Color(color: YDSColor.emeraldItemBG, name: "emeraldItemBG", basicColor: "emerald050"),
        
        Color(color: YDSColor.aquaItemText, name: "aquaItemText", basicColor: "aqua700"),
        Color(color: YDSColor.aquaItemPrimary, name: "aquaItemPrimary", basicColor: "aqua300"),
        Color(color: YDSColor.aquaItemBG, name: "aquaItemBG", basicColor: "aqua050"),
        
        Color(color: YDSColor.blueItemText, name: "blueItemText", basicColor: "blue700"),
        Color(color: YDSColor.blueItemPrimary, name: "blueItemPrimary", basicColor: "blue300"),
        Color(color: YDSColor.blueItemBG, name: "blueItemBG", basicColor: "blue050"),
        
        Color(color: YDSColor.indigoItemText, name: "indigoItemText", basicColor: "indigo400"),
        Color(color: YDSColor.indigoItemPrimary, name: "indigoItemPrimary", basicColor: "indigo300"),
        Color(color: YDSColor.indigoItemBG, name: "indigoItemBG", basicColor: "indigo050"),
        
        Color(color: YDSColor.violetItemText, name: "violetItemText", basicColor: "violet400"),
        Color(color: YDSColor.violetItemPrimary, name: "violetItemPrimary", basicColor: "violet300"),
        Color(color: YDSColor.violetItemBG, name: "violetItemBG", basicColor: "violet050"),
        
        Color(color: YDSColor.purpleItemText, name: "purpleItemText", basicColor: "purple400"),
        Color(color: YDSColor.purpleItemPrimary, name: "purpleItemPrimary", basicColor: "purple300"),
        Color(color: YDSColor.purpleItemBG, name: "purpleItemBG", basicColor: "purple050"),
        
        Color(color: YDSColor.pinkItemText, name: "pinkItemText", basicColor: "pink600"),
        Color(color: YDSColor.pinkItemPrimary, name: "pinkItemPrimary", basicColor: "pink300"),
        Color(color: YDSColor.pinkItemBG, name: "pinkItemBG", basicColor: "pink050"),
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

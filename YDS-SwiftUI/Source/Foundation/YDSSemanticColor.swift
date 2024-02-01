//
//  SemanticColor.swift
//  YDS-iOS
//
//  Created by 정종인 on 2023/07/27.
//
import SwiftUI

public enum YDSColor {
    private static func color(light: Color, dark: Color? = nil) -> Color {
        if let dark = dark {
            return Color(uiColor: UIColor { $0.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light) })
        } else {
            return light
        }
    }

    // MARK: - Background

    public static var bgNormal: Color {
        return color(light: .white000, dark: .black000)
    }

    public static var bgElevated: Color {
        return color(light: .white000, dark: .black000)
    }

    public static var bgRecomment: Color {
        return color(light: .gray050, dark: .realBlack)
    }

    public static var bgPressed: Color {
        return color(light: .black000A10, dark: .white000A5)
    }

    public static var bgSelected: Color {
        return color(light: .black000A10, dark: .white000A5)
    }

    public static var bgNormalDark: Color {
        return color(light: .realBlack, dark: .realBlack)
    }

    public static var bgElevatedDark: Color {
        return color(light: .realBlack, dark: .realBlack)
    }

    public static var bgDimDark: Color {
        return color(light: .gray900A30, dark: .black000A30)
    }

    // MARK: - Text

    public static var textPrimary: Color {
        return color(light: .black000, dark: .gray900)
    }

    public static var textSecondary: Color {
        return color(light: .gray900, dark: .gray800)
    }

    public static var textTertiary: Color {
        return color(light: .gray600, dark: .gray600)
    }

    public static var textDisabled: Color {
        return color(light: .gray500, dark: .gray400)
    }

    public static var textBright: Color {
        return color(light: .white000, dark: .white000)
    }

    public static var textPointed: Color {
        return color(light: .pointColor400, dark: .pointColor400)
    }

    public static var textWarned: Color {
        return color(light: .warningRed400, dark: .warningRed400)
    }

    // MARK: - Dim

    public static var dimNormal: Color {
        return color(light: .gray900A30, dark: .black000A30)
    }

    public static var dimThick: Color {
        return color(light: .gray900A70, dark: .black000A70)
    }

    public static var dimThickBright: Color {
        return color(light: .white000A70, dark: .white000A70)
    }

    // MARK: - Border

    public static var borderThin: Color {
        return color(light: .gray100, dark: .gray100)
    }

    public static var borderNormal: Color {
        return color(light: .black000A10, dark: .white000A10)
    }

    public static var borderThick: Color {
        return color(light: .gray500, dark: .gray500)
    }

    // MARK: - Button

    public static var buttonNormal: Color {
        return color(light: .gray700, dark: .gray700)
    }

    public static var buttonNormalPressed: Color {
        return color(light: .gray600, dark: .gray600)
    }

    public static var buttonBG: Color {
        return color(light: .gray200, dark: .gray200)
    }

    public static var buttonEmojiBG: Color {
        return color(light: .gray100, dark: .gray100)
    }

    public static var buttonBright: Color {
        return color(light: .white000, dark: .white000)
    }

    public static var buttonDisabled: Color {
        return color(light: .gray500, dark: .gray500)
    }

    public static var buttonDisabledBG: Color {
        return color(light: .gray200, dark: .gray200)
    }

    public static var buttonPoint: Color {
        return color(light: .pointColor400, dark: .pointColor400)
    }

    public static var buttonPointPressed: Color {
        return color(light: .pointColor300, dark: .pointColor300)
    }

    public static var buttonPointBG: Color {
        return color(light: .pointColor050, dark: .pointColor050)
    }

    public static var buttonWarned: Color {
        return color(light: .warningRed400, dark: .warningRed400)
    }

    public static var buttonWarnedPressed: Color {
        return color(light: .warningRed300, dark: .warningRed300)
    }

    public static var buttonWarnedBG: Color {
        return color(light: .warningRed050, dark: .warningRed050)
    }

    // MARK: - BottomBar

    public static var bottomBarNormal: Color {
        return color(light: .gray600, dark: .gray600)
    }

    public static var bottomBarSelected: Color {
        return color(light: .gray800, dark: .gray800)
    }

    // MARK: - InputField

    public static var inputFieldNormal: Color {
        return color(light: .white000, dark: .black000)
    }

    public static var inputFieldElevated: Color {
        return color(light: .gray100, dark: .gray100)
    }

    // MARK: - Toast

    public static var toastBG: Color {
        return color(light: .gray800, dark: .gray300)
    }

    // MARK: - Tooltip

    public static var tooltipBG: Color {
        return color(light: .gray700, dark: .gray400)
    }

    public static var tooltipPoint: Color {
        return color(light: .pointColor400, dark: .pointColor400)
    }

    // MARK: - Picker

    public static var dimPickerReverse: Color {
        return color(light: .white000A70, dark: .white000A70)
    }

    // MARK: - Pressed

    public static var pressed: Color {
        return color(light: .black000A10, dark: .white000A10)
    }

    // MARK: - Shadow
    //  다크모드에서는 Shadow를 사용하지 않습니다.

    public static var shadowThin: Color {
        return color(light: .gray400)
    }

    public static var shadowNormal: Color {
        return color(light: .gray500)
    }

    // MARK: - MonoItem

    public static var monoItemPrimary: Color {
        return color(light: .gray700, dark: .gray700)
    }

    public static var monoItemBG: Color {
        return color(light: .gray100, dark: .gray100)
    }

    public static var monoItemText: Color {
        return color(light: .gray800, dark: .gray800)
    }

    // MARK: - GreenItem

    public static var greenItemPrimary: Color {
        return color(light: .green300, dark: .green300)
    }

    public static var greenItemBG: Color {
        return color(light: .green050, dark: .green050)
    }

    public static var greenItemText: Color {
        return color(light: .green800, dark: .green800)
    }

    // MARK: - EmeraldItem

    public static var emeraldItemPrimary: Color {
        return color(light: .emerald300, dark: .emerald300)
    }

    public static var emeraldItemBG: Color {
        return color(light: .emerald050, dark: .emerald050)
    }

    public static var emeraldItemText: Color {
        return color(light: .emerald800, dark: .emerald800)
    }

    // MARK: - AquaItem

    public static var aquaItemPrimary: Color {
        return color(light: .aqua300, dark: .aqua300)
    }

    public static var aquaItemBG: Color {
        return color(light: .aqua050, dark: .aqua050)
    }

    public static var aquaItemText: Color {
        return color(light: .aqua700, dark: .aqua700)
    }

    // MARK: - BlueItem

    public static var blueItemPrimary: Color {
        return color(light: .blue300, dark: .blue300)
    }

    public static var blueItemBG: Color {
        return color(light: .blue050, dark: .blue050)
    }

    public static var blueItemText: Color {
        return color(light: .blue700, dark: .blue700)
    }

    // MARK: - IndigoItem

    public static var indigoItemPrimary: Color {
        return color(light: .indigo300, dark: .indigo300)
    }

    public static var indigoItemBG: Color {
        return color(light: .indigo050, dark: .indigo050)
    }

    public static var indigoItemText: Color {
        return color(light: .indigo400, dark: .indigo400)
    }

    // MARK: - VioletItem

    public static var violetItemPrimary: Color {
        return color(light: .violet300, dark: .violet300)
    }

    public static var violetItemBG: Color {
        return color(light: .violet050, dark: .violet050)
    }

    public static var violetItemText: Color {
        return color(light: .violet400, dark: .violet400)
    }

    // MARK: - PurpleItem

    public static var purpleItemPrimary: Color {
        return color(light: .purple300, dark: .purple300)
    }

    public static var purpleItemBG: Color {
        return color(light: .purple050, dark: .purple050)
    }

    public static var purpleItemText: Color {
        return color(light: .purple400, dark: .purple400)
    }

    // MARK: - PinkItem

    public static var pinkItemPrimary: Color {
        return color(light: .pink300, dark: .pink300)
    }

    public static var pinkItemBG: Color {
        return color(light: .pink050, dark: .pink050)
    }

    public static var pinkItemText: Color {
        return color(light: .pink600, dark: .pink600)
    }
}

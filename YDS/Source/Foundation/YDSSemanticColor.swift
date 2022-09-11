//
//  SemanticColor.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/26.
//
import UIKit

public enum YDSColor {
    private static func color(light: UIColor, dark: UIColor? = nil) -> UIColor {
        if let dark = dark  {
            if #available(iOS 13.0, *) {
                return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
            }
            return light
        } else {
            return light
        }
    }
    
    
    //  MARK: - Background
    
    public static var bgNormal: UIColor {
        return color(light: .white000, dark: .black000)
    }
    
    public static var bgElevated: UIColor {
        return color(light: .white000, dark: .black000)
    }
    
    public static var bgRecomment: UIColor {
        return color(light: .gray050, dark: .realBlack)
    }
    
    public static var bgPressed: UIColor {
        return color(light: .black000, dark: .white000A5)
    }
    
    public static var bgSelected: UIColor {
        return color(light: .black000, dark: .white000A5)
    }
    
    public static var bgNormalDark: UIColor {
        return color(light: .realBlack, dark: .realBlack)
    }
    
    public static var bgElevatedDark: UIColor {
        return color(light: .realBlack, dark: .realBlack)
    }
    
    public static var bgDimDark: UIColor {
        return color(light: .gray900A30, dark: .black000A30)
    }
    
    
    //  MARK: - Text
    
    public static var textPrimary: UIColor {
        return color(light: .black000, dark: .gray900)
    }
    
    public static var textSecondary: UIColor {
        return color(light: .gray900, dark: .gray800)
    }
    
    public static var textTertiary: UIColor {
        return color(light: .gray600, dark: .gray600)
    }
    
    public static var textDisabled: UIColor {
        return color(light: .gray500, dark: .gray400)
    }
    
    public static var textBright: UIColor {
        return color(light: .white000, dark: .white000)
    }
    
    public static var textPointed: UIColor {
        return color(light: .pointColor400, dark: .pointColor400)
    }
    
    public static var textWarned: UIColor {
        return color(light: .warningRed400, dark: .warningRed400)
    }
    
    
    //  MARK: - Dim
    
    public static var dimNormal: UIColor {
        return color(light: .gray900A30, dark: .black000A30)
    }
    
    public static var dimThick: UIColor {
        return color(light: .gray900A70, dark: .black000A70)
    }
    
    public static var dimThickBright: UIColor {
        return color(light: .white000A70, dark: .white000A70)
    }
    
    
    //  MARK: - Border
    
    public static var borderThin: UIColor {
        return color(light: .gray100, dark: .gray100)
    }
    
    public static var borderNormal: UIColor {
        return color(light: .black000A10, dark: .white000A10)
    }
    
    public static var borderThick: UIColor {
        return color(light: .gray500, dark: .gray500)
    }
    
    
    //  MARK: - Button
    
    public static var buttonNormal: UIColor {
        return color(light: .gray700, dark: .gray700)
    }
    
    public static var buttonNormalPressed: UIColor {
        return color(light: .gray600, dark: .gray600)
    }
    
    public static var buttonBG: UIColor {
        return color(light: .gray200, dark: .gray200)
    }
    
    public static var buttonEmojiBG: UIColor {
        return color(light: .gray100, dark: .gray100)
    }
    
    public static var buttonBright: UIColor {
        return color(light: .white000, dark: .white000)
    }
    
    public static var buttonDisabled: UIColor {
        return color(light: .gray500, dark: .gray500)
    }
    
    public static var buttonDisabledBG: UIColor {
        return color(light: .gray200, dark: .gray200)
    }
    
    public static var buttonPoint: UIColor {
        return color(light: .pointColor400, dark: .pointColor400)
    }
    
    public static var buttonPointPressed: UIColor {
        return color(light: .pointColor300, dark: .pointColor300)
    }
    
    public static var buttonPointBG: UIColor {
        return color(light: .pointColor050, dark: .pointColor050)
    }
    
    public static var buttonWarned: UIColor {
        return color(light: .warningRed400, dark: .warningRed400)
    }
    
    public static var buttonWarnedPressed: UIColor {
        return color(light: .warningRed300, dark: .warningRed300)
    }
    
    public static var buttonWarnedBG: UIColor {
        return color(light: .warningRed050, dark: .warningRed050)
    }
    
    
    //  MARK: - BottomBar
    
    public static var bottomBarNormal: UIColor {
        return color(light: .gray600, dark: .gray600)
    }
    
    public static var bottomBarSelected: UIColor {
        return color(light: .gray800, dark: .gray800)
    }
    
    
    //  MARK: - InputField
    
    public static var inputFieldNormal: UIColor {
        return color(light: .white000, dark: .black000)
    }
    
    public static var inputFieldElevated: UIColor {
        return color(light: .gray100, dark: .gray100)
    }
    
    
    //  MARK: - Toast
    
    public static var toastBG: UIColor {
        return color(light: .gray800, dark: .gray300)
    }
    
    
    //  MARK: - Tooltip
    
    public static var tooltipBG: UIColor {
        return color(light: .gray700, dark: .gray400)
    }
    
    public static var tooltipPoint: UIColor {
        return color(light: .pointColor400, dark: .pointColor400)
    }
    
    
    // MARK: - Picker
    
    public static var dimPickerReverse: UIColor {
        return color(light: .white000A70, dark: .white000A70)
    }
    
    
    //  MARK: - Pressed
    
    public static var pressed: UIColor {
        return color(light: .black000A10, dark: .white000A10)
    }
    
    
    //  MARK: - Shadow
    //  다크모드에서는 Shadow를 사용하지 않습니다.
    
    public static var shadowThin: UIColor {
        return color(light: .gray400)
    }
    
    public static var shadowNormal: UIColor {
        return color(light: .gray500)
    }
    
    
    //  MARK: - MonoItem
    
    public static var monoItemPrimary: UIColor {
        return color(light: .gray700, dark: .gray700)
    }
    
    public static var monoItemBG: UIColor {
        return color(light: .gray100, dark: .gray100)
    }
    
    public static var monoItemText: UIColor {
        return color(light: .gray800, dark: .gray800)
    }
    
    
    //  MARK: - GreenItem
    
    public static var greenItemPrimary: UIColor {
        return color(light: .green300, dark: .green300)
    }
    
    public static var greenItemBG: UIColor {
        return color(light: .green050, dark: .green050)
    }
    
    public static var greenItemText: UIColor {
        return color(light: .green800, dark: .green800)
    }
    
    
    //  MARK: - EmeraldItem
    
    public static var emeraldItemPrimary: UIColor {
        return color(light: .emerald300, dark: .emerald300)
    }
    
    public static var emeraldItemBG: UIColor {
        return color(light: .emerald050, dark: .emerald050)
    }
    
    public static var emeraldItemText: UIColor {
        return color(light: .emerald800, dark: .emerald800)
    }
    
    
    //  MARK: - AquaItem
    
    public static var aquaItemPrimary: UIColor {
        return color(light: .aqua300, dark: .aqua300)
    }
    
    public static var aquaItemBG: UIColor {
        return color(light: .aqua050, dark: .aqua050)
    }
    
    public static var aquaItemText: UIColor {
        return color(light: .aqua700, dark: .aqua700)
    }
    
    
    //  MARK: - BlueItem
    
    public static var blueItemPrimary: UIColor {
        return color(light: .blue300, dark: .blue300)
    }
    
    public static var blueItemBG: UIColor {
        return color(light: .blue050, dark: .blue050)
    }
    
    public static var blueItemText: UIColor {
        return color(light: .blue700, dark: .blue700)
    }
    
    
    //  MARK: - IndigoItem
    
    public static var indigoItemPrimary: UIColor {
        return color(light: .indigo300, dark: .indigo300)
    }
    
    public static var indigoItemBG: UIColor {
        return color(light: .indigo050, dark: .indigo050)
    }
    
    public static var indigoItemText: UIColor {
        return color(light: .indigo400, dark: .indigo400)
    }
    
    
    //  MARK: - VioletItem
    
    public static var violetItemPrimary: UIColor {
        return color(light: .violet300, dark: .violet300)
    }
    
    public static var violetItemBG: UIColor {
        return color(light: .violet050, dark: .violet050)
    }
    
    public static var violetItemText: UIColor {
        return color(light: .violet400, dark: .violet400)
    }
    
    
    //  MARK: - PurpleItem
    
    public static var purpleItemPrimary: UIColor {
        return color(light: .purple300, dark: .purple300)
    }
    
    public static var purpleItemBG: UIColor {
        return color(light: .purple050, dark: .purple050)
    }
    
    public static var purpleItemText: UIColor {
        return color(light: .purple400, dark: .purple400)
    }
    
    
    //  MARK: - PinkItem
    
    public static var pinkItemPrimary: UIColor {
        return color(light: .pink300, dark: .pink300)
    }
    
    public static var pinkItemBG: UIColor {
        return color(light: .pink050, dark: .pink050)
    }
    
    public static var pinkItemText: UIColor {
        return color(light: .pink600, dark: .pink600)
    }
}

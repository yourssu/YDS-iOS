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
        return color(light: YDSBasicColor.white000, dark: YDSBasicColor.black000)
    }
    
    public static var bgElevated: UIColor {
        return color(light: YDSBasicColor.white000, dark: YDSBasicColor.black000)
    }
    
    public static var bgRecomment: UIColor {
        return color(light: YDSBasicColor.gray050, dark: YDSBasicColor.realBlack)
    }
    
    public static var bgSelected: UIColor {
        return color(light: YDSBasicColor.gray100, dark: YDSBasicColor.gray900)
    }
    
    public static var bgPressed: UIColor {
        return color(light: YDSBasicColor.gray100, dark: YDSBasicColor.gray800)
    }
    
    public static var bgNormalDark: UIColor {
        return color(light: YDSBasicColor.realBlack, dark: YDSBasicColor.realBlack)
    }
    
    public static var  bgElevatedDark: UIColor {
        return color(light: YDSBasicColor.realBlack, dark: YDSBasicColor.realBlack)
    }
    
    
    //  MARK: - Text
    
    public static var textPrimary: UIColor {
        return color(light: YDSBasicColor.black000, dark: YDSBasicColor.gray100)
    }
    
    public static var textSecondary: UIColor {
        return color(light: YDSBasicColor.gray900, dark: YDSBasicColor.gray200)
    }
    
    public static var textTertiary: UIColor {
        return color(light: YDSBasicColor.gray600, dark: YDSBasicColor.gray600)
    }
    
    public static var textDisabled: UIColor {
        return color(light: YDSBasicColor.gray500, dark: YDSBasicColor.gray700)
    }
    
    public static var textBright: UIColor {
        return color(light: YDSBasicColor.white000, dark: YDSBasicColor.white000)
    }
    
    public static var textPointed: UIColor {
        return color(light: YDSBasicColor.pointColor400, dark: YDSBasicColor.pointColor300)
    }
    
    public static var textWarned: UIColor {
        return color(light: YDSBasicColor.warningRed400, dark: YDSBasicColor.warningRed300)
    }
    
    
    //  MARK: - Dim
    
    public static var dimNormal: UIColor {
        return color(light: YDSBasicColor.gray900A30, dark: YDSBasicColor.gray900A30)
    }
    
    public static var dimThick: UIColor {
        return color(light: YDSBasicColor.gray900A70, dark: YDSBasicColor.gray900A70)
    }
    
    public static var dimThickBright: UIColor {
        return color(light: YDSBasicColor.white000A70, dark: YDSBasicColor.white000A70)
    }
    
    
    //  MARK: - Border
    
    public static var borderThin: UIColor {
        return color(light: YDSBasicColor.gray100, dark: YDSBasicColor.gray900)
    }
    
    public static var borderNormal: UIColor {
        return color(light: YDSBasicColor.black000A10, dark: YDSBasicColor.white000A10)
    }
    
    public static var borderThick: UIColor {
        return color(light: YDSBasicColor.gray500, dark: YDSBasicColor.gray500)
    }
    
    
    //  MARK: - Button
    
    public static var buttonNormal: UIColor {
        return color(light: YDSBasicColor.gray700, dark: YDSBasicColor.gray300)
    }
    
    public static var buttonNormalPressed: UIColor {
        return color(light: YDSBasicColor.gray600, dark: YDSBasicColor.gray200)
    }
    
    public static var buttonBG: UIColor {
        return color(light: YDSBasicColor.gray200, dark: YDSBasicColor.gray800)
    }
    
    public static var buttonEmojiBG: UIColor {
        return color(light: YDSBasicColor.gray100, dark: YDSBasicColor.gray900)
    }
    
    public static var buttonBright: UIColor {
        return color(light: YDSBasicColor.white000, dark: YDSBasicColor.white000)
    }
    
    public static var buttonDisabled: UIColor {
        return color(light: YDSBasicColor.gray500, dark: YDSBasicColor.gray600)
    }
    
    public static var buttonDisabledBG: UIColor {
        return color(light: YDSBasicColor.gray200, dark: YDSBasicColor.gray800)
    }
    
    public static var buttonPoint: UIColor {
        return color(light: YDSBasicColor.pointColor400, dark: YDSBasicColor.pointColor400)
    }
    
    public static var buttonPointPressed: UIColor {
        return color(light: YDSBasicColor.pointColor300, dark: YDSBasicColor.pointColor300)
    }
    
    public static var buttonPointBG: UIColor {
        return color(light: YDSBasicColor.pointColor050, dark: YDSBasicColor.pointColor050)
    }
    
    public static var buttonWarned: UIColor {
        return color(light: YDSBasicColor.warningRed400, dark: YDSBasicColor.warningRed400)
    }
    
    public static var buttonWarnedPressed: UIColor {
        return color(light: YDSBasicColor.warningRed300, dark: YDSBasicColor.warningRed300)
    }
    
    public static var buttonWarnedBG: UIColor {
        return color(light: YDSBasicColor.warningRed050, dark: YDSBasicColor.warningRed050)
    }
    
    
    //  MARK: - BottomBar
    
    public static var bottomBarNormal: UIColor {
        return color(light: YDSBasicColor.gray600, dark: YDSBasicColor.gray600)
    }
    
    public static var bottomBarSelected: UIColor {
        return color(light: YDSBasicColor.gray800, dark: YDSBasicColor.gray200)
    }
    
    
    //  MARK: - InputField
    
    public static var inputFieldNormal: UIColor {
        return color(light: YDSBasicColor.white000, dark: YDSBasicColor.black000)
    }
    
    public static var inputFieldElevated: UIColor {
        return color(light: YDSBasicColor.gray100, dark: YDSBasicColor.gray900)
    }
    
    
    //  MARK: - Toast
    
    public static var toastBG: UIColor {
        return color(light: YDSBasicColor.gray800, dark: YDSBasicColor.gray800)
    }
    
    
    //  MARK: - Tooltip
    
    public static var tooltipBG: UIColor {
        return color(light: YDSBasicColor.gray700, dark: YDSBasicColor.gray700)
    }
    
    public static var tooltipPoint: UIColor {
        return color(light: YDSBasicColor.pointColor400, dark: YDSBasicColor.pointColor400)
    }
    
    
    //  MARK: - Pressed
    
    public static var pressed: UIColor {
        return color(light: YDSBasicColor.black000A10, dark: YDSBasicColor.black000A10)
    }
    
    
    //  MARK: - Shadow
    //  다크모드에서는 Shadow를 사용하지 않습니다.
    
    public static var shadowThin: UIColor {
        return color(light: YDSBasicColor.gray400)
    }
    
    public static var shadowNormal: UIColor {
        return color(light: YDSBasicColor.gray500)
    }
    
    
    //  MARK: - Item
    
    public static var monoItemPrimary: UIColor {
       return color(light: YDSBasicColor.gray700)
    }

    public static var monoItemBG: UIColor {
       return color(light: YDSBasicColor.gray100)
    }

    public static var monoItemText: UIColor {
       return color(light: YDSBasicColor.gray800)
    }

    public static var greenItemPrimary: UIColor {
       return color(light: YDSBasicColor.green300)
    }

    public static var greenItemBG: UIColor {
       return color(light: YDSBasicColor.green050)
    }

    public static var greenItemText: UIColor {
       return color(light: YDSBasicColor.green800)
    }

    public static var emeraldItemPrimary: UIColor {
       return color(light: YDSBasicColor.emerald300)
    }

    public static var emeraldItemBG: UIColor {
       return color(light: YDSBasicColor.emerald050)
    }

    public static var emeraldItemText: UIColor {
       return color(light: YDSBasicColor.emerald800)
    }

    public static var aquaItemPrimary: UIColor {
       return color(light: YDSBasicColor.aqua300)
    }

    public static var aquaItemBG: UIColor {
       return color(light: YDSBasicColor.aqua050)
    }

    public static var aquaItemText: UIColor {
       return color(light: YDSBasicColor.aqua700)
    }

    public static var blueItemPrimary: UIColor {
       return color(light: YDSBasicColor.blue300)
    }

    public static var blueItemBG: UIColor {
       return color(light: YDSBasicColor.blue050)
    }

    public static var blueItemText: UIColor {
       return color(light: YDSBasicColor.blue700)
    }

    public static var indigoItemPrimary: UIColor {
       return color(light: YDSBasicColor.indigo300)
    }

    public static var indigoItemBG: UIColor {
       return color(light: YDSBasicColor.indigo050)
    }

    public static var indigoItemText: UIColor {
       return color(light: YDSBasicColor.indigo400)
    }

    public static var violetItemPrimary: UIColor {
       return color(light: YDSBasicColor.violet300)
    }

    public static var violetItemBG: UIColor {
       return color(light: YDSBasicColor.violet050)
    }

    public static var violetItemText: UIColor {
       return color(light: YDSBasicColor.violet400)
    }

    public static var purpleItemPrimary: UIColor {
       return color(light: YDSBasicColor.purple300)
    }

    public static var purpleItemBG: UIColor {
       return color(light: YDSBasicColor.purple050)
    }

    public static var purpleItemText: UIColor {
       return color(light: YDSBasicColor.purple400)
    }

    public static var pinkItemPrimary: UIColor {
       return color(light: YDSBasicColor.pink300)
    }

    public static var pinkItemBG: UIColor {
       return color(light: YDSBasicColor.pink050)
    }

    public static var pinkItemText: UIColor {
       return color(light: YDSBasicColor.pink600)
    }       
}

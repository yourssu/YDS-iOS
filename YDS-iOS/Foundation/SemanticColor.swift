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
       }else {
           return light
       }
    }

    //MARK:- Background
    static var bgNormal: UIColor {
        return color(light: BasicColor.white000)
    }
    
    static var  bgElevated: UIColor {
        return color(light: BasicColor.white000)
    }
    
    static var bgSelected: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    static var bgPressed: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    //MARK:- Text
    static var textPrimary: UIColor {
        return color(light: BasicColor.gray900)
    }
    
    static var textSecondary: UIColor {
        return color(light: BasicColor.gray800)
    }
    
    static var textTertiary: UIColor {
        return color(light: BasicColor.gray600)
    }
    
    static var textDisabled: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    static var textReversed: UIColor {
        return color(light: BasicColor.white000)
    }
    
    static var textPointed: UIColor {
        return color(light: BasicColor.pointBlue400)
    }
    
    static var textWarned: UIColor {
        return color(light: BasicColor.warningRed400)
    }
    
    //MARK:- Dim
    static var dimNormal: UIColor {
        return color(light: BasicColor.gray900A30)
    }
    
    static var dimThick: UIColor {
        return color(light: BasicColor.gray900A70)
    }
    
    
    //MARK:- Border
    static var borderThin: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    static var borderNormal: UIColor {
        return color(light: BasicColor.gray400)
    }
    
    static var borderThick: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    //MARK:- Button
    static var buttonNoraml: UIColor {
        return color(light: BasicColor.gray700)
    }
    
    static var buttonReversed: UIColor {
        return color(light: BasicColor.white000)
    }
    
    static var buttonDisabled: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    static var buttonDisabledBG: UIColor {
        return color(light: BasicColor.gray200)
    }
    
    static var buttonPoint: UIColor {
        return color(light: BasicColor.pointBlue400)
    }
    
    static var buttonPointBG: UIColor {
        return color(light: BasicColor.pointBlue050)
    }
    
    static var buttonWarned: UIColor {
        return color(light: BasicColor.warningRed400)
    }
    
    static var buttonWarnedBG: UIColor {
        return color(light: BasicColor.warningRed050)
    }
    
    //MARK:- Tabbar
    static var tabBarNormal: UIColor {
        return color(light: BasicColor.gray600)
    }
    
    static var tabBarSelected: UIColor {
        return color(light: BasicColor.pointBlue400)
    }
    
    //MARK:- InputField
    static var inputFieldNormal: UIColor {
        return color(light: BasicColor.white000)
    }
    
    static var inputFieldElevated: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    //MARK:- Pressed
    static var pressed: UIColor {
        return color(light: BasicColor.gray900A10)
    }
    
    //MARK:- Shadow
    static var shadowThin: UIColor {
        return color(light: BasicColor.gray400)
    }
    
    static var shadowNormal: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    //MARK:- Tag
    static var monoTagPrimary: UIColor {
       return color(light: BasicColor.gray300)
    }

    static var monoTagBG: UIColor {
       return color(light: BasicColor.gray100)
    }

    static var monoTagText: UIColor {
       return color(light: BasicColor.gray900)
    }

    static var greenTagPrimary: UIColor {
       return color(light: BasicColor.green300)
    }

    static var greenTagBG: UIColor {
       return color(light: BasicColor.green050)
    }

    static var greenTagText: UIColor {
       return color(light: BasicColor.green800)
    }

    static var emeraldTagPrimary: UIColor {
       return color(light: BasicColor.emerald300)
    }

    static var emeraldTagBG: UIColor {
       return color(light: BasicColor.emerald050)
    }

    static var emeraldTagText: UIColor {
       return color(light: BasicColor.emerald800)
    }

    static var aquaTagPrimary: UIColor {
       return color(light: BasicColor.aqua300)
    }

    static var aquaTagBG: UIColor {
       return color(light: BasicColor.aqua050)
    }

    static var aquaTagText: UIColor {
       return color(light: BasicColor.aqua800)
    }

    static var blueTagPrimary: UIColor {
       return color(light: BasicColor.blue300)
    }

    static var blueTagBG: UIColor {
       return color(light: BasicColor.blue050)
    }

    static var blueTagText: UIColor {
       return color(light: BasicColor.blue800)
    }

    static var indigoTagPrimary: UIColor {
       return color(light: BasicColor.indigo300)
    }

    static var indigoTagBG: UIColor {
       return color(light: BasicColor.indigo050)
    }

    static var indigoTagText: UIColor {
       return color(light: BasicColor.indigo500)
    }

    static var violetTagPrimary: UIColor {
       return color(light: BasicColor.violet300)
    }

    static var violetTagBG: UIColor {
       return color(light: BasicColor.violet050)
    }

    static var violetTagText: UIColor {
       return color(light: BasicColor.violet500)
    }

    static var purpleTagPrimary: UIColor {
       return color(light: BasicColor.purple300)
    }

    static var purpleTagBG: UIColor {
       return color(light: BasicColor.purple050)
    }

    static var purpleTagText: UIColor {
       return color(light: BasicColor.purple500)
    }

    static var pinkTagPrimary: UIColor {
       return color(light: BasicColor.pink300)
    }

    static var pinkTagBG: UIColor {
       return color(light: BasicColor.pink050)
    }

    static var pinkTagText: UIColor {
       return color(light: BasicColor.pink800)
    }
       
}



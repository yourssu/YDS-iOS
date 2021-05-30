//
//  SemanticColor.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/26.
//
import UIKit

public class YDSColor {
    
    private init(){}
    
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
    public static var bgNormal: UIColor {
        return color(light: BasicColor.white000)
    }
    
    public static var  bgElevated: UIColor {
        return color(light: BasicColor.white000)
    }
    
    public static var bgSelected: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    public static var bgPressed: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    //MARK:- Text
    public static var textPrimary: UIColor {
        return color(light: BasicColor.gray900)
    }
    
    public static var textSecondary: UIColor {
        return color(light: BasicColor.gray800)
    }
    
    public static var textTertiary: UIColor {
        return color(light: BasicColor.gray600)
    }
    
    public static var textDisabled: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    public static var textReversed: UIColor {
        return color(light: BasicColor.white000)
    }
    
    public static var textPointed: UIColor {
        return color(light: BasicColor.pointBlue400)
    }
    
    public static var textWarned: UIColor {
        return color(light: BasicColor.warningRed400)
    }
    
    //MARK:- Dim
    public static var dimNormal: UIColor {
        return color(light: BasicColor.gray900A30)
    }
    
    public static var dimThick: UIColor {
        return color(light: BasicColor.gray900A70)
    }
    
    
    //MARK:- Border
    public static var borderThin: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    public static var borderNormal: UIColor {
        return color(light: BasicColor.gray400)
    }
    
    public static var borderThick: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    //MARK:- Button
    public static var buttonNoraml: UIColor {
        return color(light: BasicColor.gray700)
    }
    
    public static var buttonReversed: UIColor {
        return color(light: BasicColor.white000)
    }
    
    public static var buttonDisabled: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    public static var buttonDisabledBG: UIColor {
        return color(light: BasicColor.gray200)
    }
    
    public static var buttonPoint: UIColor {
        return color(light: BasicColor.pointBlue400)
    }
    
    public static var buttonPointBG: UIColor {
        return color(light: BasicColor.pointBlue050)
    }
    
    public static var buttonWarned: UIColor {
        return color(light: BasicColor.warningRed400)
    }
    
    public static var buttonWarnedBG: UIColor {
        return color(light: BasicColor.warningRed050)
    }
    
    //MARK:- Tabbar
    public static var tabBarNormal: UIColor {
        return color(light: BasicColor.gray600)
    }
    
    public static var tabBarSelected: UIColor {
        return color(light: BasicColor.pointBlue400)
    }
    
    //MARK:- InputField
    public static var inputFieldNormal: UIColor {
        return color(light: BasicColor.white000)
    }
    
    public static var inputFieldElevated: UIColor {
        return color(light: BasicColor.gray100)
    }
    
    //MARK:- Pressed
    public static var pressed: UIColor {
        return color(light: BasicColor.gray900A10)
    }
    
    //MARK:- Shadow
    public static var shadowThin: UIColor {
        return color(light: BasicColor.gray400)
    }
    
    public static var shadowNormal: UIColor {
        return color(light: BasicColor.gray500)
    }
    
    //MARK:- Tag
    public static var monoTagPrimary: UIColor {
       return color(light: BasicColor.gray300)
    }

    public static var monoTagBG: UIColor {
       return color(light: BasicColor.gray100)
    }

    public static var monoTagText: UIColor {
       return color(light: BasicColor.gray900)
    }

    public static var greenTagPrimary: UIColor {
       return color(light: BasicColor.green300)
    }

    public static var greenTagBG: UIColor {
       return color(light: BasicColor.green050)
    }

    public static var greenTagText: UIColor {
       return color(light: BasicColor.green800)
    }

    public static var emeraldTagPrimary: UIColor {
       return color(light: BasicColor.emerald300)
    }

    public static var emeraldTagBG: UIColor {
       return color(light: BasicColor.emerald050)
    }

    public static var emeraldTagText: UIColor {
       return color(light: BasicColor.emerald800)
    }

    public static var aquaTagPrimary: UIColor {
       return color(light: BasicColor.aqua300)
    }

    public static var aquaTagBG: UIColor {
       return color(light: BasicColor.aqua050)
    }

    public static var aquaTagText: UIColor {
       return color(light: BasicColor.aqua800)
    }

    public static var blueTagPrimary: UIColor {
       return color(light: BasicColor.blue300)
    }

    public static var blueTagBG: UIColor {
       return color(light: BasicColor.blue050)
    }

    public static var blueTagText: UIColor {
       return color(light: BasicColor.blue800)
    }

    public static var indigoTagPrimary: UIColor {
       return color(light: BasicColor.indigo300)
    }

    public static var indigoTagBG: UIColor {
       return color(light: BasicColor.indigo050)
    }

    public static var indigoTagText: UIColor {
       return color(light: BasicColor.indigo500)
    }

    public static var violetTagPrimary: UIColor {
       return color(light: BasicColor.violet300)
    }

    public static var violetTagBG: UIColor {
       return color(light: BasicColor.violet050)
    }

    public static var violetTagText: UIColor {
       return color(light: BasicColor.violet500)
    }

    public static var purpleTagPrimary: UIColor {
       return color(light: BasicColor.purple300)
    }

    public static var purpleTagBG: UIColor {
       return color(light: BasicColor.purple050)
    }

    public static var purpleTagText: UIColor {
       return color(light: BasicColor.purple500)
    }

    public static var pinkTagPrimary: UIColor {
       return color(light: BasicColor.pink300)
    }

    public static var pinkTagBG: UIColor {
       return color(light: BasicColor.pink050)
    }

    public static var pinkTagText: UIColor {
       return color(light: BasicColor.pink800)
    }
       
}



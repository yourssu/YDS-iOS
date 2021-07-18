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
    
    public static var dimThickReversed: UIColor {
        return color(light: BasicColor.white000A70)
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
    public static var buttonNormal: UIColor {
        return color(light: BasicColor.gray700)
    }
    
    public static var buttonNormalPressed: UIColor {
        return color(light: BasicColor.gray600)
    }
    
    public static var buttonBG: UIColor {
        return color(light: BasicColor.gray200)
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
    
    public static var buttonPointPressed: UIColor {
        return color(light: BasicColor.pointBlue300)
    }
    
    public static var buttonPointBG: UIColor {
        return color(light: BasicColor.pointBlue050)
    }
    
    public static var buttonWarned: UIColor {
        return color(light: BasicColor.warningRed400)
    }
    
    public static var buttonWarnedPressed: UIColor {
        return color(light: BasicColor.warningRed300)
    }
    
    public static var buttonWarnedBG: UIColor {
        return color(light: BasicColor.warningRed050)
    }
    
    //MARK:- BottomBar
    public static var bottomBarNormal: UIColor {
        return color(light: BasicColor.gray600)
    }
    
    public static var bottomBarSelected: UIColor {
        return color(light: BasicColor.gray800)
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
    
    //MARK:- Item
    public static var monoItemPrimary: UIColor {
       return color(light: BasicColor.gray700)
    }

    public static var monoItemBG: UIColor {
       return color(light: BasicColor.gray100)
    }

    public static var monoItemText: UIColor {
       return color(light: BasicColor.gray800)
    }

    public static var greenItemPrimary: UIColor {
       return color(light: BasicColor.green300)
    }

    public static var greenItemBG: UIColor {
       return color(light: BasicColor.green050)
    }

    public static var greenItemText: UIColor {
       return color(light: BasicColor.green800)
    }

    public static var emeraldItemPrimary: UIColor {
       return color(light: BasicColor.emerald300)
    }

    public static var emeraldItemBG: UIColor {
       return color(light: BasicColor.emerald050)
    }

    public static var emeraldItemText: UIColor {
       return color(light: BasicColor.emerald800)
    }

    public static var aquaItemPrimary: UIColor {
       return color(light: BasicColor.aqua300)
    }

    public static var aquaItemBG: UIColor {
       return color(light: BasicColor.aqua050)
    }

    public static var aquaItemText: UIColor {
       return color(light: BasicColor.aqua700)
    }

    public static var blueItemPrimary: UIColor {
       return color(light: BasicColor.blue300)
    }

    public static var blueItemBG: UIColor {
       return color(light: BasicColor.blue050)
    }

    public static var blueItemText: UIColor {
       return color(light: BasicColor.blue700)
    }

    public static var indigoItemPrimary: UIColor {
       return color(light: BasicColor.indigo300)
    }

    public static var indigoItemBG: UIColor {
       return color(light: BasicColor.indigo050)
    }

    public static var indigoItemText: UIColor {
       return color(light: BasicColor.indigo400)
    }

    public static var violetItemPrimary: UIColor {
       return color(light: BasicColor.violet300)
    }

    public static var violetItemBG: UIColor {
       return color(light: BasicColor.violet050)
    }

    public static var violetItemText: UIColor {
       return color(light: BasicColor.violet400)
    }

    public static var purpleItemPrimary: UIColor {
       return color(light: BasicColor.purple300)
    }

    public static var purpleItemBG: UIColor {
       return color(light: BasicColor.purple050)
    }

    public static var purpleItemText: UIColor {
       return color(light: BasicColor.purple400)
    }

    public static var pinkItemPrimary: UIColor {
       return color(light: BasicColor.pink300)
    }

    public static var pinkItemBG: UIColor {
       return color(light: BasicColor.pink050)
    }

    public static var pinkItemText: UIColor {
       return color(light: BasicColor.pink600)
    }
       
}



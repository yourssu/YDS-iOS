//
//  SemanticColor.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/26.
//
import UIKit

public extension UIColor {
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
    class var bg: UIColor {
        return color(light: .white000)
    }
    
    class var bgNormal: UIColor {
        return color(light: .white000)
    }
    
    class var bgSelected: UIColor {
        return color(light: .gray100)
    }
    
    class var bgPressed: UIColor {
        return color(light: .gray100)
    }
    
    //MARK:- Text
    class var textPrimary: UIColor {
        return color(light: .gray900)
    }
    
    class var textSecondary: UIColor {
        return color(light: .gray800)
    }
    
    class var textTertiary: UIColor {
        return color(light: .gray600)
    }
    
    class var textDisabled: UIColor {
        return color(light: .gray500)
    }
    
    class var textReversed: UIColor {
        return color(light: .white000)
    }
    
    class var textPointed: UIColor {
        return color(light: .pointBlue400)
    }
    
    class var textWarned: UIColor {
        return color(light: .warningRed400)
    }
    
    //MARK:- Dim
    class var dimNormal: UIColor {
        return color(light: .gray900A30)
    }
    
    class var dimThick: UIColor {
        return color(light: .gray900A70)
    }
    
    
    //MARK:- Border
    class var borderThin: UIColor {
        return color(light: .gray050)
    }
    
    class var borderNormal: UIColor {
        return color(light: .gray300)
    }
    
    class var borderThick: UIColor {
        return color(light: .gray500)
    }
    
    //MARK:- Button
    class var buttonNoraml: UIColor {
        return color(light: .gray700)
    }
    
    class var buttonReversed: UIColor {
        return color(light: .white000)
    }
    
    class var buttonDisabled: UIColor {
        return color(light: .gray500)
    }
    
    class var buttonDisabledBG: UIColor {
        return color(light: .gray200)
    }
    
    class var buttonPoint: UIColor {
        return color(light: .pointBlue400)
    }
    
    class var buttonPointBG: UIColor {
        return color(light: .pointBlue050)
    }
    
    class var buttonWarned: UIColor {
        return color(light: .warningRed400)
    }
    
    class var buttonWarnedBG: UIColor {
        return color(light: .warningRed050)
    }
    
    //MARK:- Tabbar
    class var tabBarNormal: UIColor {
        return color(light: .gray600)
    }
    
    class var tabBarSelected: UIColor {
        return color(light: .pointBlue400)
    }
    
    //MARK:- InputField
    class var inputFieldNormal: UIColor {
        return color(light: .white000)
    }
    
    class var inputFieldElevated: UIColor {
        return color(light: .gray100)
    }
    
    //MARK:- Pressed
    class var pressed: UIColor {
        return color(light: .gray900A10)
    }
    
    //MARK:- Shadow
    class var shadowThin: UIColor {
        return color(light: .gray400)
    }
    
    class var shadowNormal: UIColor {
        return color(light: .gray500)
    }
    
}



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

    @nonobjc class var bg: UIColor {
        return color(light: .white000)
    }
    
    @nonobjc class var bgNormal: UIColor {
        return color(light: .white000)
    }
    
    @nonobjc class var bgSelected: UIColor {
        return color(light: .gray100)
    }
    
    @nonobjc class var bgPressed: UIColor {
        return color(light: .gray100)
    }
    
    
    
    @nonobjc class var textPrimary: UIColor {
        return color(light: .gray900)
    }
    
    @nonobjc class var textSecondary: UIColor {
        return color(light: .gray800)
    }
    
    @nonobjc class var textTertiary: UIColor {
        return color(light: .gray600)
    }
    
    @nonobjc class var textDisabled: UIColor {
        return color(light: .gray500)
    }
    
    @nonobjc class var textReversed: UIColor {
        return color(light: .white000)
    }
    
    @nonobjc class var textPointed: UIColor {
        return color(light: .pointBlue400)
    }
    
    @nonobjc class var textWarned: UIColor {
        return color(light: .warningRed400)
    }
    
    
    
    @nonobjc class var dimNormal: UIColor {
        return color(light: .gray900A30)
    }
    
    @nonobjc class var dimThick: UIColor {
        return color(light: .gray900A70)
    }
    
    
    
    @nonobjc class var borderThin: UIColor {
        return color(light: .gray050)
    }
    
    @nonobjc class var borderNormal: UIColor {
        return color(light: .gray300)
    }
    
    @nonobjc class var borderThick: UIColor {
        return color(light: .gray500)
    }
    
    
    
    @nonobjc class var buttonNoraml: UIColor {
        return color(light: .gray700)
    }
    
    @nonobjc class var buttonReversed: UIColor {
        return color(light: .white000)
    }
    
    @nonobjc class var buttonDisabled: UIColor {
        return color(light: .gray500)
    }
    
    @nonobjc class var buttonDisabledBG: UIColor {
        return color(light: .gray200)
    }
    
    @nonobjc class var buttonPoint: UIColor {
        return color(light: .pointBlue400)
    }
    
    @nonobjc class var buttonPointBG: UIColor {
        return color(light: .pointBlue050)
    }
    
    @nonobjc class var buttonWarned: UIColor {
        return color(light: .warningRed400)
    }
    
    @nonobjc class var buttonWarnedBG: UIColor {
        return color(light: .warningRed050)
    }
    
    
    
    @nonobjc class var tabBarNormal: UIColor {
        return color(light: .gray600)
    }
    
    @nonobjc class var tabBarSelected: UIColor {
        return color(light: .pointBlue400)
    }
    
    
    
    @nonobjc class var inputFieldNormal: UIColor {
        return color(light: .white000)
    }
    
    @nonobjc class var inputFieldElevated: UIColor {
        return color(light: .gray100)
    }
    
    
    
    @nonobjc class var pressed: UIColor {
        return color(light: .gray900A10)
    }
    
    @nonobjc class var shadowThin: UIColor {
        return color(light: .gray400)
    }
    
    @nonobjc class var shadowNormal: UIColor {
        return color(light: .gray500)
    }
}



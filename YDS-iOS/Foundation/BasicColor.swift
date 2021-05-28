//
//  BasicColor.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/26.
//

import UIKit

fileprivate extension UIColor{
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}

internal extension UIColor {
    @nonobjc class var logoBlue: UIColor {
        return UIColor(hex: "#1653DB")
    }

    @nonobjc class var logoYellow: UIColor {
        return UIColor(hex: "#FFC441")
    }

    @nonobjc class var white000: UIColor {
        return UIColor(hex: "#FFFFFF")
    }

    @nonobjc class var black000: UIColor {
        return UIColor(hex: "#111111")
    }

    @nonobjc class var pointBlue050: UIColor {
        return UIColor(hex: "#E1F2FE")
    }

    @nonobjc class var pointBlue100: UIColor {
        return UIColor(hex: "#B6DDFE")
    }

    @nonobjc class var pointBlue200: UIColor {
        return UIColor(hex: "#86C8FE")
    }

    @nonobjc class var pointBlue300: UIColor {
        return UIColor(hex: "#4EB2FE")
    }

    @nonobjc class var pointBlue400: UIColor {
        return UIColor(hex: "#00A3FF")
    }

    @nonobjc class var pointBlue500: UIColor {
        return UIColor(hex: "#0092FE")
    }

    @nonobjc class var pointBlue600: UIColor {
        return UIColor(hex: "#0084F0")
    }

    @nonobjc class var pointBlue700: UIColor {
        return UIColor(hex: "#0072DD")
    }

    @nonobjc class var pointBlue800: UIColor {
        return UIColor(hex: "#0060CB")
    }

    @nonobjc class var pointBlue900: UIColor {
        return UIColor(hex: "#0042AB")
    }

    @nonobjc class var warningRed050: UIColor {
        return UIColor(hex: "#FFECEF")
    }

    @nonobjc class var warningRed100: UIColor {
        return UIColor(hex: "#FFCED4")
    }

    @nonobjc class var warningRed200: UIColor {
        return UIColor(hex: "#F99C9D")
    }

    @nonobjc class var warningRed300: UIColor {
        return UIColor(hex: "#F37476")
    }

    @nonobjc class var warningRed400: UIColor {
        return UIColor(hex: "#FF5252")
    }

    @nonobjc class var warningRed500: UIColor {
        return UIColor(hex: "#FF3E36")
    }

    @nonobjc class var warningRed600: UIColor {
        return UIColor(hex: "#F73536")
    }

    @nonobjc class var warningRed700: UIColor {
        return UIColor(hex: "#E42930")
    }

    @nonobjc class var warningRed800: UIColor {
        return UIColor(hex: "#D72028")
    }

    @nonobjc class var warningRed900: UIColor {
        return UIColor(hex: "#C8111C")
    }

    @nonobjc class var gray050: UIColor {
        return UIColor(hex: "#F8F9FA")
    }

    @nonobjc class var gray100: UIColor {
        return UIColor(hex: "#F3F5F7")
    }

    @nonobjc class var gray200: UIColor {
        return UIColor(hex: "#ECEEF0")
    }

    @nonobjc class var gray300: UIColor {
        return UIColor(hex: "#E2E5E8")
    }

    @nonobjc class var gray400: UIColor {
        return UIColor(hex: "#D4D8DC")
    }

    @nonobjc class var gray500: UIColor {
        return UIColor(hex: "#B5B9BD")
    }

    @nonobjc class var gray600: UIColor {
        return UIColor(hex: "#8E9398")
    }

    @nonobjc class var gray700: UIColor {
        return UIColor(hex: "#505458")
    }

    @nonobjc class var gray800: UIColor {
        return UIColor(hex: "#3A3D40")
    }

    @nonobjc class var gray900: UIColor {
        return UIColor(hex: "#252729")
    }
    
    @nonobjc class var gray900A10: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.1)
    }
    
    @nonobjc class var gray900A30: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.3)
    }
    
    @nonobjc class var gray900A70: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.7)
    }

    @nonobjc class var pink050: UIColor {
        return UIColor(hex: "#FDE6F4")
    }

    @nonobjc class var pink100: UIColor {
        return UIColor(hex: "#FBC1E5")
    }

    @nonobjc class var pink200: UIColor {
        return UIColor(hex: "#FC98D3")
    }

    @nonobjc class var pink300: UIColor {
        return UIColor(hex: "#FF6CBF")
    }

    @nonobjc class var pink400: UIColor {
        return UIColor(hex: "#FF47AD")
    }

    @nonobjc class var pink500: UIColor {
        return UIColor(hex: "#FF1F99")
    }

    @nonobjc class var pink600: UIColor {
        return UIColor(hex: "#F21F93")
    }

    @nonobjc class var pink700: UIColor {
        return UIColor(hex: "#DA1F8B")
    }

    @nonobjc class var pink800: UIColor {
        return UIColor(hex: "#C31F85")
    }

    @nonobjc class var red050: UIColor {
        return UIColor(hex: "#FFEBEE")
    }

    @nonobjc class var red100: UIColor {
        return UIColor(hex: "#FFCDD2")
    }

    @nonobjc class var red200: UIColor {
        return UIColor(hex: "#EF9A9A")
    }

    @nonobjc class var red300: UIColor {
        return UIColor(hex: "#E57373")
    }

    @nonobjc class var red400: UIColor {
        return UIColor(hex: "#EF5350")
    }

    @nonobjc class var red500: UIColor {
        return UIColor(hex: "#F44236")
    }

    @nonobjc class var red600: UIColor {
        return UIColor(hex: "#E53835")
    }

    @nonobjc class var red700: UIColor {
        return UIColor(hex: "#D32E2F")
    }

    @nonobjc class var red800: UIColor {
        return UIColor(hex: "#C62728")
    }

    @nonobjc class var orange050: UIColor {
        return UIColor(hex: "#FFF1E4")
    }

    @nonobjc class var orange100: UIColor {
        return UIColor(hex: "#FFDBBC")
    }

    @nonobjc class var orange200: UIColor {
        return UIColor(hex: "#FFC492")
    }

    @nonobjc class var orange300: UIColor {
        return UIColor(hex: "#FFAC6C")
    }

    @nonobjc class var orange400: UIColor {
        return UIColor(hex: "#FD9A55")
    }

    @nonobjc class var orange500: UIColor {
        return UIColor(hex: "#FC8A46")
    }

    @nonobjc class var orange600: UIColor {
        return UIColor(hex: "#F67F44")
    }

    @nonobjc class var orange700: UIColor {
        return UIColor(hex: "#EE7141")
    }

    @nonobjc class var orange800: UIColor {
        return UIColor(hex: "#E6623E")
    }

    @nonobjc class var yellow050: UIColor {
        return UIColor(hex: "#FFF8DC")
    }

    @nonobjc class var yellow100: UIColor {
        return UIColor(hex: "#FFF0AB")
    }

    @nonobjc class var yellow200: UIColor {
        return UIColor(hex: "#FFE672")
    }

    @nonobjc class var yellow300: UIColor {
        return UIColor(hex: "#FFDC3A")
    }

    @nonobjc class var yellow400: UIColor {
        return UIColor(hex: "#FFD200")
    }

    @nonobjc class var yellow500: UIColor {
        return UIColor(hex: "#FBC000")
    }

    @nonobjc class var yellow600: UIColor {
        return UIColor(hex: "#F6B000")
    }

    @nonobjc class var yellow700: UIColor {
        return UIColor(hex: "#E1A714")
    }

    @nonobjc class var yellow800: UIColor {
        return UIColor(hex: "#CC9200")
    }

    @nonobjc class var lime050: UIColor {
        return UIColor(hex: "#F9FBE7")
    }

    @nonobjc class var lime100: UIColor {
        return UIColor(hex: "#F0F4C3")
    }

    @nonobjc class var lime200: UIColor {
        return UIColor(hex: "#E5EE9C")
    }

    @nonobjc class var lime300: UIColor {
        return UIColor(hex: "#DBE775")
    }

    @nonobjc class var lime400: UIColor {
        return UIColor(hex: "#D3E157")
    }

    @nonobjc class var lime500: UIColor {
        return UIColor(hex: "#CCDC39")
    }

    @nonobjc class var lime600: UIColor {
        return UIColor(hex: "#BFCA33")
    }

    @nonobjc class var lime700: UIColor {
        return UIColor(hex: "#AEB42B")
    }

    @nonobjc class var lime800: UIColor {
        return UIColor(hex: "#9D9D24")
    }

    @nonobjc class var green050: UIColor {
        return UIColor(hex: "#E5F9EE")
    }

    @nonobjc class var green100: UIColor {
        return UIColor(hex: "#BFF0D5")
    }

    @nonobjc class var green200: UIColor {
        return UIColor(hex: "#93E7BB")
    }

    @nonobjc class var green300: UIColor {
        return UIColor(hex: "#5BDE9F")
    }

    @nonobjc class var green400: UIColor {
        return UIColor(hex: "#0BD588")
    }

    @nonobjc class var green500: UIColor {
        return UIColor(hex: "#00CC74")
    }

    @nonobjc class var green600: UIColor {
        return UIColor(hex: "#00BB68")
    }

    @nonobjc class var green700: UIColor {
        return UIColor(hex: "#00A85B")
    }

    @nonobjc class var green800: UIColor {
        return UIColor(hex: "#00964F")
    }

    @nonobjc class var emerald050: UIColor {
        return UIColor(hex: "#E0F8F7")
    }

    @nonobjc class var emerald100: UIColor {
        return UIColor(hex: "#B3ECEA")
    }

    @nonobjc class var emerald200: UIColor {
        return UIColor(hex: "#82E0DF")
    }

    @nonobjc class var emerald300: UIColor {
        return UIColor(hex: "#51D2D4")
    }

    @nonobjc class var emerald400: UIColor {
        return UIColor(hex: "#2BC9CC")
    }

    @nonobjc class var emerald500: UIColor {
        return UIColor(hex: "#00BFC7")
    }

    @nonobjc class var emerald600: UIColor {
        return UIColor(hex: "#00AFB5")
    }

    @nonobjc class var emerald700: UIColor {
        return UIColor(hex: "#069A9C")
    }

    @nonobjc class var emerald800: UIColor {
        return UIColor(hex: "#088585")
    }

    @nonobjc class var aqua050: UIColor {
        return UIColor(hex: "#E0F4FD")
    }

    @nonobjc class var aqua100: UIColor {
        return UIColor(hex: "#B2E3FA")
    }

    @nonobjc class var aqua200: UIColor {
        return UIColor(hex: "#7FD0F7")
    }

    @nonobjc class var aqua300: UIColor {
        return UIColor(hex: "#4CBEF3")
    }

    @nonobjc class var aqua400: UIColor {
        return UIColor(hex: "#26B0F1")
    }

    @nonobjc class var aqua500: UIColor {
        return UIColor(hex: "#00A2EE")
    }

    @nonobjc class var aqua600: UIColor {
        return UIColor(hex: "#0095DF")
    }

    @nonobjc class var aqua700: UIColor {
        return UIColor(hex: "#0182CB")
    }

    @nonobjc class var aqua800: UIColor {
        return UIColor(hex: "#0171B7")
    }

    @nonobjc class var blue050: UIColor {
        return UIColor(hex: "#E4F1FA")
    }

    @nonobjc class var blue100: UIColor {
        return UIColor(hex: "#BEDCF3")
    }

    @nonobjc class var blue200: UIColor {
        return UIColor(hex: "#98C6EC")
    }

    @nonobjc class var blue300: UIColor {
        return UIColor(hex: "#74B0E2")
    }

    @nonobjc class var blue400: UIColor {
        return UIColor(hex: "#489AE7")
    }

    @nonobjc class var blue500: UIColor {
        return UIColor(hex: "#4B90D7")
    }

    @nonobjc class var blue600: UIColor {
        return UIColor(hex: "#4582CA")
    }

    @nonobjc class var blue700: UIColor {
        return UIColor(hex: "#3C71B8")
    }

    @nonobjc class var blue800: UIColor {
        return UIColor(hex: "#3661A5")
    }

    @nonobjc class var indigo050: UIColor {
        return UIColor(hex: "#E8EAF6")
    }

    @nonobjc class var indigo100: UIColor {
        return UIColor(hex: "#C5CAE9")
    }

    @nonobjc class var indigo200: UIColor {
        return UIColor(hex: "#9FA8DA")
    }

    @nonobjc class var indigo300: UIColor {
        return UIColor(hex: "#7986CB")
    }

    @nonobjc class var indigo400: UIColor {
        return UIColor(hex: "#5C6CC0")
    }

    @nonobjc class var indigo500: UIColor {
        return UIColor(hex: "#3F52B5")
    }

    @nonobjc class var indigo600: UIColor {
        return UIColor(hex: "#394AAB")
    }

    @nonobjc class var indigo700: UIColor {
        return UIColor(hex: "#2F409F")
    }

    @nonobjc class var indigo800: UIColor {
        return UIColor(hex: "#273693")
    }

    @nonobjc class var violet050: UIColor {
        return UIColor(hex: "#EDE7F6")
    }

    @nonobjc class var violet100: UIColor {
        return UIColor(hex: "#D1C4E9")
    }

    @nonobjc class var violet200: UIColor {
        return UIColor(hex: "#B39DDB")
    }

    @nonobjc class var violet300: UIColor {
        return UIColor(hex: "#9575CD")
    }

    @nonobjc class var violet400: UIColor {
        return UIColor(hex: "#7E57C2")
    }

    @nonobjc class var violet500: UIColor {
        return UIColor(hex: "#673AB7")
    }

    @nonobjc class var violet600: UIColor {
        return UIColor(hex: "#5E35B1")
    }

    @nonobjc class var violet700: UIColor {
        return UIColor(hex: "#512DA8")
    }

    @nonobjc class var violet800: UIColor {
        return UIColor(hex: "#4527A0")
    }

    @nonobjc class var purple050: UIColor {
        return UIColor(hex: "#F2E5F5")
    }

    @nonobjc class var purple100: UIColor {
        return UIColor(hex: "#DFBFE7")
    }

    @nonobjc class var purple200: UIColor {
        return UIColor(hex: "#CA95D8")
    }

    @nonobjc class var purple300: UIColor {
        return UIColor(hex: "#B56CC8")
    }

    @nonobjc class var purple400: UIColor {
        return UIColor(hex: "#A54DBB")
    }

    @nonobjc class var purple500: UIColor {
        return UIColor(hex: "#9632AF")
    }

    @nonobjc class var purple600: UIColor {
        return UIColor(hex: "#882EA9")
    }

    @nonobjc class var purple700: UIColor {
        return UIColor(hex:"#7629A0")
    }

    @nonobjc class var purple800: UIColor {
        return UIColor(hex:"#652597")
    }

    @nonobjc class var brown050: UIColor {
        return UIColor(hex:"#EFEBE9")
    }

    @nonobjc class var brown100: UIColor {
        return UIColor(hex:"#D7CCC8")
    }

    @nonobjc class var brown200: UIColor {
        return UIColor(hex:"#BCAAA4")
    }

    @nonobjc class var brown300: UIColor {
        return UIColor(hex: "#A1887F")
    }

    @nonobjc class var brown400: UIColor {
        return UIColor(hex: "#8D6E63")
    }

    @nonobjc class var brown500: UIColor {
        return UIColor(hex: "#795548")
    }

    @nonobjc class var brown600: UIColor {
        return UIColor(hex: "#6D4C41")
    }

    @nonobjc class var brown700: UIColor {
        return UIColor(hex: "#5D4037")
    }

    @nonobjc class var brown800: UIColor {
        return UIColor(hex: "#4E342E")
    }
}

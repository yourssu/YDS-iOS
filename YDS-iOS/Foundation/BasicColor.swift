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

internal enum BasicColor {
    static var logoBlue: UIColor {
        return UIColor(hex: "#1653DB")
    }

    static var logoYellow: UIColor {
        return UIColor(hex: "#FFC441")
    }

    static var white000: UIColor {
        return UIColor(hex: "#FFFFFF")
    }

    static var black000: UIColor {
        return UIColor(hex: "#111111")
    }

    static var pointBlue050: UIColor {
        return UIColor(hex: "#E1F2FE")
    }

    static var pointBlue100: UIColor {
        return UIColor(hex: "#B6DDFE")
    }

    static var pointBlue200: UIColor {
        return UIColor(hex: "#86C8FE")
    }

    static var pointBlue300: UIColor {
        return UIColor(hex: "#4EB2FE")
    }

    static var pointBlue400: UIColor {
        return UIColor(hex: "#00A3FF")
    }

    static var pointBlue500: UIColor {
        return UIColor(hex: "#0092FE")
    }

    static var pointBlue600: UIColor {
        return UIColor(hex: "#0084F0")
    }

    static var pointBlue700: UIColor {
        return UIColor(hex: "#0072DD")
    }

    static var pointBlue800: UIColor {
        return UIColor(hex: "#0060CB")
    }

    static var pointBlue900: UIColor {
        return UIColor(hex: "#0042AB")
    }

    static var warningRed050: UIColor {
        return UIColor(hex: "#FFECEF")
    }

    static var warningRed100: UIColor {
        return UIColor(hex: "#FFCED4")
    }

    static var warningRed200: UIColor {
        return UIColor(hex: "#F99C9D")
    }

    static var warningRed300: UIColor {
        return UIColor(hex: "#F37476")
    }

    static var warningRed400: UIColor {
        return UIColor(hex: "#FF5252")
    }

    static var warningRed500: UIColor {
        return UIColor(hex: "#FF3E36")
    }

    static var warningRed600: UIColor {
        return UIColor(hex: "#F73536")
    }

    static var warningRed700: UIColor {
        return UIColor(hex: "#E42930")
    }

    static var warningRed800: UIColor {
        return UIColor(hex: "#D72028")
    }

    static var warningRed900: UIColor {
        return UIColor(hex: "#C8111C")
    }

    static var gray050: UIColor {
        return UIColor(hex: "#F8F9FA")
    }

    static var gray100: UIColor {
        return UIColor(hex: "#F3F5F7")
    }

    static var gray200: UIColor {
        return UIColor(hex: "#ECEEF0")
    }

    static var gray300: UIColor {
        return UIColor(hex: "#E2E5E8")
    }

    static var gray400: UIColor {
        return UIColor(hex: "#D4D8DC")
    }

    static var gray500: UIColor {
        return UIColor(hex: "#B5B9BD")
    }

    static var gray600: UIColor {
        return UIColor(hex: "#8E9398")
    }

    static var gray700: UIColor {
        return UIColor(hex: "#505458")
    }

    static var gray800: UIColor {
        return UIColor(hex: "#3A3D40")
    }

    static var gray900: UIColor {
        return UIColor(hex: "#252729")
    }
    
    static var gray900A10: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.1)
    }
    
    static var gray900A30: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.3)
    }
    
    static var gray900A70: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.7)
    }

    static var pink050: UIColor {
        return UIColor(hex: "#FDE6F4")
    }

    static var pink100: UIColor {
        return UIColor(hex: "#FBC1E5")
    }

    static var pink200: UIColor {
        return UIColor(hex: "#FC98D3")
    }

    static var pink300: UIColor {
        return UIColor(hex: "#FF6CBF")
    }

    static var pink400: UIColor {
        return UIColor(hex: "#FF47AD")
    }

    static var pink500: UIColor {
        return UIColor(hex: "#FF1F99")
    }

    static var pink600: UIColor {
        return UIColor(hex: "#F21F93")
    }

    static var pink700: UIColor {
        return UIColor(hex: "#DA1F8B")
    }

    static var pink800: UIColor {
        return UIColor(hex: "#C31F85")
    }

    static var red050: UIColor {
        return UIColor(hex: "#FFEBEE")
    }

    static var red100: UIColor {
        return UIColor(hex: "#FFCDD2")
    }

    static var red200: UIColor {
        return UIColor(hex: "#EF9A9A")
    }

    static var red300: UIColor {
        return UIColor(hex: "#E57373")
    }

    static var red400: UIColor {
        return UIColor(hex: "#EF5350")
    }

    static var red500: UIColor {
        return UIColor(hex: "#F44236")
    }

    static var red600: UIColor {
        return UIColor(hex: "#E53835")
    }

    static var red700: UIColor {
        return UIColor(hex: "#D32E2F")
    }

    static var red800: UIColor {
        return UIColor(hex: "#C62728")
    }

    static var orange050: UIColor {
        return UIColor(hex: "#FFF1E4")
    }

    static var orange100: UIColor {
        return UIColor(hex: "#FFDBBC")
    }

    static var orange200: UIColor {
        return UIColor(hex: "#FFC492")
    }

    static var orange300: UIColor {
        return UIColor(hex: "#FFAC6C")
    }

    static var orange400: UIColor {
        return UIColor(hex: "#FD9A55")
    }

    static var orange500: UIColor {
        return UIColor(hex: "#FC8A46")
    }

    static var orange600: UIColor {
        return UIColor(hex: "#F67F44")
    }

    static var orange700: UIColor {
        return UIColor(hex: "#EE7141")
    }

    static var orange800: UIColor {
        return UIColor(hex: "#E6623E")
    }

    static var yellow050: UIColor {
        return UIColor(hex: "#FFF8DC")
    }

    static var yellow100: UIColor {
        return UIColor(hex: "#FFF0AB")
    }

    static var yellow200: UIColor {
        return UIColor(hex: "#FFE672")
    }

    static var yellow300: UIColor {
        return UIColor(hex: "#FFDC3A")
    }

    static var yellow400: UIColor {
        return UIColor(hex: "#FFD200")
    }

    static var yellow500: UIColor {
        return UIColor(hex: "#FBC000")
    }

    static var yellow600: UIColor {
        return UIColor(hex: "#F6B000")
    }

    static var yellow700: UIColor {
        return UIColor(hex: "#E1A714")
    }

    static var yellow800: UIColor {
        return UIColor(hex: "#CC9200")
    }

    static var lime050: UIColor {
        return UIColor(hex: "#F9FBE7")
    }

    static var lime100: UIColor {
        return UIColor(hex: "#F0F4C3")
    }

    static var lime200: UIColor {
        return UIColor(hex: "#E5EE9C")
    }

    static var lime300: UIColor {
        return UIColor(hex: "#DBE775")
    }

    static var lime400: UIColor {
        return UIColor(hex: "#D3E157")
    }

    static var lime500: UIColor {
        return UIColor(hex: "#CCDC39")
    }

    static var lime600: UIColor {
        return UIColor(hex: "#BFCA33")
    }

    static var lime700: UIColor {
        return UIColor(hex: "#AEB42B")
    }

    static var lime800: UIColor {
        return UIColor(hex: "#9D9D24")
    }

    static var green050: UIColor {
        return UIColor(hex: "#E5F9EE")
    }

    static var green100: UIColor {
        return UIColor(hex: "#BFF0D5")
    }

    static var green200: UIColor {
        return UIColor(hex: "#93E7BB")
    }

    static var green300: UIColor {
        return UIColor(hex: "#5BDE9F")
    }

    static var green400: UIColor {
        return UIColor(hex: "#0BD588")
    }

    static var green500: UIColor {
        return UIColor(hex: "#00CC74")
    }

    static var green600: UIColor {
        return UIColor(hex: "#00BB68")
    }

    static var green700: UIColor {
        return UIColor(hex: "#00A85B")
    }

    static var green800: UIColor {
        return UIColor(hex: "#00964F")
    }

    static var emerald050: UIColor {
        return UIColor(hex: "#E0F8F7")
    }

    static var emerald100: UIColor {
        return UIColor(hex: "#B3ECEA")
    }

    static var emerald200: UIColor {
        return UIColor(hex: "#82E0DF")
    }

    static var emerald300: UIColor {
        return UIColor(hex: "#51D2D4")
    }

    static var emerald400: UIColor {
        return UIColor(hex: "#2BC9CC")
    }

    static var emerald500: UIColor {
        return UIColor(hex: "#00BFC7")
    }

    static var emerald600: UIColor {
        return UIColor(hex: "#00AFB5")
    }

    static var emerald700: UIColor {
        return UIColor(hex: "#069A9C")
    }

    static var emerald800: UIColor {
        return UIColor(hex: "#088585")
    }

    static var aqua050: UIColor {
        return UIColor(hex: "#E0F4FD")
    }

    static var aqua100: UIColor {
        return UIColor(hex: "#B2E3FA")
    }

    static var aqua200: UIColor {
        return UIColor(hex: "#7FD0F7")
    }

    static var aqua300: UIColor {
        return UIColor(hex: "#4CBEF3")
    }

    static var aqua400: UIColor {
        return UIColor(hex: "#26B0F1")
    }

    static var aqua500: UIColor {
        return UIColor(hex: "#00A2EE")
    }

    static var aqua600: UIColor {
        return UIColor(hex: "#0095DF")
    }

    static var aqua700: UIColor {
        return UIColor(hex: "#0182CB")
    }

    static var aqua800: UIColor {
        return UIColor(hex: "#0171B7")
    }

    static var blue050: UIColor {
        return UIColor(hex: "#E4F1FA")
    }

    static var blue100: UIColor {
        return UIColor(hex: "#BEDCF3")
    }

    static var blue200: UIColor {
        return UIColor(hex: "#98C6EC")
    }

    static var blue300: UIColor {
        return UIColor(hex: "#74B0E2")
    }

    static var blue400: UIColor {
        return UIColor(hex: "#489AE7")
    }

    static var blue500: UIColor {
        return UIColor(hex: "#4B90D7")
    }

    static var blue600: UIColor {
        return UIColor(hex: "#4582CA")
    }

    static var blue700: UIColor {
        return UIColor(hex: "#3C71B8")
    }

    static var blue800: UIColor {
        return UIColor(hex: "#3661A5")
    }

    @nonobjc static var indigo050: UIColor {
        return UIColor(hex: "#E8EAF6")
    }

    static var indigo100: UIColor {
        return UIColor(hex: "#C5CAE9")
    }

    static var indigo200: UIColor {
        return UIColor(hex: "#9FA8DA")
    }

    static var indigo300: UIColor {
        return UIColor(hex: "#7986CB")
    }

    static var indigo400: UIColor {
        return UIColor(hex: "#5C6CC0")
    }

    static var indigo500: UIColor {
        return UIColor(hex: "#3F52B5")
    }

    static var indigo600: UIColor {
        return UIColor(hex: "#394AAB")
    }

    static var indigo700: UIColor {
        return UIColor(hex: "#2F409F")
    }

    static var indigo800: UIColor {
        return UIColor(hex: "#273693")
    }

    static var violet050: UIColor {
        return UIColor(hex: "#EDE7F6")
    }

    static var violet100: UIColor {
        return UIColor(hex: "#D1C4E9")
    }

    static var violet200: UIColor {
        return UIColor(hex: "#B39DDB")
    }

    static var violet300: UIColor {
        return UIColor(hex: "#9575CD")
    }

    static var violet400: UIColor {
        return UIColor(hex: "#7E57C2")
    }

    static var violet500: UIColor {
        return UIColor(hex: "#673AB7")
    }

    static var violet600: UIColor {
        return UIColor(hex: "#5E35B1")
    }

    static var violet700: UIColor {
        return UIColor(hex: "#512DA8")
    }

    static var violet800: UIColor {
        return UIColor(hex: "#4527A0")
    }

    static var purple050: UIColor {
        return UIColor(hex: "#F2E5F5")
    }

    static var purple100: UIColor {
        return UIColor(hex: "#DFBFE7")
    }

    static var purple200: UIColor {
        return UIColor(hex: "#CA95D8")
    }

    static var purple300: UIColor {
        return UIColor(hex: "#B56CC8")
    }

    static var purple400: UIColor {
        return UIColor(hex: "#A54DBB")
    }

    static var purple500: UIColor {
        return UIColor(hex: "#9632AF")
    }

    static var purple600: UIColor {
        return UIColor(hex: "#882EA9")
    }

    static var purple700: UIColor {
        return UIColor(hex:"#7629A0")
    }

    static var purple800: UIColor {
        return UIColor(hex:"#652597")
    }

    static var brown050: UIColor {
        return UIColor(hex:"#EFEBE9")
    }

    static var brown100: UIColor {
        return UIColor(hex:"#D7CCC8")
    }

    static var brown200: UIColor {
        return UIColor(hex:"#BCAAA4")
    }

    static var brown300: UIColor {
        return UIColor(hex: "#A1887F")
    }

    static var brown400: UIColor {
        return UIColor(hex: "#8D6E63")
    }

    static var brown500: UIColor {
        return UIColor(hex: "#795548")
    }

    static var brown600: UIColor {
        return UIColor(hex: "#6D4C41")
    }

    static var brown700: UIColor {
        return UIColor(hex: "#5D4037")
    }

    static var brown800: UIColor {
        return UIColor(hex: "#4E342E")
    }
}

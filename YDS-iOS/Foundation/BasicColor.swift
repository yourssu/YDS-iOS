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
    class var logoBlue: UIColor {
        return UIColor(hex: "#1653DB")
    }

    class var logoYellow: UIColor {
        return UIColor(hex: "#FFC441")
    }

    class var white000: UIColor {
        return UIColor(hex: "#FFFFFF")
    }

    class var black000: UIColor {
        return UIColor(hex: "#111111")
    }

    class var pointBlue050: UIColor {
        return UIColor(hex: "#E1F2FE")
    }

    class var pointBlue100: UIColor {
        return UIColor(hex: "#B6DDFE")
    }

    class var pointBlue200: UIColor {
        return UIColor(hex: "#86C8FE")
    }

    class var pointBlue300: UIColor {
        return UIColor(hex: "#4EB2FE")
    }

    class var pointBlue400: UIColor {
        return UIColor(hex: "#00A3FF")
    }

    class var pointBlue500: UIColor {
        return UIColor(hex: "#0092FE")
    }

    class var pointBlue600: UIColor {
        return UIColor(hex: "#0084F0")
    }

    class var pointBlue700: UIColor {
        return UIColor(hex: "#0072DD")
    }

    class var pointBlue800: UIColor {
        return UIColor(hex: "#0060CB")
    }

    class var pointBlue900: UIColor {
        return UIColor(hex: "#0042AB")
    }

    class var warningRed050: UIColor {
        return UIColor(hex: "#FFECEF")
    }

    class var warningRed100: UIColor {
        return UIColor(hex: "#FFCED4")
    }

    class var warningRed200: UIColor {
        return UIColor(hex: "#F99C9D")
    }

    class var warningRed300: UIColor {
        return UIColor(hex: "#F37476")
    }

    class var warningRed400: UIColor {
        return UIColor(hex: "#FF5252")
    }

    class var warningRed500: UIColor {
        return UIColor(hex: "#FF3E36")
    }

    class var warningRed600: UIColor {
        return UIColor(hex: "#F73536")
    }

    class var warningRed700: UIColor {
        return UIColor(hex: "#E42930")
    }

    class var warningRed800: UIColor {
        return UIColor(hex: "#D72028")
    }

    class var warningRed900: UIColor {
        return UIColor(hex: "#C8111C")
    }

    class var gray050: UIColor {
        return UIColor(hex: "#F8F9FA")
    }

    class var gray100: UIColor {
        return UIColor(hex: "#F3F5F7")
    }

    class var gray200: UIColor {
        return UIColor(hex: "#ECEEF0")
    }

    class var gray300: UIColor {
        return UIColor(hex: "#E2E5E8")
    }

    class var gray400: UIColor {
        return UIColor(hex: "#D4D8DC")
    }

    class var gray500: UIColor {
        return UIColor(hex: "#B5B9BD")
    }

    class var gray600: UIColor {
        return UIColor(hex: "#8E9398")
    }

    class var gray700: UIColor {
        return UIColor(hex: "#505458")
    }

    class var gray800: UIColor {
        return UIColor(hex: "#3A3D40")
    }

    class var gray900: UIColor {
        return UIColor(hex: "#252729")
    }
    
    class var gray900A10: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.1)
    }
    
    class var gray900A30: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.3)
    }
    
    class var gray900A70: UIColor {
        return UIColor(hex: "#252729" ,alpha: 0.7)
    }

    class var pink050: UIColor {
        return UIColor(hex: "#FDE6F4")
    }

    class var pink100: UIColor {
        return UIColor(hex: "#FBC1E5")
    }

    class var pink200: UIColor {
        return UIColor(hex: "#FC98D3")
    }

    class var pink300: UIColor {
        return UIColor(hex: "#FF6CBF")
    }

    class var pink400: UIColor {
        return UIColor(hex: "#FF47AD")
    }

    class var pink500: UIColor {
        return UIColor(hex: "#FF1F99")
    }

    class var pink600: UIColor {
        return UIColor(hex: "#F21F93")
    }

    class var pink700: UIColor {
        return UIColor(hex: "#DA1F8B")
    }

    class var pink800: UIColor {
        return UIColor(hex: "#C31F85")
    }

    class var red050: UIColor {
        return UIColor(hex: "#FFEBEE")
    }

    class var red100: UIColor {
        return UIColor(hex: "#FFCDD2")
    }

    class var red200: UIColor {
        return UIColor(hex: "#EF9A9A")
    }

    class var red300: UIColor {
        return UIColor(hex: "#E57373")
    }

    class var red400: UIColor {
        return UIColor(hex: "#EF5350")
    }

    class var red500: UIColor {
        return UIColor(hex: "#F44236")
    }

    class var red600: UIColor {
        return UIColor(hex: "#E53835")
    }

    class var red700: UIColor {
        return UIColor(hex: "#D32E2F")
    }

    class var red800: UIColor {
        return UIColor(hex: "#C62728")
    }

    class var orange050: UIColor {
        return UIColor(hex: "#FFF1E4")
    }

    class var orange100: UIColor {
        return UIColor(hex: "#FFDBBC")
    }

    class var orange200: UIColor {
        return UIColor(hex: "#FFC492")
    }

    class var orange300: UIColor {
        return UIColor(hex: "#FFAC6C")
    }

    class var orange400: UIColor {
        return UIColor(hex: "#FD9A55")
    }

    class var orange500: UIColor {
        return UIColor(hex: "#FC8A46")
    }

    class var orange600: UIColor {
        return UIColor(hex: "#F67F44")
    }

    class var orange700: UIColor {
        return UIColor(hex: "#EE7141")
    }

    class var orange800: UIColor {
        return UIColor(hex: "#E6623E")
    }

    class var yellow050: UIColor {
        return UIColor(hex: "#FFF8DC")
    }

    class var yellow100: UIColor {
        return UIColor(hex: "#FFF0AB")
    }

    class var yellow200: UIColor {
        return UIColor(hex: "#FFE672")
    }

    class var yellow300: UIColor {
        return UIColor(hex: "#FFDC3A")
    }

    class var yellow400: UIColor {
        return UIColor(hex: "#FFD200")
    }

    class var yellow500: UIColor {
        return UIColor(hex: "#FBC000")
    }

    class var yellow600: UIColor {
        return UIColor(hex: "#F6B000")
    }

    class var yellow700: UIColor {
        return UIColor(hex: "#E1A714")
    }

    class var yellow800: UIColor {
        return UIColor(hex: "#CC9200")
    }

    class var lime050: UIColor {
        return UIColor(hex: "#F9FBE7")
    }

    class var lime100: UIColor {
        return UIColor(hex: "#F0F4C3")
    }

    class var lime200: UIColor {
        return UIColor(hex: "#E5EE9C")
    }

    class var lime300: UIColor {
        return UIColor(hex: "#DBE775")
    }

    class var lime400: UIColor {
        return UIColor(hex: "#D3E157")
    }

    class var lime500: UIColor {
        return UIColor(hex: "#CCDC39")
    }

    class var lime600: UIColor {
        return UIColor(hex: "#BFCA33")
    }

    class var lime700: UIColor {
        return UIColor(hex: "#AEB42B")
    }

    class var lime800: UIColor {
        return UIColor(hex: "#9D9D24")
    }

    class var green050: UIColor {
        return UIColor(hex: "#E5F9EE")
    }

    class var green100: UIColor {
        return UIColor(hex: "#BFF0D5")
    }

    class var green200: UIColor {
        return UIColor(hex: "#93E7BB")
    }

    class var green300: UIColor {
        return UIColor(hex: "#5BDE9F")
    }

    class var green400: UIColor {
        return UIColor(hex: "#0BD588")
    }

    class var green500: UIColor {
        return UIColor(hex: "#00CC74")
    }

    class var green600: UIColor {
        return UIColor(hex: "#00BB68")
    }

    class var green700: UIColor {
        return UIColor(hex: "#00A85B")
    }

    class var green800: UIColor {
        return UIColor(hex: "#00964F")
    }

    class var emerald050: UIColor {
        return UIColor(hex: "#E0F8F7")
    }

    class var emerald100: UIColor {
        return UIColor(hex: "#B3ECEA")
    }

    class var emerald200: UIColor {
        return UIColor(hex: "#82E0DF")
    }

    class var emerald300: UIColor {
        return UIColor(hex: "#51D2D4")
    }

    class var emerald400: UIColor {
        return UIColor(hex: "#2BC9CC")
    }

    class var emerald500: UIColor {
        return UIColor(hex: "#00BFC7")
    }

    class var emerald600: UIColor {
        return UIColor(hex: "#00AFB5")
    }

    class var emerald700: UIColor {
        return UIColor(hex: "#069A9C")
    }

    class var emerald800: UIColor {
        return UIColor(hex: "#088585")
    }

    class var aqua050: UIColor {
        return UIColor(hex: "#E0F4FD")
    }

    class var aqua100: UIColor {
        return UIColor(hex: "#B2E3FA")
    }

    class var aqua200: UIColor {
        return UIColor(hex: "#7FD0F7")
    }

    class var aqua300: UIColor {
        return UIColor(hex: "#4CBEF3")
    }

    class var aqua400: UIColor {
        return UIColor(hex: "#26B0F1")
    }

    class var aqua500: UIColor {
        return UIColor(hex: "#00A2EE")
    }

    class var aqua600: UIColor {
        return UIColor(hex: "#0095DF")
    }

    class var aqua700: UIColor {
        return UIColor(hex: "#0182CB")
    }

    class var aqua800: UIColor {
        return UIColor(hex: "#0171B7")
    }

    class var blue050: UIColor {
        return UIColor(hex: "#E4F1FA")
    }

    class var blue100: UIColor {
        return UIColor(hex: "#BEDCF3")
    }

    class var blue200: UIColor {
        return UIColor(hex: "#98C6EC")
    }

    class var blue300: UIColor {
        return UIColor(hex: "#74B0E2")
    }

    class var blue400: UIColor {
        return UIColor(hex: "#489AE7")
    }

    class var blue500: UIColor {
        return UIColor(hex: "#4B90D7")
    }

    class var blue600: UIColor {
        return UIColor(hex: "#4582CA")
    }

    class var blue700: UIColor {
        return UIColor(hex: "#3C71B8")
    }

    class var blue800: UIColor {
        return UIColor(hex: "#3661A5")
    }

    @nonobjc class var indigo050: UIColor {
        return UIColor(hex: "#E8EAF6")
    }

    class var indigo100: UIColor {
        return UIColor(hex: "#C5CAE9")
    }

    class var indigo200: UIColor {
        return UIColor(hex: "#9FA8DA")
    }

    class var indigo300: UIColor {
        return UIColor(hex: "#7986CB")
    }

    class var indigo400: UIColor {
        return UIColor(hex: "#5C6CC0")
    }

    class var indigo500: UIColor {
        return UIColor(hex: "#3F52B5")
    }

    class var indigo600: UIColor {
        return UIColor(hex: "#394AAB")
    }

    class var indigo700: UIColor {
        return UIColor(hex: "#2F409F")
    }

    class var indigo800: UIColor {
        return UIColor(hex: "#273693")
    }

    class var violet050: UIColor {
        return UIColor(hex: "#EDE7F6")
    }

    class var violet100: UIColor {
        return UIColor(hex: "#D1C4E9")
    }

    class var violet200: UIColor {
        return UIColor(hex: "#B39DDB")
    }

    class var violet300: UIColor {
        return UIColor(hex: "#9575CD")
    }

    class var violet400: UIColor {
        return UIColor(hex: "#7E57C2")
    }

    class var violet500: UIColor {
        return UIColor(hex: "#673AB7")
    }

    class var violet600: UIColor {
        return UIColor(hex: "#5E35B1")
    }

    class var violet700: UIColor {
        return UIColor(hex: "#512DA8")
    }

    class var violet800: UIColor {
        return UIColor(hex: "#4527A0")
    }

    class var purple050: UIColor {
        return UIColor(hex: "#F2E5F5")
    }

    class var purple100: UIColor {
        return UIColor(hex: "#DFBFE7")
    }

    class var purple200: UIColor {
        return UIColor(hex: "#CA95D8")
    }

    class var purple300: UIColor {
        return UIColor(hex: "#B56CC8")
    }

    class var purple400: UIColor {
        return UIColor(hex: "#A54DBB")
    }

    class var purple500: UIColor {
        return UIColor(hex: "#9632AF")
    }

    class var purple600: UIColor {
        return UIColor(hex: "#882EA9")
    }

    class var purple700: UIColor {
        return UIColor(hex:"#7629A0")
    }

    class var purple800: UIColor {
        return UIColor(hex:"#652597")
    }

    class var brown050: UIColor {
        return UIColor(hex:"#EFEBE9")
    }

    class var brown100: UIColor {
        return UIColor(hex:"#D7CCC8")
    }

    class var brown200: UIColor {
        return UIColor(hex:"#BCAAA4")
    }

    class var brown300: UIColor {
        return UIColor(hex: "#A1887F")
    }

    class var brown400: UIColor {
        return UIColor(hex: "#8D6E63")
    }

    class var brown500: UIColor {
        return UIColor(hex: "#795548")
    }

    class var brown600: UIColor {
        return UIColor(hex: "#6D4C41")
    }

    class var brown700: UIColor {
        return UIColor(hex: "#5D4037")
    }

    class var brown800: UIColor {
        return UIColor(hex: "#4E342E")
    }
}

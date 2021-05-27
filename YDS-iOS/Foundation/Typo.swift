//
//  Typo.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

fileprivate extension UIFont{
    class var font11 : UIFont { UIFont.systemFont(ofSize: 11, weight: .regular) }
    class var font12 : UIFont { UIFont.systemFont(ofSize: 12, weight: .regular) }
    class var font14 : UIFont { UIFont.systemFont(ofSize: 14, weight: .regular) }
    class var font15 : UIFont { UIFont.systemFont(ofSize: 15, weight: .regular) }
    
    class var font14semibold : UIFont { UIFont.systemFont(ofSize: 14, weight: .semibold) }
    class var font16semibold : UIFont { UIFont.systemFont(ofSize: 16, weight: .semibold) }
    class var font20semibold : UIFont { UIFont.systemFont(ofSize: 20, weight: .semibold) }
    class var font24semibold : UIFont { UIFont.systemFont(ofSize: 24, weight: .semibold) }
    
    class var font12medium : UIFont { UIFont.systemFont(ofSize: 12, weight: .medium) }
    class var font16medium : UIFont { UIFont.systemFont(ofSize: 16, weight: .medium) }
    
    class var font28bold: UIFont { UIFont.systemFont(ofSize: 28, weight: .bold) }
}


extension String{
    public enum TypoStyle{
        case title1
        case title2
        case subtitle1
        case subtitle2
        case subtitle3
        case body1
        case body2
        case button0
        case button1
        case button2
        case button3
        case button4
        case caption1
        case caption2
        
        public func style(color: UIColor? = nil) -> [NSAttributedString.Key: Any] {
            let finalFont: UIFont
            let finalLineHeight: CGFloat
            let paragraphStyle = NSMutableParagraphStyle()
            
            let lineHeight100: CGFloat = 1.0
            let lineHeight130: CGFloat = 1.3
            let lineHeight160: CGFloat = 1.6
    
            switch self {
            case .title1:
                finalFont = .font28bold
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .title2:
                finalFont = .font24semibold
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .subtitle1:
                finalFont = .font20semibold
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .subtitle2:
                finalFont = .font16semibold
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .subtitle3:
                finalFont = .font14semibold
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .body1:
                finalFont = .font15
                finalLineHeight = finalFont.pointSize * lineHeight160
            case .body2:
                finalFont = .font14
                finalLineHeight = finalFont.pointSize * lineHeight160
            case .button0:
                finalFont = .font16medium
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button1:
                finalFont = .font16semibold
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button2:
                finalFont = .font14semibold
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button3:
                finalFont = .font14
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button4:
                finalFont = .font12medium
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .caption1:
                finalFont = .font12
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .caption2:
                finalFont = .font11
                finalLineHeight = finalFont.pointSize * lineHeight130
            }
        
            paragraphStyle.lineSpacing = finalLineHeight - finalFont.lineHeight
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color ?? UIColor.black,
                .font: finalFont,
                .paragraphStyle: paragraphStyle
            ]
            return attributes
        }
        
    }
    
    public func attributedString(byPreset preset: TypoStyle, color: UIColor? = nil) -> NSAttributedString {
        return NSAttributedString.init(string : self, attributes: preset.style(color: color))
    }

}

//
//  YDSTypoStyle.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/18.
//

import UIKit

extension String {
    public enum TypoStyle {
        case title1
        case title2
        case title3
        
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
        
        internal func style(color: UIColor? = nil) -> [NSAttributedString.Key: Any] {
            let finalFont: UIFont
            let finalLineHeight: CGFloat
            let paragraphStyle = NSMutableParagraphStyle()
            
            let lineHeight100: CGFloat = 1.0
            let lineHeight130: CGFloat = 1.3
            let lineHeight160: CGFloat = 1.6
    
            switch self {
            case .title1:
                finalFont = YDSFont.title1
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .title2:
                finalFont = YDSFont.title2
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .title3:
                finalFont = YDSFont.title3
                finalLineHeight = finalFont.pointSize * lineHeight130
                
            case .subtitle1:
                finalFont = YDSFont.subtitle1
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .subtitle2:
                finalFont = YDSFont.subtitle2
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .subtitle3:
                finalFont = YDSFont.subtitle3
                finalLineHeight = finalFont.pointSize * lineHeight130
                
            case .body1:
                finalFont = YDSFont.body1
                finalLineHeight = finalFont.pointSize * lineHeight160
            case .body2:
                finalFont = YDSFont.body2
                finalLineHeight = finalFont.pointSize * lineHeight160
                
            case .button0:
                finalFont = YDSFont.button0
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button1:
                finalFont = YDSFont.button1
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button2:
                finalFont = YDSFont.button2
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button3:
                finalFont = YDSFont.button3
                finalLineHeight = finalFont.pointSize * lineHeight100
            case .button4:
                finalFont = YDSFont.button4
                finalLineHeight = finalFont.pointSize * lineHeight100
                
            case .caption1:
                finalFont = YDSFont.caption1
                finalLineHeight = finalFont.pointSize * lineHeight130
            case .caption2:
                finalFont = YDSFont.caption2
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
    
    internal func attributedString(byPreset preset: TypoStyle, color: UIColor? = nil) -> NSAttributedString {
        return NSAttributedString.init(string : self, attributes: preset.style(color: color))
    }

}

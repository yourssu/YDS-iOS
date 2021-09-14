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
        
        public var font: UIFont {
            switch self {
            case .title1:
                return YDSFont.title1
            case .title2:
                return YDSFont.title2
            case .title3:
                return YDSFont.title3
            
            
            case .subtitle1:
                return YDSFont.subtitle1
            case .subtitle2:
                return YDSFont.subtitle2
            case .subtitle3:
                return YDSFont.subtitle3
                
            case .body1:
                return YDSFont.body1
            case .body2:
                return YDSFont.body2
                
            case .button0:
                return YDSFont.button0
            case .button1:
                return YDSFont.button1
            case .button2:
                return YDSFont.button2
            case .button3:
                return YDSFont.button3
            case .button4:
                return YDSFont.button4
                
            case .caption1:
                return YDSFont.caption1
            case .caption2:
                return YDSFont.caption2
            }
        }
        
        public var lineHeight: CGFloat {
            switch self {
            case .title1, .title2, .title3:
                return 1.3
                
            case .subtitle1, .subtitle2, .subtitle3:
                return 1.3
                
            case .body1, .body2:
                return 1.6
                
            case .button0, .button1, .button2, .button3, .button4:
                return 1.0
                
            case .caption1, .caption2:
                return 1.3
            }
        }
        
        internal func style(color: UIColor? = nil) -> [NSAttributedString.Key: Any] {
            let paragraphStyle = NSMutableParagraphStyle()
            
            paragraphStyle.lineSpacing = self.lineHeight - self.font.lineHeight
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color ?? UIColor.black,
                .font: self.font,
                .paragraphStyle: paragraphStyle
            ]
            return attributes
        }
        
    }
    
    internal func attributedString(byPreset preset: TypoStyle, color: UIColor? = nil) -> NSAttributedString {
        return NSAttributedString.init(string : self, attributes: preset.style(color: color))
    }

}

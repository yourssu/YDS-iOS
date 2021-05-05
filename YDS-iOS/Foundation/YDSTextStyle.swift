//
//  String.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

extension String{
    public enum YDSTextStyle{
        case title1
        case title2
        case subtitle1
        case subtitle2
        case subtitle3
        case body1
        case body2
        case button1
        case button2
        case rectButton1
        case rectButton2
        case caption1
        case caption2
    }
    
    private func attributedString(font: UIFont, color: UIColor, customLineHeight: CGFloat) -> NSAttributedString {

        let finalLineHeight: CGFloat = customLineHeight
        let finalColor: UIColor = color
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = finalLineHeight - font.lineHeight

        
        let attributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: finalColor,
          .font: font,
          .paragraphStyle: paragraphStyle
        ]
        
        return NSAttributedString.init(string : self, attributes: attributes)
      }
    
    public func attributedString(byPreset preset: YDSTextStyle, color: UIColor? = nil) -> NSAttributedString {
        
        let finalFont: UIFont
        let finalLineHeight: CGFloat
        
        switch preset {
        case .title1:
            finalFont = .font28bold
            finalLineHeight = finalFont.pointSize * 1.3
        case .title2:
            finalFont = .font24semibold
            finalLineHeight = finalFont.pointSize * 1.3
        case .subtitle1:
            finalFont = .font20semibold
            finalLineHeight = finalFont.pointSize * 1.3
        case .subtitle2:
            finalFont = .font16semibold
            finalLineHeight = finalFont.pointSize * 1.3
        case .subtitle3:
            finalFont = .font14semibold
            finalLineHeight = finalFont.pointSize * 1.3
        case .body1:
            finalFont = .font15
            finalLineHeight = finalFont.pointSize * 1.75
        case .body2:
            finalFont = .font14
            finalLineHeight = finalFont.pointSize * 1.6
        case .button1:
            finalFont = .font16medium
            finalLineHeight = finalFont.pointSize * 1.3
        case .button2:
            finalFont = .font14
            finalLineHeight = finalFont.pointSize * 1.3
        case .rectButton1:
            finalFont = .font16semibold
            finalLineHeight = finalFont.pointSize * 1.3
        case .rectButton2:
            finalFont = .font14semibold
            finalLineHeight = finalFont.pointSize * 1.3
        case .caption1:
            finalFont = .font12
            finalLineHeight = finalFont.pointSize * 1.3
        case .caption2:
            finalFont = .font11
            finalLineHeight = finalFont.pointSize * 1.3
        }
        
        let finalColor: UIColor = color ?? UIColor.black
        
        return self.attributedString(font: finalFont, color: finalColor, customLineHeight: finalLineHeight)
      }
}

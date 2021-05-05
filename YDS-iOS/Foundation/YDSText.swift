//
//  YDSText.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

public class YDSText{
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
    
    private func attributedString(text: String, font: UIFont, color: UIColor, customLineHeight: CGFloat) -> NSAttributedString {

        let finalLineHeight: CGFloat = customLineHeight
        let finalColor: UIColor = color
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = finalLineHeight - font.lineHeight

        
        let attributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: finalColor,
          .font: font,
          .paragraphStyle: paragraphStyle
        ]
        
        return NSAttributedString.init(string: text, attributes: attributes)
      }
    
    public func attributedString(text: String, byPreset preset: YDSTextStyle, color: UIColor? = nil) -> NSAttributedString {
        
        let finalFont: UIFont
        let finalLineHeight: CGFloat
        
        switch preset {
        case .title1:
            finalFont = .systemFont(ofSize: 28, weight: .bold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .title2:
            finalFont = .systemFont(ofSize: 24, weight: .semibold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .subtitle1:
            finalFont = .systemFont(ofSize: 20, weight: .semibold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .subtitle2:
            finalFont = .systemFont(ofSize: 16, weight: .semibold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .subtitle3:
            finalFont = .systemFont(ofSize: 14, weight: .semibold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .body1:
            finalFont = .systemFont(ofSize: 15, weight: .regular)
            finalLineHeight = finalFont.pointSize * 1.75
        case .body2:
            finalFont = .systemFont(ofSize: 14, weight: .regular)
            finalLineHeight = finalFont.pointSize * 1.6
        case .button1:
            finalFont = .systemFont(ofSize: 16, weight: .medium)
            finalLineHeight = finalFont.pointSize * 1.3
        case .button2:
            finalFont = .systemFont(ofSize: 14, weight: .regular)
            finalLineHeight = finalFont.pointSize * 1.3
        case .rectButton1:
            finalFont = .systemFont(ofSize: 16, weight: .semibold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .rectButton2:
            finalFont = .systemFont(ofSize: 14, weight: .semibold)
            finalLineHeight = finalFont.pointSize * 1.3
        case .caption1:
            finalFont = .systemFont(ofSize: 12, weight: .regular)
            finalLineHeight = finalFont.pointSize * 1.3
        case .caption2:
            finalFont = .systemFont(ofSize: 11, weight: .regular)
            finalLineHeight = finalFont.pointSize * 1.3
        }
        
        let finalColor: UIColor = color ?? UIColor.black
        
        return self.attributedString(text: text, font: finalFont, color: finalColor, customLineHeight: finalLineHeight)
      }
    
}

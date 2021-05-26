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
    
    public func attributedString(byPreset preset: TypoStyle, color: UIColor? = nil) -> NSAttributedString {
        
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
            finalLineHeight = finalFont.pointSize * 1.6
        case .body2:
            finalFont = .font14
            finalLineHeight = finalFont.pointSize * 1.6
        case .button0:
            finalFont = .font16medium
            finalLineHeight = finalFont.pointSize * 1.0
        case .button1:
            finalFont = .font16semibold
            finalLineHeight = finalFont.pointSize * 1.0
        case .button2:
            finalFont = .font14semibold
            finalLineHeight = finalFont.pointSize * 1.0
        case .button3:
            finalFont = .font14
            finalLineHeight = finalFont.pointSize * 1.0
        case .button4:
            finalFont = .font12medium
            finalLineHeight = finalFont.pointSize * 1.0
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

//
//  YDSTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/26.
//

import UIKit

internal struct YDSTextField {
    internal enum Dimension {
        
        ///  필드 좌측 마진값입니다.
        static let leftMargin: CGFloat = 16
        
        ///  필드 우측 마진값입니다.
        static let rightMargin: CGFloat = 16
        
        ///  필드 높이입니다.
        static let textFieldHeight: CGFloat = 48
        
        ///  필드 내 요소 사이 간격입니다.
        static let subviewSpacing: CGFloat = 4
        
        ///  아무 설정을 하지 않았을 때 기본으로 주어지는 clearButton의 우측 마진 값입니다.
        static let clearButtonDefaultRightMargin: CGFloat = 6
    }
}

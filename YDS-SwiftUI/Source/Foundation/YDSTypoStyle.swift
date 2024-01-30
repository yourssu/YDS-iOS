//
//  YDSTypoStyle.swift
//  YDS-iOS
//
//  Created by 정종인 on 2023/07/27.
//

import SwiftUI

extension String {
    public enum SwiftUITypoStyle {
        case display1
        case display2

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

        case caption0
        case caption1
        case caption2

        public var font: Font {
            switch self {
            case .display1:
                return YDSFont.display1
            case .display2:
                return YDSFont.display2

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

            case .caption0:
                return YDSFont.caption0
            case .caption1:
                return YDSFont.caption1
            case .caption2:
                return YDSFont.caption2
            }
        }

        public var lineHeight: CGFloat {
            switch self {
            case .display1, .display2:
                return 1.3

            case .title1, .title2, .title3:
                return 1.3

            case .subtitle1, .subtitle2, .subtitle3:
                return 1.3

            case .body1, .body2:
                return 1.5

            case .button0, .button1, .button4:
                return 1.4

            case .button2, .button3:
                return 1.3

            case .caption0, .caption1, .caption2:
                return 1.3
            }
        }

        public static var allCases: [SwiftUITypoStyle] = [.display1, .display2,
                                                          .title1, .title2, .title3,
                                                          .subtitle1, .subtitle2, .subtitle3,
                                                          .body1, .body2,
                                                          .button0, .button1, .button2, .button3, .button4,
                                                          .caption0, .caption1, .caption2]
    }
}

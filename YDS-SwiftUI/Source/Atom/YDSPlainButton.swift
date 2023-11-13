//
//  YDSPlainButton.swift
//  YDS-SwiftUI
//
//  Created by 이조은 on 2023/11/13.
//

import SwiftUI
import YDS_Essential

public struct YDSPlainButton: View {
    let text: String?
    let leftIcon: Image?
    let rightIcon: Image?
    let size: PlainButtonSize
    let isDisabled: Bool
    let isWarned: Bool
    let isPointed: Bool

    fileprivate func pointColor() -> Color? {
        if isDisabled {
            return YDSColor.buttonDisabled
        } else if isWarned {
            return YDSColor.buttonWarned
        } else if isPointed {
            return YDSColor.buttonPoint
        } else {
            return YDSColor.buttonNormal
        }
    }

    public enum PlainButtonSize {
        case large
        case medium
        case small

        fileprivate var height: CGFloat {
            switch self {
            case .large:
                return 48
            case .medium:
                return 40
            case .small:
                return 32
            }
        }

        fileprivate var padding: CGFloat {
            switch self {
            case .large:
                return 16
            case .medium:
                return 12
            case .small:
                return 12
            }
        }

        fileprivate var font: Font {
            switch self {
            case .large:
                return YDSFont.button2
            case .medium:
                return YDSFont.button2
            case .small:
                return YDSFont.button4
            }
        }

        fileprivate var iconSize: CGFloat {
            switch self {
            case .large:
                return 24
            case .medium:
                return 24
            case .small:
                return 16
            }
        }
    }

    public enum BoxButtonRounding: CGFloat {
        case r8 = 8
        case r4 = 4
    }

    public init(text: String? = nil,
                leftIcon: Image? = nil,
                rightIcon: Image? = nil,
                size: PlainButtonSize = .small,
                isDisabled: Bool = false,
                isWarned: Bool = false,
                isPointed: Bool = false
    ) {
        self.text = text
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.size = size
        self.isDisabled = isDisabled
        self.isWarned = isWarned
        self.isPointed = isPointed
    }

    public var body: some View {
        Button {

        } label: {
            HStack(spacing: 4) {
                if let leftIcon {
                    leftIcon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(pointColor())
                }
                if let text {
                    Text(text)
                        .font(size.font)
                }
                if let rightIcon {
                    rightIcon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(pointColor())
                }
            }
            .padding(.vertical, size.padding)
            .padding(.horizontal, size.padding)
            .frame(height: size.height)
            .foregroundColor(pointColor())
        }.disabled(isDisabled)
    }
}

struct YDSPlainButton_Previews: PreviewProvider {
    static var previews: some View {
        YDSPlainButton()
    }
}

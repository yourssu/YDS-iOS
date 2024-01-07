//
//  YDSBoxButton.swift
//  YDS-SwiftUI
//
//  Created by 이조은 on 2023/10/30.
//
//  swiftlint:disable identifier_name

import SwiftUI
import YDS_Essential

public struct YDSBoxButton: View {
    let text: String?
    let leftIcon: Image?
    let rightIcon: Image?
    let type: BoxButtonType
    let size: BoxButtonSize
    let rounding: BoxButtonRounding
    let isDisabled: Bool
    let isWarned: Bool

    public enum BoxButtonType {
        case filled
        case tinted
        case line
    }

    fileprivate func backgroundColor(for type: BoxButtonType) -> Color? {
        switch type {
        case .filled:
            if isDisabled {
                return YDSColor.buttonDisabledBG
            } else if isWarned {
                return YDSColor.buttonWarned
            } else {
                return YDSColor.buttonPoint
            }
        case .tinted:
            if isDisabled {
                return YDSColor.buttonDisabledBG
            } else if isWarned {
                return YDSColor.buttonWarnedBG
            } else {
                return YDSColor.buttonPointBG
            }
        case .line:
            return nil
        }
    }

    fileprivate func pointColor(for type: BoxButtonType) -> Color? {
        switch type {
        case .filled:
            if isDisabled {
                return YDSColor.buttonDisabled
            } else {
                return YDSColor.bgNormal
            }
        case .tinted, .line:
            if isDisabled {
                return YDSColor.buttonDisabled
            } else if isWarned {
                return YDSColor.buttonWarned
            } else {
                return YDSColor.buttonPoint
            }
        }
    }

    fileprivate func borderColor(for type: BoxButtonType) -> Color? {
        switch type {
        case .filled, .tinted:
            return nil
        case .line:
            if isDisabled {
                return YDSColor.buttonDisabled
            } else if isWarned {
                return YDSColor.buttonWarned
            } else {
                return YDSColor.buttonPoint
            }
        }
    }

    public enum BoxButtonSize {
        case extraLarge
        case large
        case medium
        case small

        fileprivate var height: CGFloat {
            switch self {
            case .extraLarge:
                return 56
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
            case .extraLarge:
                return 16
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
            case .extraLarge:
                return YDSFont.button1
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
            case .extraLarge:
                return 24
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
                type: BoxButtonType = .filled,
                size: BoxButtonSize = .small,
                rounding: BoxButtonRounding = .r4,
                isDisabled: Bool = false,
                isWarned: Bool = false
    ) {
        self.text = text
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.type = type
        self.size = size
        self.rounding = rounding
        self.isDisabled = isDisabled
        self.isWarned = isWarned
    }

    public var body: some View {
        HStack(spacing: 4) {
            if let leftIcon {
                leftIcon
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundColor(pointColor(for: type))
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
                    .foregroundColor(pointColor(for: type))
            }
        }
        .padding(.vertical, size.padding)
        .padding(.horizontal, size.padding)
        .frame(height: size.height)
        .foregroundColor(pointColor(for: type))
        .background(backgroundColor(for: type))
        .disabled(isDisabled)
        .cornerRadius(rounding.rawValue)
        .overlay(
            RoundedRectangle(cornerRadius: rounding.rawValue)
                .stroke(borderColor(for: type) ?? Color.clear)
        )
    }
}

struct YDSBoxButton_Previews: PreviewProvider {
    static var previews: some View {
        YDSBoxButton()
    }
}

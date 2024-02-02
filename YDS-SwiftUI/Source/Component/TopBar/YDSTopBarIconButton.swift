//
//  YDSTopBarButton.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/28/23.
//

import SwiftUI
import YDS_Essential

public struct YDSTopBarButton: View {
    let text: String?
    let leftIcon: Image?
    let rightIcon: Image?
    let size: PlainButtonSize
    let isDisabled: Bool
    
    fileprivate func pointColor() -> Color? {
        if isDisabled {
            return YDSColor.buttonDisabled
        } else {
            return YDSColor.buttonNormal
        }
    }
    
    public enum PlainButtonSize {
        case large

        fileprivate var height: CGFloat {
            switch self {
            case .large:
                return 48
            }
        }

        fileprivate var padding: CGFloat {
            switch self {
            case .large:
                return 8
            }
        }

        fileprivate var font: Font {
            switch self {
            case .large:
                return YDSFont.button0
            }
        }

        fileprivate var iconSize: CGFloat {
            switch self {
            case .large:
                return 24
            }
        }
    }
    
    public enum BoxButtonRounding: CGFloat {
        case r8 = 8
        case r4 = 4
    }
    
    public init(
        text: String? = nil,
        leftIcon: Image? = nil,
        rightIcon: Image? = nil,
        size: PlainButtonSize = .large,
        isDisabled: Bool = false
    ) {
        self.text = text
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.size = size
        self.isDisabled = isDisabled
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
            .padding(.horizontal, size.padding)
            .frame(height: size.height)
            .foregroundColor(pointColor())
        }.disabled(isDisabled)
    }
}

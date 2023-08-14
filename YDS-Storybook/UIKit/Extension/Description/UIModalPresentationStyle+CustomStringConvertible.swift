//
//  UIModalPresentationStyle+CustomStringConvertible.swift
//  YDS-Storybook
//
//  Created by 강민석 on 2022/08/18.
//

import UIKit

extension UIModalPresentationStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fullScreen:
            return "fullScreen"
        case .pageSheet:
            return "pageSheet"
        case .formSheet:
            return "formSheet"
        case .currentContext:
            return "currentContext"
        case .custom:
            return "custom"
        case .overFullScreen:
            return "overFullScreen"
        case .overCurrentContext:
            return "overCurrentContext"
        case .popover:
            return "popover"
        case .none:
            return "none"
        case .automatic:
            return "automatic"
        @unknown default:
            return "unknown"
        }
    }
}

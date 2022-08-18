//
//  NSLineBreakMode+CustomStringConvertible.swift
//  YDS-Storybook
//
//  Created by 강민석 on 2022/08/18.
//

import UIKit

extension NSLineBreakMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .byWordWrapping:
            return "byWordWrapping"
        case .byCharWrapping:
            return "byCharWrapping"
        case .byClipping:
            return "byClipping"
        case .byTruncatingHead:
            return "byTruncatingHead"
        case .byTruncatingTail:
            return "byTruncatingTail"
        case .byTruncatingMiddle:
            return "byTruncatingMiddle"
        @unknown default:
            return "unknown"
        }
    }
}

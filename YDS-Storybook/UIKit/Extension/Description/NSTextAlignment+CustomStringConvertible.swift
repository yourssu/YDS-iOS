//
//  NSTextAlignment+CustomStringConvertible.swift
//  YDS-Storybook
//
//  Created by 이조은 on 2022/10/14.
//

import UIKit

extension NSTextAlignment: CustomStringConvertible {
    public var description: String {
        switch self {
        case .left:
            return "left"
        case .center:
            return "center"
        case .right:
            return "right"
        case .justified:
            return "justified"
        case .natural:
            return "natural"
        @unknown default:
            return "unknown"
        }
    }
}

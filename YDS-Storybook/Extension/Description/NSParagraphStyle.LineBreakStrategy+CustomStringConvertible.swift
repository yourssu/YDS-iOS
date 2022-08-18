//
//  NSParagraphStyle.LineBreakStrategy+CustomStringConvertible.swift
//  YDS-Storybook
//
//  Created by 강민석 on 2022/08/18.
//

import UIKit

extension NSParagraphStyle.LineBreakStrategy: CustomStringConvertible {
    public var description: String {
        if #available(iOS 14.0, *) {
            switch self {
            case .pushOut:
                return "pushOut"
            case .hangulWordPriority:
                return "hangulWordPriority"
            case .standard:
                return "standard"
            case []:
                return "none"
            default:
                return "unknown"
            }
        } else {
            switch self {
            case .pushOut:
                return "pushOut"
            case []:
                return "none"
            default:
                return "unknown"
            }
        }
    }
}

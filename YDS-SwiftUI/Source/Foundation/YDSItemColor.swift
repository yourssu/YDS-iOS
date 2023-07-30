//
//  YDSItemColor.swift
//  YDS-iOS
//
//  Created by 정종인 on 2023/07/27.
//

import SwiftUI

public enum YDSItemColor: String {
    case mono = "Mono"
    case green = "Green"
    case emerald = "Emerald"
    case aqua = "Aqua"
    case blue = "Blue"
    case indigo = "Indigo"
    case violet = "Violet"
    case purple = "Purple"
    case pink = "Pink"

    public var primaryColor: Color {
        switch self {
        case .mono:
            return YDSColor.monoItemPrimary
        case .green:
            return YDSColor.greenItemPrimary
        case .emerald:
            return YDSColor.emeraldItemPrimary
        case .aqua:
            return YDSColor.aquaItemPrimary
        case .blue:
            return YDSColor.blueItemPrimary
        case .indigo:
            return YDSColor.indigoItemPrimary
        case .violet:
            return YDSColor.violetItemPrimary
        case .purple:
            return YDSColor.purpleItemPrimary
        case .pink:
            return YDSColor.pinkItemPrimary
        }
    }

    public var backgroundColor: Color {
        switch self {
        case .mono:
            return YDSColor.monoItemBG
        case .green:
            return YDSColor.greenItemBG
        case .emerald:
            return YDSColor.emeraldItemBG
        case .aqua:
            return YDSColor.aquaItemBG
        case .blue:
            return YDSColor.blueItemBG
        case .indigo:
            return YDSColor.indigoItemBG
        case .violet:
            return YDSColor.violetItemBG
        case .purple:
            return YDSColor.purpleItemBG
        case .pink:
            return YDSColor.pinkItemBG
        }
    }

    public var textColor: Color {
        switch self {
        case .mono:
            return YDSColor.monoItemText
        case .green:
            return YDSColor.greenItemText
        case .emerald:
            return YDSColor.emeraldItemText
        case .aqua:
            return YDSColor.aquaItemText
        case .blue:
            return YDSColor.blueItemText
        case .indigo:
            return YDSColor.indigoItemText
        case .violet:
            return YDSColor.violetItemText
        case .purple:
            return YDSColor.purpleItemText
        case .pink:
            return YDSColor.pinkItemText
        }
    }
}

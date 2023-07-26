//
//  YDSConstant.swift
//  YDS-SwiftUI
//
//  Created by 정종인 on 2023/07/27.
//

// swiftlint:disable identifier_name

import SwiftUI

public enum YDSConstant {
    public enum Border {
        public static let thin: CGFloat = 1/UIScreen.main.scale
        public static let normal: CGFloat = 1
        public static let thick: CGFloat = 8
    }

    public enum Rounding {
        public static let r2: CGFloat = 2
        public static let r4: CGFloat = 4
        public static let r8: CGFloat = 8
    }
}

// swiftlint:enable identifier_name

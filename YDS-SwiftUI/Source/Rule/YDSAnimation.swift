//
//  YDSAnimation.swift
//  YDS-SwiftUI
//
//  Created by 정종인 on 2023/07/27.
//

import SwiftUI

public enum YDSAnimation {
    public enum Duration {
        public static let short = 0.01
        public static let medium = 0.25
    }

    public enum Options {
        public static var curveEaseInOut: UIView.AnimationOptions {
            return UIView.AnimationOptions.curveEaseInOut
        }
    }
}

//
//  Animation.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/06/15.
//

import UIKit

internal enum Animation{
    internal enum Duration{
        internal static let short = 0.01
        internal static let medium = 0.25
    }
    
    internal enum Options{
        internal static let curveEaseInOut = UIView.AnimationOptions.curveEaseInOut
    }
}

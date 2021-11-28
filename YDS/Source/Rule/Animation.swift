//
//  Animation.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/06/15.
//

import UIKit

public extension YDS {
    enum Animation { }
}

public extension YDS.Animation {
    enum Duration {
        static let short = 0.01
        static let medium = 0.25
    }
    
    enum Options {
        static let curveEaseInOut = UIView.AnimationOptions.curveEaseInOut
    }
}

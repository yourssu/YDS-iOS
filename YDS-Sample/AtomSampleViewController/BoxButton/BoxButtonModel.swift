//
//  BoxButtonModel.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS

struct BoxButtonModel {
    var text: String?
    var leftIcon: UIImage?
    var rightIcon: UIImage?
    var type: YDSBoxButton.BoxButtonType
    var size: YDSBoxButton.BoxButtonSize
    var rounding: YDSBoxButton.BoxButtonRounding
    var isDisabled: Bool
    var isWarned: Bool
}

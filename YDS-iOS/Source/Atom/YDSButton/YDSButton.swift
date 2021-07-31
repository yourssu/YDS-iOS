//
//  YDSButton.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/31.
//

import UIKit

public protocol YDSButton {
    var isDisabled: Bool { get set }
    var isWarned: Bool { get set }
    var text: String? { get set }
    var leftIcon: UIImage? { get set }
    var rightIcon: UIImage? { get set }
}

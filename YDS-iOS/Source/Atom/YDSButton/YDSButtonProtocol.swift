//
//  YDSButtonProtocol.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/31.
//

//
//  YDSBoxButton과 YDSPlainButton이 준수하는 protocol입니다.
//

import UIKit

public protocol YDSButtonProtocol {
    var isDisabled: Bool { get set }
    var isWarned: Bool { get set }
    var text: String? { get set }
    var leftIcon: UIImage? { get set }
    var rightIcon: UIImage? { get set }
}

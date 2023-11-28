//
//  YDSTextFieldBase.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/10/29.
//

import SwiftUI

protocol YDSTextFieldProtocol {
    var placeholder: String? { get }
    var helperText: String? { get }
    var fieldText: String? { get }
    var text: String { get }
    /// 우선순위는 isDisabled > isNegative > isPositive
    var isDisabled: Bool { get }
    var isNegative: Bool { get }
    var isPositive: Bool { get }
}

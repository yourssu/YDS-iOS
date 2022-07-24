//
//  Optional+isEmpty.swift
//  YDS
//
//  Created by 강민석 on 2022/03/13.
//

extension Optional where Wrapped == NSAttributedString {
    var isEmpty: Bool {
        switch self {
        case .none:
            return true
        case .some(let wrapped):
            return wrapped.isEmpty
        }
    }
}

extension NSAttributedString {
    var isEmpty: Bool {
        return length == 0
    }
}

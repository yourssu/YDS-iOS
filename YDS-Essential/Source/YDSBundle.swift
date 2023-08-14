//
//  YDSBundle.swift
//  YDS-Essential
//
//  Created by 정종인 on 2023/07/30.
//

import Foundation

public class YDSBundle {
    public static let bundle = Bundle(for: YDSBundle.self)
}
#if SWIFT_PACKAGE
public extension Bundle {
    static var ydsEssential: Bundle {
        return .module
    }
}
#else
public extension Bundle {
    static var ydsEssential: Bundle {
        return Bundle(for: YDSBundle.self)
    }
}
#endif

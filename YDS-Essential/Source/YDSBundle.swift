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
public extension Bundle {
#if SWIFT_PACKAGE
    static var ydsEssential: Bundle {
        return .module
    }
#else
    static var ydsEssential: Bundle {
        return Bundle(for: YDSBundle.self)
    }
#endif
}

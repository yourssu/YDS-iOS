//
//  UIApplication+findWindow.swift
//  YDS
//
//  Created by 강민석 on 2022/04/02.
//

import UIKit

extension UIApplication {
    class func findWindow() -> UIWindow? {
        return shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
     }
}

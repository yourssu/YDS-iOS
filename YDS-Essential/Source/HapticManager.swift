//
//  HapticManager.swift
//  YDS
//
//  Created by 정종인 on 12/25/23.
//

import UIKit

public class HapticManager {
    public static let instance = HapticManager()
    private init() {}

    public func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    public func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

/*
 Haptic Manager 사용 방법
 HapticManager.instance.notification(type: .success)
 HapticManager.instance.impact(style: .soft)
 */

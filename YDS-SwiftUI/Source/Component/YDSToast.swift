//
//  YDSToast.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/09/18.
//

import SwiftUI
import UIKit
import YDS_Essential
import Combine
/*
 YDSToast 사용 방법
 1. 최상단 뷰에 .registerYDSToast() Modifier를 붙여준다.
 2. toast를 띄우고 싶을 때 YDSToast()를 불러준다.
 */

public struct YDSToastModel: Equatable {
    let text: String
    let duration: ToastDuration
    let haptic: HapticType
    public enum ToastDuration: CaseIterable {
        case short
        case long

        fileprivate var value: Double {
            switch self {
            case .short:
                return 1.5
            case .long:
                return 3
            }
        }
    }
    public enum HapticType: CaseIterable {
        case success
        case failed
        case none
    }
    var playHaptic: () -> Void {
        switch haptic {
        case .success: {
                HapticManager.instance.notification(type: .success)
            }
        case .failed: {
                HapticManager.instance.notification(type: .warning)
            }
        case .none: {}
        }
    }
}

public func YDSToast(
    _ text: String,
    duration: YDSToastModel.ToastDuration = .short,
    haptic: YDSToastModel.HapticType = .none
) {
    YDSToastHelper.shared.enqueueToast(YDSToastModel(text: text, duration: duration, haptic: haptic))
}

public struct YDSToastView: View {
    let text: String
    public init(_ text: String) {
        self.text = text
    }
    public var body: some View {
        YDSColor.toastBG
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(maxWidth: .infinity, maxHeight: 66)
            .overlay(
                Text(text)
                    .foregroundColor(YDSColor.textBright)
            )
            .padding()
    }
}

private class YDSToastHelper: ObservableObject {
    static let shared = YDSToastHelper()
    @Published var isShowing: Bool = false
    @Published var showingToast: YDSToastModel?
    private let subject = PassthroughSubject<YDSToastModel, Never>()
    private var cancellables = Set<AnyCancellable>()
    init() {
        initSubscription()
    }
    private func initSubscription() {
        subject
            .receive(on: RunLoop.main)
            .sink { [weak self] toast in
                self?.isShowing = false
                self?.isShowing = true
                self?.showingToast = toast
                toast.playHaptic()
                DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration.value) {
                    self?.isShowing = false
                    self?.showingToast = nil
                }
            }
            .store(in: &cancellables)
    }
    func enqueueToast(_ toast: YDSToastModel) {
        subject.send(toast)
    }
}

struct YDSToastModifier: ViewModifier {
    @StateObject private var toastHelper = YDSToastHelper.shared
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if toastHelper.isShowing, let toast = toastHelper.showingToast {
                    YDSToastView(toast.text)
                        .opacity(toastHelper.isShowing ? 1.0 : 0.0)
                }
            }
            .animation(.easeInOut, value: toastHelper.isShowing)
    }
}

extension View {
    public func registerYDSToast() -> some View {
        self.modifier(
            YDSToastModifier()
        )
    }
}

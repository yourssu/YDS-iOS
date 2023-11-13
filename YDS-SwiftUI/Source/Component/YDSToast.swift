//
//  YDSToast.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/09/18.
//

import SwiftUI
import UIKit
import YDS_Essential

public struct YDSToast: Equatable {
    let text: String
    let duration: ToastDuration
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

public struct YDSToastModifier: ViewModifier {
    @Binding public var isShowing: Bool
    @Binding public var toast: YDSToast
    public func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if isShowing {
                    YDSToastView(toast.text)
                        .opacity(isShowing ? 1.0 : 0.0)
                }
            }
            .onChange(of: isShowing) { value in
                if value {
                    DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration.value) {
                        isShowing = false
                    }
                }
            }
            .animation(.easeInOut, value: isShowing)
    }
}

extension View {
    public func ydsToast(
        _ text: Binding<String?>,
        duration: YDSToast.ToastDuration = .short,
        isShowing: Binding<Bool>
    ) -> some View {
        self.modifier(
            YDSToastModifier(
                isShowing: isShowing,
                toast: .init(get: {
                    YDSToast(text: text.wrappedValue ?? "", duration: duration)
                }, set: { ydsToast in
                    text.wrappedValue = ydsToast.text
                })
            )
        )
    }
}

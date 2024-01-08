//
//  YDSSingleTitleTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/21/23.
//

import SwiftUI

struct YDSSingleTitleTopBarModifier: ViewModifier {
    @Binding public var topBar: YDSSingleTitleTopBar
    @Binding public var isShowing: Bool

    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement:
                        .topBarLeading) {
                            SingleTitleBar(topBar.title)
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            Button(action: {
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.searchLine
                            })
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            Button(action: {
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.penLine
                            })
                }
            }
    }
}

public struct YDSSingleTitleTopBar: Equatable {
    let title: String
}

struct SingleTitleBar: View {
    let title: String

    public init(_ title: String) {
        self.title = title
    }

    public var body: some View {
        Text(title)
            .font(YDSFont.title2)
    }
}

extension View {
    public func ydsSingleTitleTopBar(_ title: Binding<String?>, isShowing: Binding<Bool>) -> some View {
      modifier(
        YDSSingleTitleTopBarModifier( topBar: .init(get: {
            YDSSingleTitleTopBar(
                title: title.wrappedValue ?? "")
        }, set: { ydsTopBar in
            title.wrappedValue = ydsTopBar.title
        }), isShowing: isShowing
        )
      )
  }
}

//
//  YDSDoubleTitleTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/21/23.
//

import SwiftUI

struct YDSDoubleTitleTopBar: ViewModifier {
    @Binding public var topBar: DoubleTitleTopBar
    
    public func body(content: Content) -> some View {
        return content
            .toolbar {
                ToolbarItem(placement:
                        .topBarLeading) {
                            DoubleTitleBar(title: topBar.title, subtitle: topBar.subtitle)
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            IconBarView(icon: YDSIcon.plusLine)
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            IconBarView(icon: YDSIcon.listLine)
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            IconBarView(icon: YDSIcon.dotsHorizontalLine)
                }
            }
    }
}

public struct DoubleTitleTopBar: Equatable {
    let title: String
    let subtitle: String
}

struct DoubleTitleBar: View {
    public var title: String = "시간표(2안)"
    public var subtitle: String = "2021년 2학기"
    
    public var body : some View {
        VStack(alignment: .leading) {
            Text(subtitle)
                .font(YDSFont.body2)
            Text(title)
                .font(YDSFont.title2)
        }
    }
}

struct DoubleTitleIconBar: View {
    let icon: Image?
    
    public init(icon: Image?) {
        self.icon = icon
    }
    
    public var body : some View {
        YDSTopBarIconButton(icon: icon, isSelected: false)
    }
}

extension View {
    public func ydsDoubleTitleTopBar(title: Binding<String?>, subtitle: Binding<String?>) -> some View {
      modifier(
        YDSDoubleTitleTopBar(
            topBar: .init(get: {
                DoubleTitleTopBar(
                    title: title.wrappedValue ?? "",
                    subtitle: subtitle.wrappedValue ?? "")
            }, set: { ydsTopBar in
                title.wrappedValue = ydsTopBar.title
                subtitle.wrappedValue = ydsTopBar.subtitle
            })
        )
      )
  }
}

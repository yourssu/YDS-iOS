//
//  YDSDoubleTitleTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/21/23.
//

import SwiftUI

struct YDSDoubleTitleTopBarModifier: ViewModifier {
    @Binding public var topBar: YDSDoubleTitleTopBar
    @Binding var isShowing: Bool
    
    public func body(content: Content) -> some View {
        return content
            .toolbar {
                ToolbarItem(placement:
                        .topBarLeading) {
                            DoubleTitleBar(title: topBar.title, subtitle: topBar.subtitle)
                        }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            Button(action: {
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.plusLine
                            })
                        }
                
                ToolbarItem(placement:
                        .topBarTrailing) {
                            Button(action: {
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.listLine
                            })
                        }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            Button(action: {
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.dotsVerticalLine
                            })
                        }
            }
    }
}

public struct YDSDoubleTitleTopBar: Equatable {
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

extension View {
    public func ydsDoubleTitleTopBar(title: Binding<String?>, subtitle: Binding<String?>, isShowing: Binding<Bool>) -> some View {
      modifier(
        YDSDoubleTitleTopBarModifier( 
            topBar: .init(get: {
                YDSDoubleTitleTopBar(
                    title: title.wrappedValue ?? "",
                    subtitle: subtitle.wrappedValue ?? "")
            }, set: { ydsTopBar in
                title.wrappedValue = ydsTopBar.title
                subtitle.wrappedValue = ydsTopBar.subtitle
            }), isShowing: isShowing
        )
      )
  }
}

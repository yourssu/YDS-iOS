//
//  YDSSingleTitleTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/21/23.
//

import SwiftUI
import YDS_Essential

struct YDSSingleTitleTopBar: ViewModifier {
    @Binding public var topBar: YDSTopBar
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: 
                        .topBarLeading) {
                            TitleBarView(topBar.title)
                }
                ToolbarItem(placement: 
                        .topBarTrailing) {
                            IconBarView(icon: YDSIcon.searchLine)
                }
                ToolbarItem(placement: 
                        .topBarTrailing) {
                            IconBarView(icon: YDSIcon.penLine)
                }
            }
    }
}

public struct YDSTopBar: Equatable {
    let title: String
}

struct TitleBarView: View {
    let title: String
    
    public init(_ title: String) {
        self.title = title
    }
    
    public var body : some View {
        HStack{
            Text(title)
                .font(YDSFont.title2)
        }
    }
}

struct IconBarView: View {
    let icon: Image?
    
    public init(icon: Image?) {
        self.icon = icon
    }
    
    public var body : some View {
        YDSTopBarIconButton(icon: icon, isSelected: false)
    }
}

extension View {
    public func ydsSingleTitleTopBar(_ title: Binding<String?>) -> some View {
        modifier(
            YDSSingleTitleTopBar(
                topBar: .init(get: {
                    YDSTopBar(title: title.wrappedValue ?? "")
                }, set: { ydsTopBar in
                    title.wrappedValue = ydsTopBar.title
                })
            )
        )
    }
}

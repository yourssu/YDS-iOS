//
//  YDSTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/28/23.
//

import SwiftUI

struct YDSTopBar: ViewModifier {
    @Binding public var topBar: TopBar
    @State public var isSelected: Bool
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement:
                        .topBarLeading) {
                            YDSTopBarIconButton(icon: isSelected ? YDSIcon.starFilled : YDSIcon.starLine, isSelected: isSelected)
                }
                ToolbarItem(placement:
                        .principal) {
                            TitleBarView(topBar.title)
                }
                ToolbarItem(placement:
                        .topBarTrailing) {
                            YDSTopBarIconButton(icon: isSelected ? YDSIcon.starFilled : YDSIcon.starLine, isSelected: isSelected)
                }
            }
    }
}

public struct TopBar: Equatable {
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
                .font(YDSFont.subtitle2)
        }
    }
}

extension View {
    public func ydsTopBar(_ title: Binding<String?>) -> some View {
        modifier(
            YDSTopBar(
                topBar: .init(get: {
                    TopBar(title: title.wrappedValue ?? "")
                }, set: { ydsTopBar in
                    title.wrappedValue = ydsTopBar.title
                }), isSelected: false
            )
        )
    }
}

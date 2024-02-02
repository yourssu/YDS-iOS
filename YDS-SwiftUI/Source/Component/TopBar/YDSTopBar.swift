//
//  YDSTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/28/23.
//

import SwiftUI

struct YDSTopBarModifier: ViewModifier {
    @Binding var isLeftButtonSelected: Bool
    @Binding var isRightButtonSelected: Bool
    @Binding public var topBar: YDSTopBar
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement:
                        .topBarLeading){
                            Button(action: {isLeftButtonSelected.toggle()}, label: {
                                isLeftButtonSelected ? YDSIcon.starFilled : YDSIcon.starLine
                            })
                }
                ToolbarItem(placement: .principal){
                    Text(topBar.title)
                        .font(YDSFont.subtitle2)
                }
                ToolbarItem(placement:
                        .topBarTrailing){
                            Text(isRightButtonSelected ? "완료" : "편집")
                                .onTapGesture {
                                    isRightButtonSelected.toggle()
                                }
                        }
            }
        
    }
}

public struct YDSTopBar: Equatable {
    let title: String
}

extension View {
    public func ydsTopBar(_ title: Binding<String?>, isLeftButtonSelected: Binding<Bool>, isRightButtonSelected: Binding<Bool>) -> some View {
        self.modifier(
            YDSTopBarModifier(
                isLeftButtonSelected: isLeftButtonSelected, isRightButtonSelected: isRightButtonSelected,topBar: .init(get: {
                    YDSTopBar(title: title.wrappedValue ?? "")
                }, set: { ydsTopBar in
                    title.wrappedValue = ydsTopBar.title
                })
            )
        )
    }
}

//
//  YDSSingleTitleTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 11/21/23.
//

import SwiftUI
import YDS_Essential

enum ButtonName: String {
    case Searchbutton
    case Writebutton
}

struct YDSSingleTitleTopBar: ViewModifier {
    @Binding public var isShowing: Bool
    @State private var selectedButton: ButtonName?
    @Binding public var topBar: SingleTitleTopBar
    
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
                                selectedButton = .Searchbutton
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.searchLine
                            })
                }
                ToolbarItem(placement: 
                        .topBarTrailing) {
                            Button(action: {
                                selectedButton = .Writebutton
                                isShowing.toggle()
                            }, label: {
                                YDSIcon.penLine
                            })
                }
            }
    }
}

public struct SingleTitleTopBar: Equatable {
    let title: String
}

struct SingleTitleBar: View {
    let title: String
    
    public init(_ title: String) {
        self.title = title
    }
    
    public var body : some View {
        Text(title)
            .font(YDSFont.title2)
    }
}

extension View {
    public func ydsSingleTitleTopBar(_ title: Binding<String?>, isShowing: Binding<Bool>) -> some View {
        modifier(
            YDSSingleTitleTopBar(
                isShowing: isShowing, topBar: .init(get: {
                    SingleTitleTopBar(title: title.wrappedValue ?? "")
                }, set: { ydsTopBar in
                    title.wrappedValue = ydsTopBar.title
                })
            )
        )
    }
}

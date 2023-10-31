//
//  YDSTopBar.swift
//  YDS-SwiftUI
//
//  Created by 신종원 on 2023/10/24.
//

import SwiftUI
import YDS_Essential

public struct YDSTopBar: UIViewRepresentable {
    let title: String?
    let modalPresentationStyle: UIModalPresentationStyle?
    
    public init(title: String?, modalPresentationStyle: UIModalPresentationStyle?) {
        self.title = title
        self.modalPresentationStyle = modalPresentationStyle
    }
    
    public func makeUIView(context: Context) -> UINavigationBar {
        let navigationBar = UINavigationBar()
        navigationBar.largeContentTitle = title
        navigationBar.inputViewController?.modalPresentationStyle = modalPresentationStyle ?? .automatic
        
        return navigationBar
    }
    
    public func updateUIView(_ uiView: UINavigationBar, context: Context) {
        uiView.largeContentTitle = title
        uiView.inputViewController?.modalPresentationStyle = modalPresentationStyle ?? .automatic
    }
}

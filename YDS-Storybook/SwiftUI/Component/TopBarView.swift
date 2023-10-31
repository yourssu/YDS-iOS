//
//  TopBarView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/23.
//

import SwiftUI
import YDS_SwiftUI

public struct TopBarView: View {
    let navigationTitle: String = "Topbar"
    
    @State var title: String? = "topbar"
    @State var modalPresentationStyleSelectedIndex = 0
    
    public var body: some View {
        StorybookPageView(sample: {
            VStack{
                GeometryReader { geometry in
                    YDSTopBar(
                        title: title ?? "",
                        modalPresentationStyle:
                            UIModalPresentationStyle.automatic)
                    .frame(height: YDSScreenSize.width * 3/4 - 32)
                    .padding(16)
                    .clipped()
                }
            }
        }, options: [
            Option.optionalString(
                description: "title",
                text: $title),
            Option.enum(description: "modalPresentationStyle", cases: [UIModalPresentationStyle.fullScreen, UIModalPresentationStyle.automatic], selectedIndex: $modalPresentationStyleSelectedIndex)
        ])
        .navigationTitle(navigationTitle)
    }
}

struct TopBarView_Proviews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}

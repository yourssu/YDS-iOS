//
//  TopBarSampleView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/24.
//

import SwiftUI
import YDS_SwiftUI
import YDS

public struct TopBarSampleView: View {
    @State var title: String? = "커뮤니티"
    
    public var body: some View {
        NavigationStack {
            Text("")
                .ydsTopBar($title)
        }
    }
    
}

public struct TopBarDoubleTitleSampleView: View {
    @State var title: String? = "커뮤니티"
    @State var subtitle: String? = "커뮤니티"
    
    public var body: some View {
        NavigationStack {
            Text("")
                .ydsDoubleTitleTopBar(title: $title, subtitle: $subtitle)
        }
    }
    
}

public struct TopBarSingleTitleSampleView: View {
    @State var title: String? = "커뮤니티"
    
    public var body: some View {
        NavigationStack {
            Text("")
                .ydsSingleTitleTopBar($title)
        }
    }
    
}

struct TopBarSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarSingleTitleSampleView()
    }
}

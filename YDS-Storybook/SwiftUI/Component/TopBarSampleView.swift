//
//  TopBarSampleView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/24.
//

import SwiftUI
import YDS_SwiftUI

public struct TopBarSampleView: View {
    
    
    public var body: some View {
        VStack {
            YDSTopBar(title: "TopBar", modalPresentationStyle: UIModalPresentationStyle.fullScreen)
        }
    }
    
}

struct TopBarSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarSampleView()
    }
}

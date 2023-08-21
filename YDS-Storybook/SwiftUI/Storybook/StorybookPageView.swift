//
//  StorybookPageView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI

import YDS_SwiftUI

struct StorybookPageView<ViewType: View>: View {
    @ViewBuilder private var sample: () -> ViewType
    
    private let options: [Option]
    
    init(
        sample: @escaping () -> ViewType,
        options: [Option]
    ) {
        self.sample = sample
        self.options = options
    }
    
    var body: some View {
        VStack(spacing: 0) {
            sampleExpaned
            divider
            optionScrollView
        }
    }
}

private extension StorybookPageView {
    var sampleExpaned: some View {
        sample()
            .frame(maxWidth: .infinity, maxHeight: YDSScreenSize.width * 3/4)
            .background(
                YDSColor.monoItemBG
            )
    }
    
    var divider: some View {
        Divider()
    }
    
    var optionScrollView: some View {
        ScrollView {
            VStack {
                ForEach(options.indices, id: \.self) { index in
                    options[index].body
                }
            }
            .padding()
        }
    }
}

struct StorybookPageView_Previews: PreviewProvider {
    static var previews: some View {
        StorybookPageView(sample: {
            Text("Text")
        }, options: [])
    }
}

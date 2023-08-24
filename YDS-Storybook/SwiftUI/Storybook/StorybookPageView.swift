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
        @State var text: String? = "BoxButton"
        @State var isDisabled = false
        @State var numberOfLines = 1
        @State var selectedBoxButtonType = 0
        
        enum BoxButtonType: CaseIterable {
            case filled, tinted, line
        }
        
        return StorybookPageView(
            sample: {
                Button(action: {}) {
                    Text(text ?? "")
                        .lineLimit(numberOfLines)
                }
                .disabled(isDisabled)
            },
            options: [
                Option.bool(description: "isDisabled", isOn: $isDisabled),
                Option.int(description: "numberOfLines", value: $numberOfLines),
                Option.enum(description: "", cases: BoxButtonType.allCases, selectedIndex: $selectedBoxButtonType),
                Option.optionalString(description: "text", text: $text)
            ]
        )
    }
}

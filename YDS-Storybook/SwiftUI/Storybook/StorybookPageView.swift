//
//  StorybookPageView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI

import YDS_SwiftUI

struct OptionListItem: View {
    private enum Dimension {
        enum Spacing {
            static let vstack: CGFloat = 16
        }
        
        enum Padding {
            static let vstack: CGFloat = 16
        }
    }
    
    private let option: Option
    
    init(option: Option) {
        self.option = option
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.Spacing.vstack) {
            option.body
            Divider()
        }
        .padding(Dimension.Padding.vstack)
    }
}

struct StorybookPageView<ViewType: View>: View {
    @ViewBuilder private var sample: () -> ViewType
    
    private let options: [Option]
    
    init(sample: @escaping () -> ViewType, options: [Option]) {
        self.sample = sample
        self.options = options
    }
    
    var body: some View {
        VStack(spacing: 0) {
            sampleExpaned
            Divider()
            scrollableOptions
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension StorybookPageView {
    var sampleExpaned: some View {
        sample()
            .frame(maxWidth: .infinity, maxHeight: YDSScreenSize.width * 3/4)
            .background(
                Rectangle()
                    .fill(YDSColor.monoItemBG)
            )
    }
    
    var scrollableOptions: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(options.indices, id: \.self) { index in
                    OptionListItem(option: options[index])
                }
            }
        }
    }
}

struct StorybookPageView_Previews: PreviewProvider {
    static var previews: some View {
        enum BoxButtonType: CaseIterable {
            case filled, tinted, line
        }
        
        let images = YDSSwiftUIIcon.icons
        
        @State var text: String? = "BoxButton"
        @State var isDisabled = false
        @State var numberOfLines = 1
        @State var selectedBoxButtonType = 0
        @State var icon: SwiftUIIcon?
        
        return StorybookPageView(
            sample: {
                Button(action: {}) {
                    HStack {
                        if let icon = icon?.icon {
                            icon
                        }
                        Text(text ?? "")
                            .lineLimit(numberOfLines)
                    }
                }
                .disabled(isDisabled)
            },
            options: [
                Option.bool(description: "isDisabled", isOn: $isDisabled),
                Option.int(description: "numberOfLines", value: $numberOfLines),
                Option.enum(description: "buttonType", cases: BoxButtonType.allCases, selectedIndex: $selectedBoxButtonType),
                Option.optionalString(description: "text", text: $text),
                Option.optionalImage(description: "icon", images: images, selectedImage: $icon)
            ]
        )
    }
}

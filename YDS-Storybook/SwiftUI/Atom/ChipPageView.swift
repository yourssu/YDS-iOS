//
//  ChipPageView.swift
//  YDS-Storybook
//
//  Created by 신종원 on 11/5/23.
//

import SwiftUI
import YDS_SwiftUI

struct ChipPageView: View {
    let title: String = "Chip"

    @State var text: String? = "IT대학"
    @State var isSelected: Bool = false

    public var body: some View {
        StorybookPageView(sample: {
            YDSChip(
                text: text,
                isSelected: isSelected)
            .frame(maxWidth: .infinity, maxHeight: YDSScreenSize.width * 3/4)
            .background(
                Rectangle()
                    .fill(.white)
            )
        }, options: [
            Option.optionalString(
                description: "text",
                text: $text),
            Option.bool(
                description: "isSelcted",
                isOn: $isSelected)
        ])
        .navigationTitle(title)
    }
}

#Preview {
    ChipPageView()
}

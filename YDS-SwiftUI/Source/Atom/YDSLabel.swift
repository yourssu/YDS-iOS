//
//  YDSLabel.swift
//  YDS-SwiftUI
//
//  Created by 박지윤 on 2023/09/11.
//

import SwiftUI
import YDS_Essential

extension Text.TruncationMode {
    public static var allCases: [Text.TruncationMode] = [.head, .middle, .tail]
}

public struct YDSLabel: View {
    let text: String?
    let font: Font
    let lineLimit: Int?
    let textColor: Color
    let alignment: TextAlignment
    let truncationMode: Text.TruncationMode
    let allowsTightening: Bool

    public init(text: String? = "Label",
                font: Font = YDSFont.display1,
                lineLimit: Int? = nil,
                textColor: Color = YDSColor.textPrimary,
                alignment: TextAlignment = .center,
                truncationMode: Text.TruncationMode = .tail,
                allowsTightening: Bool = false
    ) {
        self.text = text
        self.font = font
        self.lineLimit = lineLimit
        self.textColor = textColor
        self.alignment = alignment
        self.truncationMode = truncationMode
        self.allowsTightening = allowsTightening
    }

    public var body: some View {
        if let text = text {
            Text(text)
                .font(font)
                .lineLimit(lineLimit)
                .foregroundColor(textColor)
                .multilineTextAlignment(alignment)
                .truncationMode(truncationMode)
                .allowsTightening(allowsTightening)
        }
    }
}

struct YDSLabel_Previews: PreviewProvider {
    static var previews: some View {
        YDSLabel()
    }
}

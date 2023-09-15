//
//  YDSLabelView.swift
//  YDS-SwiftUI
//
//  Created by 박지윤 on 2023/09/11.
//
import SwiftUI
import YDS_Essential

public struct YDSLabelView: View {

    private let text: Text?

    public init(text: Text) {
        self.text = text
    }

    public var body: some View {
        if let text = text {
            text
        }
    }
}

struct YDSLabelView_Previews: PreviewProvider {
    static var previews: some View {
        YDSLabelView(text: Text(""))
    }
}

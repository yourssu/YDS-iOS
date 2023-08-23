//
//  EnumOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct EnumOptionView: View {
    private let description: String?
    private let cases: [Any]
    @Binding private var selectedIndex:Int
    
    @State private var showingBottomSheet = false
    
    init(description: String?, cases: [Any], selectedIndex:Binding<Int> ) {
        self.description = description
        self.cases = cases
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let description = description {
                Text(description)
                    .font(YDSFont.subtitle2)
            }
            if !cases.isEmpty {
                let mirror = Mirror(reflecting: cases[0])
                if let enumTypeName = "\(mirror.subjectType)".split(separator: ".").first {
                    Text(String(enumTypeName))
                        .font(YDSFont.body2)
                }
            }
            ShowPickerButton(cases: cases.map(  {String(describing: $0)}), selectedIndex: $selectedIndex)
        }
    }
}

struct EnumOptionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var index:Int = 0
        VStack(alignment: .leading) {
            EnumOptionView(description: "rouding", cases: ["example1","example2"], selectedIndex: $index)
        }
    }
}

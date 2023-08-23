//
//  IntOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct IntOptionView: View {
    private let description: String?
    @Binding private var value: Int
    
    init(description: String?, value: Binding<Int>) {
        self.description = description
        self._value = value
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let description = description {
                Text(description)
                    .font(YDSFont.subtitle2)
            }
            Text("Int")
                .font(YDSFont.body2)
            TextField("", value: $value, format: .number)
        }
    }
}

struct IntOptionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var value: Int = 0
        let description: String = "numberOfLines"
        
        VStack {
            Text("\(value)")
            IntOptionView(description: description, value: $value)
        }
    }
}

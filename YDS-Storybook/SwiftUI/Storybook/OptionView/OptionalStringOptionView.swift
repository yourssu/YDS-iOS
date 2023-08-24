//
//  OptionalStringOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct OptionalStringOptionView: View {
    @Binding private var text: String?
    
    private let description: String?
    
    @State private var placeholder: String
    
    init(description: String?, text: Binding<String?>) {
        self.description = description
        self._text = text
        self.placeholder = text.wrappedValue ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    if let description = description {
                        Text(description)
                            .font(YDSFont.subtitle2)
                    }
                    Text("Optional<String>")
                        .font(YDSFont.body2)
                }
                Spacer()
                Toggle("", isOn: Binding(
                    get: {
                        text != nil
                    },
                    set: { isOn in
                        isOn ? (text = placeholder) : (text = nil)
                    }
                ))
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
            }
            
            TextField("", text: Binding(
                get: {
                    placeholder
                },
                set: { text in
                    placeholder = text
                    self.text = text
                }
            ))
            .font(YDSFont.body1)
            .tint(YDSColor.textPointed)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(YDSColor.inputFieldElevated)
            )
            .disabled(text == nil)
        }
    }
}

struct OptionalStringOptionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OptionalStringOptionView(
                description: "text",
                text: .constant("테스트입니다")
            )
            OptionalStringOptionView(
                description: "text",
                text: .constant(nil)
            )
        }
    }
}

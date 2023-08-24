//
//  OptionalImageOptionView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct OptionalImageOptionView: View {
    @Binding private var selectedImage: Image?
    
    private let description: String?
    private let images: [Image?]
    
    @State private var placeholderIndex: Int
    @State private var isPresentPicker = false
    
    init(description: String?, images: [Image?], selectedImage: Binding<Image?>) {
        self.description = description
        self.images = images
        self._selectedImage = selectedImage
        self.placeholderIndex = images.firstIndex(of: selectedImage.wrappedValue) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    if let description = description {
                        Text(description)
                            .font(YDSFont.subtitle2)
                    }
                    Text("Optional<Image>")
                        .font(YDSFont.body2)
                }
                Spacer()
                Toggle("", isOn: Binding(get: {
                    selectedImage != nil
                }, set: { isOn in
                    isOn ? (selectedImage = images[placeholderIndex]) : (selectedImage = nil)
                }))
                .labelsHidden()
                .tint(YDSColor.buttonPoint)
            }
            
            Button(action: {
                isPresentPicker.toggle()
            }) {
                Text(images[placeholderIndex] ?? YDSIcon.adbadgeFilled)
                    .font(YDSFont.body1)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(YDSColor.inputFieldElevated)
                    )
            }
            .tint(YDSColor.textPointed)
            .disabled(selectedImage == nil)
            .sheet(isPresented: $isPresentPicker) {
                Picker("", selection: Binding(get: {
                    placeholderIndex
                }, set: { index in
                    placeholderIndex = index
                    selectedImage = images[index]
                })) {
                    ForEach(images.indices, id: \.self) { index in
                        Text(images[index] ?? YDSIcon.adbadgeFilled)
                            .tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .presentationDetents([.height(200)])
            }
        }
    }
}

struct OptionalImageOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalImageOptionView(
            description: "icon",
            images: [
                YDSIcon.adbadgeFilled,
                YDSIcon.arrowRightLine,
                YDSIcon.boardLine,
                YDSIcon.cameracircleLine,
                YDSIcon.dotbadgeLine
            ],
            selectedImage: .constant(YDSIcon.bellFilled)
        )
    }
}

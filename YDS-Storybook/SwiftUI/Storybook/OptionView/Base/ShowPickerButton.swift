//
//  PickerView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct ShowPickerButton: View {
    @Binding var selectedIndex: Int
    
    private let cases: [String]
    
    @State private var isShowBottomSheet = false
    
    init(cases: [String], selectedIndex: Binding<Int>) {
        self.cases = cases
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        Button(action: {
            isShowBottomSheet.toggle()
        }) {
            Text(cases[selectedIndex])
                .font(YDSFont.body1)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(YDSColor.inputFieldElevated)
                )
        }
        .tint(YDSColor.textPrimary)
        .sheet(isPresented: $isShowBottomSheet) {
            Picker(cases[selectedIndex], selection: $selectedIndex) {
                ForEach(0..<cases.count, id:\.self) { index in
                    Text(cases[index])
                        .tag(index)
                }
            }
            .pickerStyle(.wheel)
            .presentationDetents([.height(200)])
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        ShowPickerButton(cases: ["example1","example2"], selectedIndex: .constant(0))
    }
}

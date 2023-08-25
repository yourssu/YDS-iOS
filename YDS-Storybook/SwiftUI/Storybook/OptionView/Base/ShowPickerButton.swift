//
//  PickerView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI
import YDS_SwiftUI

struct ShowPickerButton<T>: View {
    @Binding private var selectedIndex: Int
    
    private let cases: [T]
    
    @State private var isShowBottomSheet = false
    
    init(cases: [T], selectedIndex: Binding<Int>) {
        self.cases = cases
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        Button(action: {
            isShowBottomSheet.toggle()
        }) {
            if cases[selectedIndex] is Image? {
                Text(cases[selectedIndex] as! Image? ?? YDSIcon.adbadgeFilled)
                    .font(YDSFont.body1)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(YDSColor.inputFieldElevated)
                    )
            } else {
                Text(String(describing: cases[selectedIndex]))
                    .font(YDSFont.body1)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(YDSColor.inputFieldElevated)
                    )
            }
        }
        .tint(YDSColor.textPrimary)
        .sheet(isPresented: $isShowBottomSheet) {
            Picker("", selection: $selectedIndex) {
                ForEach(0..<cases.count, id:\.self) { index in
                    if cases[selectedIndex] is Image? {
                        Text(cases[index] as! Image? ?? YDSIcon.adbadgeFilled)
                            .tag(index)
                    } else {
                        Text(String(describing: cases[index]))
                            .tag(index)
                    }
                }
            }
            .pickerStyle(.wheel)
            .presentationDetents([.height(200)])
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ShowPickerButton(
                cases: ["example1","example2"],
                selectedIndex: .constant(0)
            )
            ShowPickerButton(
                cases: [YDSIcon.adbadgeFilled, YDSIcon.foodFilled],
                selectedIndex: .constant(0)
            )
        }
    }
}

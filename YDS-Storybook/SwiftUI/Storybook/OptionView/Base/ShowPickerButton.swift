//
//  PickerView.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI

struct ShowPickerButton: View {
    private let cases: [String]
    @Binding var selectedIndex: Int
    
    @State private var showBottomSheet = false
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    init(cases:[String], selectedIndex:Binding<Int>) {
        self.cases = cases
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        Button(action: {
            showBottomSheet.toggle()
        })
        {
            Text(cases[selectedIndex]) }
        .sheet(isPresented: $showBottomSheet)
        {
            Picker(cases[selectedIndex], selection: $selectedIndex) {
                ForEach(0..<cases.count, id:\.self) { index in
                    Text(cases[index])
                        .tag(index)
                }
            }
            .pickerStyle(.wheel)
            .presentationDetents([.height(200)])
        }
        .padding()
        .border(.black)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        ShowPickerButton(cases: ["example1","example2"], selectedIndex: .constant(0))
    }
}

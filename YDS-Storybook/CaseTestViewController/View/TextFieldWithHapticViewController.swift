//
//  TextFieldWithHapticViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/10/02.
//

import UIKit

class TextFieldWithHapticViewController: TextFieldCaseTestBaseViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = TextFieldCaseTestViewModel(.withHaptic)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  Toggle.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/06/08.
//

import UIKit

public class Toggle: UISwitch {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.onTintColor = YDSColor.buttonPoint
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

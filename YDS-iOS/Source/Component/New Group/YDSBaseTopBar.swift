//
//  YDSBaseTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit

public class YDSBaseTopBar: UINavigationBar {
    
    internal init() {
        super.init(frame: .zero)
        setBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setBackground() {
        self.pushItem(UINavigationItem(), animated: true)
        self.barTintColor = YDSColor.bgElevated
        self.tintColor = YDSColor.buttonNormal
        self.isTranslucent = false
        self.shadowImage = UIImage()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
  
        removeButtonBarSpacing()
        setButtonBarProperties()
    }

}

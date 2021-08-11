//
//  YDSTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit

public class YDSTopBar: UINavigationBar {
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setProperties()
    }
    
    private func setProperties() {
        self.pushItem(UINavigationItem(), animated: true)
        self.barTintColor = YDSColor.bgElevated
        self.tintColor = YDSColor.buttonNormal
        self.isTranslucent = false
        self.shadowImage = UIImage()
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: YDSColor.textPrimary,
            NSAttributedString.Key.font: YDSFont.subtitle2,
        ]
    }

}


extension YDSTopBar {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
  
        removeButtonBarSpacing()
        setButtonBarProperties()
    }
    
}

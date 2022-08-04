//
//  YDSIconView.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/13.
//

import UIKit
import SnapKit

public class YDSIconView: UIImageView {
    
    public enum IconSize: Int {
        case extraSmall = 16
        case small = 20
        case medium = 24
        case large = 48
    }
    
    @SetNeeds(.layout) public var size: IconSize = .medium
    
    public init() {
        super.init(frame: CGRect.zero)
        setIconSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setIconSize() {
        self.snp.updateConstraints {
            $0.height.width.equalTo(size.rawValue)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setIconSize()
    }
}

//
//  YDSIconImage.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/13.
//

import UIKit
import SnapKit

public class YDSIconImage: UIImageView {
    
    public enum IconSize: Int {
        case extraSmall = 16
        case small = 20
        case medium = 24
        case large = 48
    }
    
    public var size: IconSize = .medium {
        didSet { setIconSize() }
    }
        
    public init(icon: UIImage?) {
        super.init(frame: CGRect.zero)
        self.image = icon
        setIconSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setIconSize() {
        self.snp.makeConstraints {
            $0.height.width.equalTo(size.rawValue)
        }
    }
}


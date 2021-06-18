//
//  Icon.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/06/18.
//

import UIKit
import SnapKit

public class Icon: UIView {
    
    public enum IconSize: Int {
        case extraSmall = 16
        case small = 20
        case medium = 24
        case large = 48
    }
    
    public var size: IconSize = .medium {
        didSet { setIconSize() }
    }
    
    public var image: UIImage? {
        didSet { setIconImage() }
    }
    
    private var imageView = UIImageView()
    
    public init(image: UIImage?) {
        super.init(frame: CGRect.zero)
        self.addSubview(imageView)
        self.image = image
        setIconImage()
        setIconPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setIconPosition() {
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setIconSize() {
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(size.rawValue)
        }
    }
    
    private func setIconImage() {
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
    }
    
}

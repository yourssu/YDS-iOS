//
//  YDSDivider.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/17.
//

import UIKit

public class YDSDivider: UIView {
    
    public enum DividerThickness {
        case thin
        case thick
        
        fileprivate func getRawValue() -> CGFloat {
            switch self {
            case .thin:
                return Constant.Border.thin
            case .thick:
                return Constant.Border.thick
            }
        }
    }
    
    public enum DividerDirection {
        case horizontal
        case vertical
    }
    
    public var thickness: DividerThickness = .thin {
        didSet { setThickness() }
    }
    
    public var direction: DividerDirection = .horizontal {
        didSet { setDirection() }
    }
        
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setThickness()
        setDirection()
    }
    
    private func setThickness() {
        switch thickness {
        case .thin:
            self.backgroundColor = YDSColor.borderNormal
        case .thick:
            self.backgroundColor = YDSColor.borderThin
        }
    }
    
    private func setDirection() {
        switch direction {
        case .horizontal:
            self.snp.updateConstraints {
                $0.height.equalTo(thickness.getRawValue())
            }
        case .vertical:
            self.snp.updateConstraints {
                $0.width.equalTo(thickness.getRawValue())
            }
        }
    }

}

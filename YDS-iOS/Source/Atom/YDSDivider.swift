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
    }
    
    public enum DividerAxis {
        case horizontal
        case vertical
    }
    
    public var thickness: DividerThickness = .thin {
        didSet { setupView() }
    }
    
    public var axis: DividerAxis = .horizontal {
        didSet { setupView() }
    }
    
    private var thicknessRawValue: CGFloat = Constant.Border.thick
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        switch thickness {
        case .thin:
            self.thicknessRawValue = Constant.Border.thin
            self.backgroundColor = YDSColor.borderNormal
        case .thick:
            self.thicknessRawValue = Constant.Border.thick
            self.backgroundColor = YDSColor.borderThin
        }
        
        switch axis {
        case .horizontal:
            self.snp.removeConstraints()
            self.snp.makeConstraints {
                $0.height.equalTo(thicknessRawValue)
            }
        case .vertical:
            self.snp.removeConstraints()
            self.snp.makeConstraints {
                $0.width.equalTo(thicknessRawValue)
            }
        }
    }

}

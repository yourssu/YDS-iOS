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
        
        fileprivate var rawValue: CGFloat {
            switch self {
            case .thin:
                return YDSConstant.Border.thin
            case .thick:
                return YDSConstant.Border.thick
            }
        }
    }
    
    public enum DividerDirection {
        case horizontal
        case vertical
    }
    
    public var thickness: DividerThickness = .thin {
        didSet {
            setColor()
            setThickness()
        }
    }
    
    private var direction: DividerDirection {
        didSet { setThickness() }
    }
    
    public init(_ direction: DividerDirection) {
        self.direction = direction
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setColor()
        setThickness()
    }
    
    private func setColor() {
        switch thickness {
        case .thin:
            self.backgroundColor = YDSColor.borderNormal
        case .thick:
            self.backgroundColor = YDSColor.borderThin
        }
    }
    
    private func setThickness() {
        switch direction {
        case .horizontal:
            self.snp.updateConstraints {
                $0.height.equalTo(thickness.rawValue)
            }
        case .vertical:
            self.snp.updateConstraints {
                $0.width.equalTo(thickness.rawValue)
            }
        }
    }

}

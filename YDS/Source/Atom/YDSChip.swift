//
//  YDSChip.swift
//  YDS
//
//  Created by 신종원 on 2023/10/31.
//

import UIKit
import YDS_Essential
import SnapKit

@available(iOS 15, *)
public class YDSChip: UIControl {
    
    // MARK: - 외부에서 지정가능한 속성
    
    /**
    칩 안에 들어갈 문구를 설정합니다. (ex. IT대학)
     */
    @Invalidating(wrappedValue: nil, .layout) public var text: String?
    
    /**
     칩의 높이, 타이포 크기, 아이콘 크기, 패딩을 결정할 때 사용합니다.
     */
    private let size: ChipSize = ChipSize()

    private struct ChipSize {
        var height: CGFloat {
            return 24
        }

        var cornerRadius: CGFloat {
            return height/2
        }
        
        var padding: CGFloat {
            return 8
        }
    }
    
    public override var isSelected: Bool {
        didSet { setNeedsLayout() }
    }
    
    // MARK: - 내부에서 사용되는 상수
    
    /**
     칩의 아이콘, 글자 컬러입니다.
     */
    private let fgColor: UIColor = YDSColor.textTertiary
    
    /**
     칩이 pressed 되었을 때 아이콘, 글자 컬러입니다.
     */
    private let fgPressedColor: UIColor = YDSColor.textBright
    
    /**
     칩의 배경 컬러입니다.
     */
    private let bgColor: UIColor = YDSColor.buttonBG

    /**
     칩이 pressed 되었을 때 배경 컬러입니다.
     */
    private let bgPressedColor: UIColor = YDSColor.buttonPoint
    
    /**
     text를 표시하는 Label 입니다.
     */
    private let textLabel = YDSLabel(style: .caption1)
    
    public init() {
        super.init(frame: .zero)
        setChipSize()
        setColorBasedOnIsSelected()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        setCornerRadius()
        textLabel.text = text
        setChipSize()
        setColorBasedOnIsSelected()
    }
    
    /**
     isSelected 값에 맞추어 backgroundColor, textColor를 변경합니다.
     */
    private func setColorBasedOnIsSelected() {
        self.backgroundColor = !isSelected
        ? bgColor
        : bgPressedColor

        self.textLabel.textColor = !isSelected
        ? fgColor
        : fgPressedColor
    }
    
    /**
     칩의 높이, Label 의 위치를 세팅합니다.
     */
    private func setChipSize() {
        self.addSubview(textLabel)

        self.snp.updateConstraints {
            $0.height
                .equalTo(size.height)
        }

        textLabel.snp.makeConstraints {
            $0.centerY
                .equalToSuperview()
            $0.leading.trailing
                .equalToSuperview()
                .inset(size.padding)
        }
    }
    
    /**
     칩의 cornerRadius를 세팅합니다.
     */
    private func setCornerRadius() {
        self.layer.cornerRadius = size.cornerRadius
    }

}


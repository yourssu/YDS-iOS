//
//  YDSEmojiButton.swift
//  YDS
//
//  Created by 김윤서 on 2022/03/22.
//

import UIKit

import SnapKit

public class YDSEmojiButton: UIControl {
    //  MARK: - 외부에서 지정할 수 있는 속성
    /**
    이모지 버튼의 이모지를 설정합니다. (ex. 😆)
     */
    @SetNeedsLayout public var emoji: String? = nil
    
    /**
    이모지 버튼 옆에 들어갈 문구나 버튼을 설정합니다. (ex. 좋아요 3 또는 3)
     */
    @SetNeedsLayout public var text: String? = nil
    
    /**
     버튼의 높이, 타이포 크기, 아이콘 크기, 패딩을 결정할 때 사용합니다.
     */
    private let size: EmojiButtonSize = EmojiButtonSize()
    
    private struct EmojiButtonSize {
        var height: CGFloat  {
            return 32
        }
        
        var cornerRadius: CGFloat {
            return height/2
        }
    }

    public override var isSelected: Bool {
        didSet { setNeedsLayout() }
    }
    
    //  MARK: - 내부에서 사용되는 상수
    
    /**
     버튼 내 요소 사이 간격입니다. emojiLabel과 textLabel 사이 간격에 사용됩니다.
     */
    private let subviewSpacing: CGFloat = 2

    /**
     버튼의 아이콘, 글자 컬러입니다.
     */
    private let fgColor: UIColor = YDSColor.buttonNormal
    
    /**
     버튼이 pressed 되었을 때 아이콘, 글자 컬러입니다.
     */
    private let fgPressedColor: UIColor = YDSColor.buttonPoint
    
    /**
     버튼의 배경 컬러입니다.
     */
    private let bgColor: UIColor = YDSColor.buttonEmojiBG
    
    /**
     버튼이 pressed 되었을 때 배경 컬러입니다.
     */
    private let bgPressedColor: UIColor = YDSColor.buttonPointBG
    
    /**
     버튼의 border 컬러입니다.
     */
    private let borderColor: UIColor = YDSColor.borderNormal
    
    /**
     버튼의 borderWidth입니다.
     */
    private let borderWidth: CGFloat = YDSConstant.Border.thin
    
    /**
     emoji를 표시하는 Label 입니다.
     */
    private let emojiLabel = YDSLabel(style: .button1)
    
    /**
     text를 표시하는 Label 입니다.
     */
    private let textLabel = YDSLabel(style: .button4)
    
    public init() {
        super.init(frame: .zero)
        setBorderColor()
        setEmojiButtonSize()
        setColorBasedOnIsSelected()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
        self.emojiLabel.text = self.emoji
        self.textLabel.text = self.text
        setEmojiButtonSize()
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
     버튼의 높이, Label 의 위치를 세팅합니다.
     */
    private func setEmojiButtonSize() {
        self.addSubview(emojiLabel)
        self.addSubview(textLabel)

        self.snp.updateConstraints {
            $0.height.equalTo(size.height)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
        }
    
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(emojiLabel.snp.trailing).offset(subviewSpacing)
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
    /**
     버튼의 테두리 색상과 두께를 세팅합니다.
     */
    private func setBorderColor() {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }

    /**
     버튼의 cornerRadius를 세팅합니다.
     */
    private func setCornerRadius() {
        self.layer.cornerRadius = size.cornerRadius
    }
}

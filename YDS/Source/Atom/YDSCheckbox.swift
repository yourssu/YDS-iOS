//
//  YDSCheckbox.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/01.
//

import UIKit

public class YDSCheckbox: UIButton {

    // MARK: - 외부에서 지정할 수 있는 속성

    /**
     체크박스를 비활성화 시킬 때 사용합니다.
     */
    @SetNeeds(.layout, .display) public var isDisabled: Bool = false

    /**
     체크박스의 선택 여부를 나타낼 때 사용합니다.
     */
    public override var isSelected: Bool {
        didSet { setNeedsDisplay() }
    }

    /**
     타이포 크기, 아이콘 크기, 아이콘과 라벨 사이 간격을 결정할 때 사용합니다.
     */
    @SetNeeds(.layout, .display) public var size: CheckboxSize = .large

    /**
     체크박스의 글귀를 설정할 때 사용합니다.
     */
    @SetNeeds(wrappedValue: nil, .layout) public var text: String?

    // MARK: - 외부에서 접근할 수 있는 enum

    /**
     체크박스의 size 종류입니다.
     각 size에 맞는 font, iconSize, spacing을 computed property로 가지고 있습니다.
     */
    public enum CheckboxSize {
        case small
        case medium
        case large

        fileprivate var iconSize: CGFloat {
            switch self {
            case .small:
                return 16
            case .medium:
                return 20
            case .large:
                return 24
            }
        }

        fileprivate var font: UIFont {
            switch self {
            case .small:
                return YDSFont.button4
            case .medium:
                return YDSFont.button3
            case .large:
                return YDSFont.button3
            }
        }

        fileprivate var spacing: CGFloat {
            switch self {
            case .small:
                return 4
            case .medium, .large:
                return 8
            }
        }
    }

    // MARK: - 메소드

    public init() {
        super.init(frame: .zero)
        setupView()
        registerTapAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        setColor()
        setSize()
    }

    private func setColor() {
        setTitleColor()
        setTintColor()
    }

    private func setTitleColor() {
        if isDisabled {
            self.setTitleColor(YDSColor.buttonDisabled, for: .normal)
            self.setTitleColor(YDSColor.buttonDisabled, for: .selected)
            return
        }

        self.setTitleColor(YDSColor.buttonNormal, for: .normal)
        self.setTitleColor(YDSColor.buttonPoint, for: .selected)
    }

    private func setTintColor() {
        if isDisabled {
            self.tintColor = YDSColor.buttonDisabled
            return
        }

        self.tintColor = isSelected
            ? YDSColor.buttonPoint
            : YDSColor.buttonNormal
    }

    private func setSize() {
        setFont()
        setIconImage()
        setLayoutAccordingToText()
    }

    private func setFont() {
        self.titleLabel?.font = size.font
    }

    private func setIconImage() {
        self.setImage(YDSIcon.checkcircleFilled
                        .resize(to: size.iconSize)
                        .withRenderingMode(.alwaysTemplate),
                      for: .selected)

        self.setImage(YDSIcon.checkcircleFilled
                        .resize(to: size.iconSize)
                        .withRenderingMode(.alwaysTemplate),
                      for: UIControl.State.selected.union(.disabled))

        self.setImage(YDSIcon.checkcircleLine
                        .resize(to: size.iconSize)
                        .withRenderingMode(.alwaysTemplate),
                      for: .normal)
    }

    /**
     텍스트 설정에 따른 체크박스의 레이아웃을 결정합니다.
     */
    private func setLayoutAccordingToText() {
        if text != nil {
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -size.spacing/2,
                                                bottom: 0,
                                                right: size.spacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: size.spacing/2,
                                                bottom: 0,
                                                right: -size.spacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: size.spacing/2,
                                                  bottom: 0,
                                                  right: size.spacing/2)
            return
        }

        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    private func registerTapAction() {
        self.addTarget(self,
                       action: #selector(checkboxDidTap(_:)),
                       for: .touchUpInside
        )
    }

    @objc
    private func checkboxDidTap(_ sender: UIControl) {
        self.isSelected = !isSelected
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.isEnabled = !isDisabled
        setTitle(text, for: .normal)

        setFont()
        setLayoutAccordingToText()
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        setColor()
        setIconImage()
    }
}

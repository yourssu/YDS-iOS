//
//  YDSPlainButton.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/31.
//

import UIKit

/**
 배경이 없는 Button입니다.
 */
public class YDSPlainButton: UIButton, YDSButtonProtocol {

    // MARK: - 외부에서 지정할 수 있는 속성

    /**
     버튼을 비활성화 시킬 때 사용합니다.
     */
    @SetNeeds(.layout, .display) public var isDisabled: Bool = false

    /**
     삭제, 탈퇴 등 파괴적인 행위를 할 때
     버튼을 빨간색으로 표시해 경고하기 위해 사용합니다.
     */
    @SetNeeds(.display) public var isWarned: Bool = false

    /**
     버튼을 파란색 표시해 강조하기 위해 사용합니다.
     */
    @SetNeeds(.display) public var isPointed: Bool = false

    /**
     타이포 크기, 아이콘 크기를 결정할 때 사용합니다.
     */
    @SetNeeds(.layout, .display) public var size: PlainButtonSize = .large

    /**
     버튼의 글귀를 설정할 때 사용합니다.
     */
    @SetNeeds(.layout, .display) public var text: String?

    /**
     버튼의 좌측에 들어갈 아이콘을 설정할 때 사용합니다.
     */
    @SetNeeds(.display) public var leftIcon: UIImage?

    /**
     버튼의 우측에 들어갈 아이콘을 설정할 때 사용합니다.
     */
    @SetNeeds(.display) public var rightIcon: UIImage?

    /**
     기본 속성을 override한 후 didSet을 설정하여
     값이 바뀔 때 ( = 버튼을 누르거나 땠을 때 ) 그에 맞춰 색을 바꿔줍니다.
     */
    public override var isHighlighted: Bool {
        didSet { setNeedsDisplay() }
    }

    // MARK: - 외부에서 접근할 수 있는 enum

    /**
     버튼의 size 종류입니다.
     각 size에 맞는 font, iconSize를 computed property로 가지고 있습니다.
     */
    public enum PlainButtonSize {
        case large
        case medium
        case small

        fileprivate var font: UIFont {
            switch self {
            case .large:
                //  large size는 title label을 보이지 않게 처리하지만
                //  switch문 구성을 위해 임의로 button2를 return 합니다.
                return YDSFont.button2
            case .medium:
                return YDSFont.button3
            case .small:
                return YDSFont.button4
            }
        }

        fileprivate var iconSize: CGFloat {
            switch self {
            case .large:
                return 24
            case .medium:
                return 20
            case .small:
                return 16
            }
        }
    }

    // MARK: - 내부에서 사용되는 상수

    /**
     버튼 내 요소 사이 간격입니다. icon과 titleLabel 사이 간격에 사용됩니다.
     */
    private static let subviewSpacing: CGFloat = 2

    // MARK: - 내부에서 사용되는 변수

    /**
     버튼의 아이콘, 글자 컬러입니다.
     */
    private var fgColor: UIColor?

    /**
     버튼이 pressed 되었을 때 아이콘, 글자 컬러입니다.
     */
    private var fgPressedColor: UIColor?

    // MARK: - 메소드

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     view를 세팅합니다.
     */
    private func setupView() {
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false

        setColor()
        setSize()
    }

    /**
     버튼의 컬러 조합을 세팅합니다.
     우선순위는 isDisabled > isWarned > isPointed 입니다.
     */
    private func setColor() {
        if isDisabled {
            fgColor = YDSColor.buttonDisabled
            fgPressedColor = YDSColor.buttonDisabled
        } else if isWarned {
            fgColor = YDSColor.buttonWarned
            fgPressedColor = YDSColor.buttonWarnedPressed
        } else if isPointed {
            fgColor = YDSColor.buttonPoint
            fgPressedColor = YDSColor.buttonPointPressed
        } else {
            fgColor = YDSColor.buttonNormal
            fgPressedColor = YDSColor.buttonNormalPressed
        }

        setTitleColor(fgColor, for: .normal)
        setTitleColor(fgPressedColor, for: .highlighted)

        setTintColorBasedOnIsHighlighted()
    }

    /**
     isHighlighted 값에 맞추어 tintColor를 변경합니다.
     */
    private func setTintColorBasedOnIsHighlighted() {
        self.tintColor = !isHighlighted
            ? fgColor
            : fgPressedColor
    }

    /**
     버튼의 높이, 패딩, 폰트, 아이콘 크기를 세팅합니다.
     */
    private func setSize() {
        self.titleLabel?.font = size.font
        setIcon()
    }

    /**
     버튼의 아이콘 위치와 그에 따른 패딩을 설정합니다.
     우선순위는 leftIcon > rightIcon 입니다.
     */
    private func setIcon() {
        setIconImage()
        setLayoutAccordingToIcon()
    }

    /**
     버튼의 아이콘 이미지를 설정합니다.
     leftIcon이 존재할 경우 leftIcon을
     leftIcon이 존재하지 않으면서 rightIcon이 존재할 경우 rightIcon을
     둘 다 존재하지 않을 경우 nil을 채택합니다.
     */
    private func setIconImage() {
        if leftIcon != nil {
            self.setImage(self.leftIcon?
                            .resize(to: size.iconSize)
                            .withRenderingMode(.alwaysTemplate),
                          for: .normal)
            return
        }

        if rightIcon != nil {
            self.setImage(self.rightIcon?
                            .resize(to: size.iconSize)
                            .withRenderingMode(.alwaysTemplate),
                          for: .normal)
            return
        }

        self.setImage(nil, for: .normal)
    }

    /**
     아이콘 설정에 따른 버튼의 레이아웃을 결정합니다.
     */
    private func setLayoutAccordingToIcon() {
        if leftIcon != nil && text != nil && size != .large {
            //  leftIcon != nil 이면서 text != nil인
            //  2가지 경우에 대응합니다.

            self.semanticContentAttribute = .forceLeftToRight
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -YDSPlainButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: YDSPlainButton.subviewSpacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: YDSPlainButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: -YDSPlainButton.subviewSpacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: YDSPlainButton.subviewSpacing/2,
                                                  bottom: 0,
                                                  right: YDSPlainButton.subviewSpacing/2)
            return
        }

        if rightIcon != nil && text != nil && size != .large {
            //  위에서 걸러지지 않은 6가지 경우 중
            //  rightIcon != nil 이면서 text != nil 인
            //  1가지 경우에 대응합니다.

            self.semanticContentAttribute = .forceRightToLeft
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: YDSPlainButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: -YDSPlainButton.subviewSpacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -YDSPlainButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: YDSPlainButton.subviewSpacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: YDSPlainButton.subviewSpacing/2,
                                                  bottom: 0,
                                                  right: YDSPlainButton.subviewSpacing/2)
            return
        }

        //  위에서 걸러지지 않은 5가지 경우
        //  text == nil 인 경우 4가지
        //  leftIcon == nil && rightIcon == nil 인 경우 2가지
        //  둘의 합집합 5가지에 대응합니다.
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        isEnabled = !isDisabled

        if size == .large {
            setTitle(nil, for: .normal)
        } else {
            setTitle(text, for: .normal)
        }
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        setColor()
        setSize()
    }
}

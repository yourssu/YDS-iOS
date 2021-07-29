//
//  YDSBoxButton.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/21.
//

//
//  네모난 Box 모양의 Button입니다.
//


import UIKit

public class YDSBoxButton: UIButton {

    //  MARK: - 외부에서 지정할 수 있는 속성

    //  isDisabled: Bool
    //  버튼을 비활성화 시킬 때 사용합니다.
    public var isDisabled: Bool = false {
        didSet {
            self.isEnabled = !isDisabled
            setBoxButtonColor()
        }
    }
    
    //  isWarned: Bool
    //  삭제, 탈퇴 등 파괴적인 행위를 할 때
    //  버튼을 빨간색으로 표시해 경고하기 위해 사용합니다.
    public var isWarned: Bool = false {
        didSet { setBoxButtonColor() }
    }
    
    //  type: BoxButtonType ( filled, tinted, line )
    //  버튼의 외관을 결정할 때 사용합니다.
    public var type: BoxButtonType = .filled {
        didSet { setBoxButtonColor() }
    }
    
    //  size: BoxButtonSize ( extraLarge, large, medium, small )
    //  버튼의 높이, 타이포 크기, 아이콘 크기, 패딩을 결정할 때 사용합니다.
    public var size: BoxButtonSize = .large {
        didSet { setBoxButtonSize() }
    }
    
    //  rounding: BoxButtonRounding ( r4, r8 )
    //  버튼의 라운딩을 결정할 때 사용합니다.
    public var rounding: BoxButtonRounding = .r4 {
        didSet { setBoxButtonRounding() }
    }
    
    //  text: String?
    //  버튼의 글귀를 설정할 때 사용합니다.
    public var text: String? = nil {
        didSet { setTitle(text, for: .normal) }
    }
    
    //  leftIcon: UIImage?
    //  버튼의 좌측에 들어갈 아이콘을 설정할 때 사용합니다.
    public var leftIcon: UIImage? = nil {
        didSet { setIcon() }
    }
    
    //  rightIcon: UIImage?
    //  버튼의 우측에 들어갈 아이콘을 설정할 때 사용합니다.
    public var rightIcon: UIImage? = nil {
        didSet { setIcon() }
    }
    
    //  isHighlighted: Bool?
    //  기본 속성을 override한 후 didSet을 설정하여
    //  값이 바뀔 때 ( = 버튼을 누르거나 땠을 때 ) 그에 맞춰 색을 바꿔줍니다.
    public override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                setTintColorBasedOnIsHighlighted()
                setBorderColorBasedOnIsHighlighted()
            }
        }
    }
    
    
    //  MARK: - 외부에서 접근할 수 있는 enum
    
    //  BoxButtonType
    //  버튼의 type 종류입니다.
    public enum BoxButtonType {
        case filled
        case tinted
        case line
    }
    
    //  BoxButtonSize
    //  버튼의 size 종류입니다.
    //  각 size에 맞는 height, padding, font, iconSize를 computed property로 가지고 있습니다.
    public enum BoxButtonSize {
        case extraLarge
        case large
        case medium
        case small
        
        fileprivate var height: CGFloat {
            switch self {
            case .extraLarge:
                return 56
            case .large:
                return 48
            case .medium:
                return 40
            case .small:
                return 32
            }
        }
        
        fileprivate var padding: CGFloat {
            switch self {
            case .extraLarge:
                return 16
            case .large:
                return 16
            case .medium:
                return 12
            case .small:
                return 12
            }
        }
        
        fileprivate var font: UIFont {
            switch self {
            case .extraLarge:
                return YDSFont.button1
            case .large:
                return YDSFont.button2
            case .medium:
                return YDSFont.button2
            case .small:
                return YDSFont.button4
            }
        }
        
        fileprivate var iconSize: CGFloat {
            switch self {
            case .extraLarge:
                return 24
            case .large:
                return 24
            case .medium:
                return 24
            case .small:
                return 16
            }
        }
    }
    
    //  BoxButtonSize: Int
    //  버튼의 rounding 값 종류입니다.
    public enum BoxButtonRounding: Int {
        case r8 = 8
        case r4 = 4
    }
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    //  subviewSpacing: CGFloat
    //  버튼 내 요소 사이 간격입니다. icon과 titleLabel 사이 간격에 사용됩니다.
    private static let subviewSpacing: CGFloat = 4
    
    
    //  MARK: - 내부에서 사용되는 변수

    //  fgColor: UIColor?
    //  버튼의 아이콘, 글자 컬러입니다.
    private var fgColor: UIColor?
    
    //  fgPressedColor: UIColor?
    //  버튼이 pressed 되었을 때 아이콘, 글자 컬러입니다.
    private var fgPressedColor: UIColor?
    
    //  bgColor: UIColor?
    //  버튼의 배경 컬러입니다.
    private var bgColor: UIColor?
    
    //  bgPressedColor: UIColor?
    //  버튼이 pressed 되었을 때 배경 컬러입니다.
    private var bgPressedColor: UIColor?
    
    //  borderColor: UIColor?
    //  버튼의 border 컬러입니다.
    private var borderColor: UIColor?
    
    //  borderPressedColor: UIColor?
    //  버튼이 pressed 되었을 때 border 컬러입니다.
    private var borderPressedColor: UIColor?
    
    //  borderWidth: CGFloat
    //  버튼의 borderWidth입니다.
    private var borderWidth: CGFloat = 0
    
    
    //  MARK: - 메소드
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  setupView()
    //  view를 세팅합니다.
    private func setupView() {
        self.clipsToBounds = true
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
        
        setBoxButtonSize()
        setBoxButtonColor()
        setBoxButtonRounding()
    }
    
    //  setBoxButtonColor()
    //  버튼의 컬러 조합을 세팅합니다.
    //  우선순위는 isDisabled > isNegative > isPositive 입니다.
    private func setBoxButtonColor() {
        switch(type) {
        case .filled:
            borderColor = nil
            borderPressedColor = nil
            borderWidth = 0
            
            if isDisabled {
                fgColor = YDSColor.buttonDisabled
                fgPressedColor = YDSColor.buttonDisabled
                bgColor = YDSColor.buttonDisabledBG
                bgPressedColor = YDSColor.buttonDisabledBG
            } else if isWarned {
                fgColor = YDSColor.buttonReversed
                fgPressedColor = YDSColor.buttonReversed
                bgColor = YDSColor.buttonWarned
                bgPressedColor = YDSColor.buttonWarnedPressed
            } else {
                fgColor = YDSColor.buttonReversed
                fgPressedColor = YDSColor.buttonReversed
                bgColor = YDSColor.buttonPoint
                bgPressedColor = YDSColor.buttonPointPressed
            }
            
        case .tinted:
            borderColor = nil
            borderPressedColor = nil
            borderWidth = 0
            
            if isDisabled {
                fgColor = YDSColor.buttonDisabled
                fgPressedColor = YDSColor.buttonDisabled
                bgColor = YDSColor.buttonDisabledBG
                bgPressedColor = YDSColor.buttonDisabledBG
            } else if isWarned {
                fgColor = YDSColor.buttonWarned
                fgPressedColor = YDSColor.buttonWarnedPressed
                bgColor = YDSColor.buttonWarnedBG
                bgPressedColor = YDSColor.buttonWarnedBG
            } else {
                fgColor = YDSColor.buttonPoint
                fgPressedColor = YDSColor.buttonPointPressed
                bgColor = YDSColor.buttonPointBG
                bgPressedColor = YDSColor.buttonPointBG
            }
            
        case .line:
            bgColor = nil
            bgPressedColor = nil
            borderWidth = Constant.Border.normal
            
            if isDisabled {
                fgColor = YDSColor.buttonDisabled
                fgPressedColor = YDSColor.buttonDisabled
                borderColor = YDSColor.buttonDisabled
                borderPressedColor = YDSColor.buttonDisabled
            } else if isWarned {
                fgColor = YDSColor.buttonWarned
                fgPressedColor = YDSColor.buttonWarnedPressed
                borderColor = YDSColor.buttonWarned
                borderPressedColor = YDSColor.buttonWarnedPressed
            } else {
                fgColor = YDSColor.buttonPoint
                fgPressedColor = YDSColor.buttonPointPressed
                borderColor = YDSColor.buttonPoint
                borderPressedColor = YDSColor.buttonPointPressed
            }
        }
        
        setTitleColor(fgColor, for: .normal)
        setTitleColor(fgPressedColor, for: .highlighted)
        
        setTintColorBasedOnIsHighlighted()
        
        setBackgroundColor(bgColor, for: .normal)
        setBackgroundColor(bgPressedColor, for: .highlighted)
        
        self.layer.borderWidth = borderWidth
        setBorderColorBasedOnIsHighlighted()
    }
    
    //  setTintColorBasedOnIsHighlighted()
    //  isHighlighted 값에 맞추어 tintColor를 변경합니다.
    private func setTintColorBasedOnIsHighlighted() {
        self.tintColor = !isHighlighted
            ? fgColor
            : fgPressedColor
    }
    
    //  setBorderColorBasedOnIsHighlighted()
    //  isHighlighted 값에 맞추어 borderColor를 변경합니다.
    private func setBorderColorBasedOnIsHighlighted() {
        self.layer.borderColor = !isHighlighted
            ? borderColor?.cgColor
            : borderPressedColor?.cgColor
    }
    
    //  setBoxButtonRounding()
    //  버튼의 라운딩 값을 세팅합니다.
    private func setBoxButtonRounding() {
        self.layer.cornerRadius = CGFloat(rounding.rawValue)
    }
    
    //  setBoxButtonSize()
    //  버튼의 높이, 패딩, 폰트, 아이콘 크기를 세팅합니다.
    private func setBoxButtonSize() {
        self.snp.updateConstraints {
            $0.height.equalTo(size.height)
        }
 
        self.titleLabel?.font = size.font
        setIcon()
    }
    
    //  setIcon()
    //  버튼의 아이콘 위치와 그에 따른 패딩을 설정합니다.
    //  우선순위는 leftIcon > rightIcon 입니다.
    private func setIcon() {
        setIconImage()
        setLayoutAccordingToIcon()
    }
    
    //  setIconImage()
    //  버튼의 아이콘 이미지를 설정합니다.
    //  leftIcon이 존재할 경우 leftIcon을
    //  leftIcon이 존재하지 않으면서 rightIcon이 존재할 경우 rightIcon을
    //  둘 다 존재하지 않을 경우 nil을 채택합니다.
    private func setIconImage() {
        if leftIcon != nil {
            self.setImage(self.leftIcon?
                            .resize(to: size.iconSize)
                            .withRenderingMode(.alwaysTemplate),
                          for: .normal)
            return
        }
        
        if rightIcon != nil {
            self.setImage(self.leftIcon?
                            .resize(to: size.iconSize)
                            .withRenderingMode(.alwaysTemplate),
                          for: .normal)
            return
        }
        
        self.setImage(nil, for: .normal)
    }
    
    //  setLayoutAccordingToIcon()
    //  아이콘 설정에 따른 버튼의 레이아웃을 결정합니다.
    private func setLayoutAccordingToIcon() {
        if leftIcon != nil && text != nil {
            //  leftIcon != nil 이면서 text != nil인
            //  2가지 경우에 대응합니다.
            
            self.semanticContentAttribute = .forceLeftToRight
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: YDSBoxButton.subviewSpacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: -YDSBoxButton.subviewSpacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: size.padding+YDSBoxButton.subviewSpacing/2,
                                                  bottom: 0,
                                                  right: size.padding+YDSBoxButton.subviewSpacing/2)
            return
        }
        
        
        
        if rightIcon != nil && text != nil {
            //  위에서 걸러지지 않은 6가지 경우 중
            //  rightIcon != nil 이면서 text != nil 인
            //  1가지 경우에 대응합니다.
            
            self.semanticContentAttribute = .forceRightToLeft
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: -YDSBoxButton.subviewSpacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: YDSBoxButton.subviewSpacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: size.padding+YDSBoxButton.subviewSpacing/2,
                                                  bottom: 0,
                                                  right: size.padding+YDSBoxButton.subviewSpacing/2)
        }
        
        //  위에서 걸러지지 않은 5가지 경우
        //  text == nil 인 경우 4가지
        //  leftIcon == nil && rightIcon == nil 인 경우 2가지
        //  둘의 합집합 5가지에 대응합니다.
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: size.padding, bottom: 0, right: size.padding)
    }

}

extension UIButton {
    internal func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color?.cgColor ?? UIColor.clear.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}

//
//  YDSTopBarButton.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

/**
 YDSNavigationController와
 YDSTopBar 또는 이를 상속받는 TopBar에서 사용하길 권장하는 Button 입니다.
 PlainButton과 크게 비슷하지만 설정 가능 범위가 보다 좁아졌고
 패딩, 타이포 스타일이 다릅니다.
 */
public class YDSTopBarButton: UIButton {

    //  MARK: - 외부에서 지정할 수 있는 속성
    
    /**
     버튼을 비활성화 시킬 때 사용합니다.
     */
    public var isDisabled: Bool = false {
        didSet {
            self.isEnabled = !isDisabled
            setColor()
        }
    }
    
    /**
     기본 속성을 override한 후 didSet을 설정하여
     값이 바뀔 때 ( = 버튼을 누르거나 땠을 때 ) 그에 맞춰 색을 바꿔줍니다.
     */
    public override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                setTintColorBasedOnIsHighlighted()
            }
        }
    }
    
    //  MARK: - 내부에서 사용되는 변수

    /**
     버튼의 아이콘, 글자 컬러입니다.
     */
    private var fgColor: UIColor?
    
    /**
     버튼이 pressed 되었을 때 아이콘, 글자 컬러입니다.
     */
    private var fgPressedColor: UIColor?
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    /**
     내부에서 사용되는 각종 레이아웃 관련 수치입니다.
     */
    private enum Dimension {
        enum content {
            static let imageSize: CGFloat = 24
            enum Padding {
                static let horizontal: CGFloat = 8
            }
        }
    }
    
    //  MARK: - 메소드
    
    /**
     텍스트만 들어가는 버튼을 생성합니다. 이 버튼은 TopBar에만 사용하길 권장합니다.
     
     - Parameters:
        - text: 버튼에 들어갈 글귀입니다.
     */
    public init(text: String?) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        setupView()
    }
    
    /**
     이미지만 들어가는 버튼을 생성합니다. 이 버튼은 TopBar에만 사용하길 권장합니다.
     
     - Parameters:
        - image: 버튼에 들어갈 이미지입니다.
     */
    public init(image: UIImage?) {
        super.init(frame: .zero)
        self.setImage(image?
                        .resize(to: Dimension.content.imageSize)
                        .withRenderingMode(.alwaysTemplate),
                      for: .normal)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     뷰를 세팅합니다.
     */
    private func setupView() {
        setProperties()
        setColor()
    }
    
    /**
     각종 프로퍼티를 세팅합니다.
     */
    private func setProperties() {
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false

        self.titleLabel?.font = YDSFont.button0
        self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                              left: Dimension.content.Padding.horizontal,
                                              bottom: 0,
                                              right: Dimension.content.Padding.horizontal)
    }
    
    /**
     버튼의 컬러를 세팅합니다.
     */
    private func setColor() {
        if isDisabled {
            fgColor = YDSColor.buttonDisabled
            fgPressedColor = YDSColor.buttonDisabled
        } else {
            fgColor = YDSColor.buttonNormal
            fgPressedColor = YDSColor.buttonNormalPressed
        }
        
        setTitleColor(fgColor, for: .normal)
        setTitleColor(fgPressedColor, for: .highlighted)
        
        setTintColorBasedOnIsHighlighted()
    }
    
    /**
     setTintColorBasedOnIsHighlighted()
     isHighlighted 값에 맞추어 tintColor를 변경합니다.
     */
    private func setTintColorBasedOnIsHighlighted() {
        self.tintColor = !isHighlighted
            ? fgColor
            : fgPressedColor
    }

}
